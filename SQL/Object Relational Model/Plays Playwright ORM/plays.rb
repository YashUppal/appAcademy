require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute("SELECT * FROM plays WHERE title = ?",title)
    return Play.new(data.first)
  end

  def self.find_by_playwright(name)
    data = PlayDBConnection.instance.execute(<<-SQL,name)
      SELECT
        title
      FROM
        plays
      JOIN
        playwrights
      ON
        plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?
    SQL
    
    return data.map { |play| play["title"] }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_reader :id, :name, :birth_year
  attr_writer :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    return data.map { |row| Playwright.new(row) }
  end

  def self.find_by_name(name)
    rows = PlayDBConnection.instance.execute(<<-SQL,name)
      SELECT
        title
      FROM
        plays
      JOIN
        playwrights
      ON
        plays.playwright_id = playwrights.id
      WHERE
        name = ?
    SQL
    return rows.map { |row| row['title'] }
  end

  def initialize(row)
    # @id = row['id']
    @name = row['name']
    @birth_year = row['birth_year']
  end

  def create
    # If the entry already exists, do nothing
    raise "#{self.name} already exists in the database" if self.id

    PlayDBConnection.instance.execute(<<-SQL,self.name,self.birth_year)
      INSERT INTO
        playwrights(name,birth_year)
      VALUES
        (?,?)
    SQL

    inserted_id = PlayDBConnection.instance.execute("SELECT id FROM playwrights WHERE name = ? AND birth_year = ?",self.name,self.birth_year)
    self.id = inserted_id.first['id']
  end

  def update
    raise "#{self.name} doesn't exist in the database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?  
    SQL
  end

  def get_plays
    raise "#{self.name} doesn't exist in the database" unless self.id
    rows = PlayDBConnection.instance.execute(<<-SQL,self.id)
      SELECT
        title
      FROM
        plays
      JOIN
        playwrights
      ON
        plays.playwright_id = playwrights.id
      WHERE
        playwright_id = ?
    SQL

    return rows.map { |row| row['title'] }
  end
end
class Item

  attr_reader :title, :deadline, :description

  def self.valid_date?(date_string)
    # date should be of format 'YYYY-MM-DD'

    date_arr = date_string.split("-")
    return false if date_arr.length != 3
    year = date_arr[0]
    month = date_arr[1].to_i
    day = date_arr[2].to_i

    (year.length == 4) && (month >= 1 && month <= 12 ) && (day >= 1 && day <= 31)
  end

  def initialize(title, deadline, description)
    begin
      if Item.valid_date?(deadline)
      @title = title
      @description = description
      @deadline = deadline
      else
        raise
      end
    rescue
      puts "invalid date :( "
    end
  end

  def title=(new_title)
    @title = new_title
  end

  def deadline=(new_deadline)
    begin 
      if Item.valid_date?(new_deadline)
        @deadline = new_deadline
      else
        raise
      end
    rescue
      print "\nInvalid date :(\n\n"
    end
  end

  def description=(new_description)
    @description = new_description
  end
end
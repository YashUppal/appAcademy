class Tile

  attr_reader :value, :covered, :flagged
  attr_writer :value, :covered, :flagged

  def initialize(value)
    @value = value
    @covered = true
    @flagged = false
  end

end
require 'colorized_string'

class Tile

  attr_reader :value, :given
  attr_writer :value

  def initialize(value, given)
    @given = given
    @value = value
  end

  def print_value
    puts self.value
  end
end
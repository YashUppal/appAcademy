require 'colorized_string'

class Tile

  attr_reader :value, :given, :previously_guessed
  attr_writer :value,:previously_guessed

  def initialize(value, given)
    @given = given
    @value = value
    @previously_guessed = [1]
  end

  def print_value
    puts self.value
  end
end
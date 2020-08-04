require_relative 'cursor.rb'

class HumanPlayer
  def initialize(color,display)
    @color = color
    @display = display
    # @cursor = Cursor.new
  end

  def make_move
    starting = @display.run
    ending = @display.run
    return [starting,ending]
  end
end
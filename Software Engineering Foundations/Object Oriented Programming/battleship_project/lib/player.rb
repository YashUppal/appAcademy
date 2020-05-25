class Player
  # Part 3

  def get_move
    puts "enter a position with coordinates separated with a space like `4 7`"
    input = gets.chomp
    input.split.map(&:to_i)
  end
end

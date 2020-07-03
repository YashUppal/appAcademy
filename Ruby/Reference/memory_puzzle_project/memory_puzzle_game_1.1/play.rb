require_relative 'game.rb'

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to Memory Puzzle Solver"
  print "Enter a difficulty level between 2-26 (only even) : "
  difficulty = gets.chomp.to_i
  if difficulty.even?
    puts
    print "AI? (Y/N) : "
    inp = gets.chomp
    ai = false
    ai = true if inp.include?("Y") 
    puts
    print "Would you like some bombs? (Y/N) : "
    inp = gets.chomp
    bombs = false
    bombs = true if inp.include?("Y")
    g = Game.new(difficulty,ai,bombs)
    g.play
  else
    print "Enter an even value :("
  end
end
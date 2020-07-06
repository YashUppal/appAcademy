require_relative 'game.rb'

if __FILE__ == $PROGRAM_NAME
  system("clear")
  # print ColorizedString["Welcome to Sudoku!\n\n"].colorize(:light_cyan)
  sudoku_logo = "
 __           _       _          
/ _\\_   _  __| | ___ | | ___   _ 
\\ \\| | | |/ _` |/ _ \\| |/ / | | |
_\\ \\ |_| | (_| | (_) |   <| |_| |
\\__/\\__,_|\\__,_|\\___/|_|\\_\\\\__,_|
                                 
"
  print ColorizedString["Welcome to Sudoku!\n\n"].colorize(:light_cyan)
  print ColorizedString["#{sudoku_logo}\n\n"].colorize(:light_cyan)
  sleep(3)
  print "Enter a filename : "
  filename = gets.chomp
  path = "puzzles/puzzles/#{filename}"
  
  game = Game.new(path)
  game.play
end
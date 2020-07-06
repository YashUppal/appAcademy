require_relative 'game.rb'

if __FILE__ == $PROGRAM_NAME
  system("clear")
  solver_logo = "
 __           _       _            __       _                
/ _\\_   _  __| | ___ | | ___   _  / _\\ ___ | |_   _____ _ __ 
\\ \\| | | |/ _` |/ _ \\| |/ / | | | \\ \\ / _ \\| \\ \\ / / _ \\ '__|
_\\ \\ |_| | (_| | (_) |   <| |_| | _\\ \\ (_) | |\\ V /  __/ |   
\\__/\\__,_|\\__,_|\\___/|_|\\_\\\\__,_| \\__/\\___/|_| \\_/ \\___|_|   
                                                             
"
  print ColorizedString["Welcome to Sudoku Solver!\n\n"].colorize(:light_cyan)
  print ColorizedString["#{solver_logo}\n\n"].colorize(:light_cyan)
  sleep(3)
  print "Enter a filename you want to solve : "
  filename = gets.chomp
  path = "puzzles/puzzles/#{filename}"
  
  game = Game.new(path)
  game.play
end
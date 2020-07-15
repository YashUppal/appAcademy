require_relative 'game.rb'
require 'colorized_string'

def welcome
  system("clear")
  welcome_banner = "
   __  __ _____ _   _ ______  _______          ________ ______ _____  ______ _____  
  |  \\/  |_   _| \\ | |  ____|/ ____\\ \\        / /  ____|  ____|  __ \\|  ____|  __ \\ 
  | \\  / | | | |  \\| | |__  | (___  \\ \\  /\\  / /| |__  | |__  | |__) | |__  | |__) |
  | |\\/| | | | | . ` |  __|  \\___ \\  \\ \\/  \\/ / |  __| |  __| |  ___/|  __| |  _  / 
  | |  | |_| |_| |\\  | |____ ____) |  \\  /\\  /  | |____| |____| |    | |____| | \\ \\ 
  |_|  |_|_____|_| \\_|______|_____/    \\/  \\/   |______|______|_|    |______|_|  \\_\\
                                                                                                                                                                      
"

  puts ColorizedString[welcome_banner].light_blue

  print ColorizedString["\nInstructions: Reveal the squares, avoid the bombs, flag or unflag any suspicious positions and take note of the numbers :)\n\n"].light_blue

  print ColorizedString["\nKey Mappings:\n"].light_blue
  print ColorizedString["\nReveal: rxy to reveal the index x,y.\n\n"].light_blue
  print ColorizedString["\nFlag: fxy to flag the index x,y.\n\n"].light_blue
  print ColorizedString["\nUnflag: uxy to unflag the index x,y.\n\n"].light_blue
  print ColorizedString["\nSave: sav to Save the game.\n\n"].light_blue
  print ColorizedString["\nExit: exi to Exit the game.\n\n"].light_blue


  
  sleep(4)
  system("clear")
end

welcome


print "Would you like to continue where you left off? (y/n) "
cont = gets.chomp


begin
  if cont.downcase == "y"
    g = YAML.load(File.read("save.yml"))
    g.run
  else
    print "Please enter a size for the grid : "
    grid_size = gets.chomp.to_i
    g = Game.new(grid_size)
    g.run
  end
rescue
  puts "No savegame found :("
end

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

  sleep(2)
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

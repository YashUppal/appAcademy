require_relative 'board.rb'
require 'yaml'
require 'io/console'

class Game
  attr_reader :board

  def initialize(size)
    @board = Board.new(size)
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end


  def run
    until self.game_over?
      system("clear")

      self.board.render
      puts
      print "Enter a command on your keyboard (e.g r12 f32 u44) :  "

      command = self.read_char
      print command
      x = self.read_char
      print x
      y = self.read_char
      print y
      sleep(0.5)


      if command == "f"
        self.board.flag([x.to_i,y.to_i])
      elsif command == "u"
        self.board.unflag([x.to_i,y.to_i])
      elsif command == "r"
        self.board.reveal([x.to_i,y.to_i])
      elsif command + x + y == "sav"
        print "\n\nSaving game...\n"; sleep(2)
        File.open("save.yml","w") { |file| file.write(self.to_yaml) }
      elsif command + x + y == "exi"
        puts "\n\nDo you want to save before quitting? (y/n)\n"
        save = gets.chomp.downcase
        if save == "y"
          puts "Saving..."
          File.open("save.yml","w") { |file| file.write(self.to_yaml) }
          exit
        else
          exit
        end
      end
    end

    print "\nCongrats! You've won\n"
  end

  # def run
  #   until self.game_over?
  #     system("clear")

  #     self.board.render
  #     puts
  #     print "Enter a command (e.g f 01 or r 23 or uf 55) :  "
  #     inp = gets.chomp
  #     command = inp.split.first
  #     idx = inp.split.last.split("").map(&:to_i)

  #     if command == "f"
  #       self.board.flag(idx)
  #     elsif command == "uf"
  #       self.board.unflag(idx)
  #     elsif command == "r"
  #       self.board.reveal(idx)
  #     elsif command == "save"
  #       puts "Saving game..."; sleep(2)
  #       File.open("save.yml","w") { |file| file.write(self.to_yaml) }
  #     elsif command == "exit"
  #       puts "Do you want to save before quitting? (y/n)"
  #       save = gets.chomp.downcase
  #       if save == "y"
  #         puts "Saving..."
  #         File.open("save.yml","w") { |file| file.write(self.to_yaml) }
  #         exit
  #       else
  #         exit
  #       end
  #     end
  #   end

  #   print "\nCongrats! You've won\n"
  # end

  def game_over?
    boxes = Array.new

    self.board.grid.each do |row|
      row.each do |tile|
        if tile.value != "💣"
          boxes << tile
        end
      end
    end
    boxes.map(&:covered).none? { |covered| covered }
  end

end
require 'set'
class ComputerPlayer

  attr_reader :known_cards, :matched_cards, :grid_size

  def initialize(grid_size)
    @known_cards = Hash.new
    @matched_cards = Array.new
    @grid_size = grid_size

  end

  def prompt
    # prompt user for input
    puts
    puts "Please enter the position of the card you would like to flip (eg 2,3)"
  end

  def get_input
    # could be done faster, checks earlier matches as well, which is time consuming
    idx = self.rand_idx
    if !self.matched_cards.empty?
      point = self.matched_cards.pop
      @known_cards.delete(point)
      return point
    else
      self.match_form
      return idx
    end
  end

  def rand_idx
    # return a random index within grid's boundaries
    return [rand(0..grid_size),rand(0..grid_size)]
  end

  def receive_revealed_card(pos,value)
    # receives revealed card values
    @known_cards[pos] = value
  end

  def receive_match(pos1,pos2)
    # recieve the matched cards
    if pos1 && pos2
      matched_cards << [pos1,pos2]
    end
  end

  def match_form
    # checks if any matching pairs exist in known cards
    self.known_cards.each do |key,value|
      if self.known_cards.count { |k,v| v == value } == 2
        self.matched_cards << key
        # self.history << key
      end
    end
  end
end
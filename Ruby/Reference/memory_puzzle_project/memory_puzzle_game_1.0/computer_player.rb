class ComputerPlayer

  attr_reader :known_cards, :matched_cards, :history

  def initialize
    @known_cards = Hash.new
    @matched_cards = Array.new
    @history = Set.new
  end

  def prompt
    puts "Please enter the position of the card you would like to flip (eg 2,3)"
  end

  def get_input
    # could be done faster, checks earlier matches as well, which is time consuming
    idx = self.rand_idx

    if !self.matched_cards.empty?
      point = self.matched_cards.pop
      self.history << point
      return point
    else
      self.match_form
      return idx
    end
  end

  def rand_idx
    return [rand(0..3),rand(0..3)]

  end

  def receive_revealed_card(pos,value)
    @known_cards[pos] = value
  end

  def receive_match(pos1,pos2)
    if pos1 && pos2
      matched_cards << [pos1,pos2]
    end
  end

  def match_form
    self.known_cards.each do |key,value|
      if self.known_cards.count { |k,v| v == value } == 2
        if !self.history.include?(key)
          self.matched_cards << key
        end
      end
    end
  end
end
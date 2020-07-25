class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @opponents_cup = { name1 => 13, name2 => 6 }
    @cups_map = { 6 => name1, 13 => name2 }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    iterator = 0
    while iterator < self.cups.length
      self.cups[iterator] = [:stone, :stone, :stone, :stone]
      iterator += 1
    end

    self.cups[6].clear; self.cups[13].clear
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise StandardError.new "Invalid starting cup"
    end

    if self.cups[start_pos].empty?
      raise StandardError.new "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    # empty the selected cup
    stone_count = self.cups[start_pos].length
    self.cups[start_pos].clear

    idx = start_pos+1

    while stone_count > 0

      if idx == @opponents_cup[current_player_name]
        idx = self.next_index(idx)
      end

      self.cups[idx] << :stone; stone_count -= 1;
      idx = self.next_index(idx) if stone_count > 0
    end

    self.render

    return next_turn(idx)

  end

  def next_index(idx)
    if idx == 13
      return 0
    else
      return idx+1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if self.cups[ending_cup_idx].length == 1 && (ending_cup_idx != 6 && ending_cup_idx != 13)
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0...6].all? { |cups| cups.empty? } || self.cups[7...13].all? { |cups| cups.empty? }

  end

  def winner
    player_1_cups = self.cups[6].length
    player_2_cups = self.cups[13].length
    if player_1_cups == player_2_cups
      return :draw
    elsif player_1_cups > player_2_cups
      return @cups_map[6]
    else
      return @cups_map[13]
    end
  end
end

class ComputerPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    pos = legal_positions.sample
    print "\n#{pos} is the chosen position by computer\n"
    pos
  end

end
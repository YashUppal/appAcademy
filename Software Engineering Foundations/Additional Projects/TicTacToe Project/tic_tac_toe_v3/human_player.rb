class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    while true
      print "\n #{self.mark} Enter your position as 'row col' : "

      downcase = ("a".."z")
      upcase = ("A".."Z")

      input = gets.chomp
      begin
        raise if input.length != 3
        input.each_char do |char|
          raise if downcase.include?(char) || upcase.include?(char)
        end
      rescue
        print "\nInvalid position format :(\n"
      end

      pos = input.split.map(&:to_i)

      if legal_positions.include?(pos)
        return pos
        break
      else
        print "\n #{pos} is not a legal position :(\n"
      end
    end
  end
end
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  # Part 1

  attr_reader :pegs

  def self.valid_pegs?(chars_arr)
    chars_arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars_arr)
    if Code::valid_pegs?(chars_arr)
      @pegs = chars_arr.map(&:upcase)
    else
      raise 'Invalid characters'
    end
  end

  def self.random(length)
    random_chars = []
    length.times do 
      random_char = POSSIBLE_PEGS.keys.sample
      random_chars << random_char
    end
    return Code.new(random_chars)
  end

  def self.from_string(string)
    return Code.new(string.split(""))
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end
end

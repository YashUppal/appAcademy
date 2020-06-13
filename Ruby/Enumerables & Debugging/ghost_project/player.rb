class Player

  attr_reader :name, :ai

  def initialize(name)
    @name = name
    @ai = false
  end

  def guess
    word = gets.chomp
  end

  def alert_invalid_guess(guess)
    alphabets = ("a".."z")

    if !alphabets.include?(guess)
      return true
    end
    return false
  end
end
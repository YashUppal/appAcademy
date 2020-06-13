class Player

  attr_reader :name

  def initialize(name)
    @name = name
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
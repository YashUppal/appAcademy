class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length) { |ele| "_" } # => @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = Array.new
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end 

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    @secret_word.split("").map.with_index do |ele, idx|
      idx if ele == char
    end.compact # compact => remove 'nil' from an array
  end

  def fill_indices(char, indices_arr)
    indices_arr.each do |idx|
      @guess_word[idx] = char
    end
  end

  # PART 2

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char: "
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @secret_word == @guess_word.join("")
      puts "WIN"
      return true
    else
      return false
    end
  end 

  def lose?
    if remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      false
    end
  end

  def game_over?
    if win?
      puts @secret_word
      return true
    elsif lose?
      puts @secret_word
      return true
    end
    false
  end
end

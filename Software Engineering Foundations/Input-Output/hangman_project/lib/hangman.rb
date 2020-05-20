class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length) { |ele| "_"}
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

end

require 'set'

class AiPlayer
  attr_reader :dictionary, :ai, :name

  def initialize(name,dictionary)
    @name = name
    @dictionary = dictionary
    @ai = true
  end

  def guess(num_players, fragment)
    return ("a".."z").to_a.sample if fragment == ""

    losing_moves = []
    winning_moves = []

    possibilities_hash = Hash.new
    winning_possibles = Hash.new { |hash,key| hash[key] = Array.new }

    ("a".."z").each do |char|
      losing_moves << char if @dictionary.any?{|word| word.start_with?(fragment+char)}
    end

    possibles = dictionary.select do |word|
      word.start_with?(fragment)
    end

    ("a".."z").each do |char|
      possibilities_hash[char] = dictionary.select {|word| word.start_with?(fragment+char)}
    end

    possibilities_hash.each do |key, value|
      value.each do |word|
        if word[fragment.length-1..-1].length <= num_players #&& word[word.index(key)..-1].length > 0
          winning_possibles[key] << word
        end
      end
    end

    if winning_possibles.keys.length.zero?
      return losing_moves.sample
    else
      return winning_possibles.keys.sample
    end
  end

  def alert_invalid_guess(guess)
    alphabets = ("a".."z")
    if !alphabets.include?(guess)
      return true
    end
    return false
  end
end
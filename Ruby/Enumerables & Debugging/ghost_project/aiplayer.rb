class AiPlayer

  attr_reader :dictionary

  def initialize(name,dictionary)
    @name = name
    @dictionary = dictionary
    @human = false
  end

  def guess(num_players, fragment)
    losing_moves = []
    winning_moves = []

    possibilities_hash = Hash.new
    winning_possibles = Hash.new { |hash,key| hash[key] = Array.new }
    ("a".."z").each do |char|
      losing_moves << char if dictionary.include?(fragment + char)
    end

    possibles = dictionary.select do |word|
      word.start_with?(fragment)
    end

    ("a".."z").each do |char|
      possibilities_hash[char] = dictionary.select {|word| word.start_with?(fragment+char)}
    end


    possibilities_hash.each do |key, value|
      value.each do |word|
        if word[word.index(key)..-1].length < num_players && word[word.index(key)..-1].length > 1
          winning_possibles[key] << word
        end
      end
    end

    p winning_possibles.keys
    p losing_moves

    if winning_possibles.keys.length.zero?
      return losing_moves.sample
    else
      return winning_possibles.keys.sample
    end
  end
end
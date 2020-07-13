require 'set'

class WordChainer

  attr_reader :dictionary, :current_words, :all_seen_words
  attr_writer :current_words

  def initialize(dictionary_file_name)
    @dictionary = IO.readlines(dictionary_file_name,chomp: true).to_set
    @current_words = Set.new
    @all_seen_words = Hash.new
  end

  def adjacent_words(word)
    dictionary.select do |dictionary_word|
      self.word_difference(word,dictionary_word)
    end
  end

  def word_difference(word1,word2)
    # returns true if difference between two words is just one letter
    if word1.length == word2.length
      word1_split = word1.split("")
      word2_split = word2.split("")
      if ((word1_split - word2_split).length == 1) && ((word2_split - word1_split).length == 1)
        return true
      end
    end
    return false
  end

  def run(source,target)
    self.current_words << source
    self.all_seen_words[source] = nil

    while !self.current_words.empty?
      new_current_words = Set.new
      new_current_words = self.explore_current_words
      
      if self.all_seen_words.has_key?(target)
        break
      end
      self.current_words = new_current_words
    end

    puts self.build_path(target).reverse
  end

  def explore_current_words
    new_current_words = Set.new
    self.current_words.each do |word|
      adj_words_arr = self.adjacent_words(word)
      adj_words_arr.each do |adj_word|
        if !self.all_seen_words.include?(adj_word)
          new_current_words << adj_word
          self.all_seen_words[adj_word] = word
        end
      end
    end
    return new_current_words    
  end

  def build_path(target)
    path = Array.new
    while true
      path << target
      break if self.all_seen_words[target].nil?
      target = all_seen_words[target]
    end
    return path
  end
end
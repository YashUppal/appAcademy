require_relative 'word_chainer.rb'

default_dictionary = "dictionary.txt"

source,target = ARGV.first, ARGV.last

source ||= "duck"
target ||= "ruby"

wc = WordChainer.new(default_dictionary)
puts "Importing Dictionary..."
puts "Building Path..."
wc.run(source,target)


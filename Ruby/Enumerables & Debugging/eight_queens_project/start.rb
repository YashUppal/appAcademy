require_relative 'nqueen.rb'

puts
puts "Hi, welcome to the n-queen puzzle solver"
puts
print "Enter the number of queens (n) to be placed on nxn board: "
n = gets.chomp.to_i

# queen = NQueens.new(n)

puts 
print "Do you want to see the process? (y/n) "

process = gets.chomp

if process.downcase.include?("y")
  queen = NQueens.new(n,0.1)
else
  queen = NQueens.new(n,0)
end

queen.place
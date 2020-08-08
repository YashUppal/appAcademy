class Array
  def my_uniq
    duplicated = []
    self.each do |ele|
      duplicated << ele if !duplicated.include?(ele)
    end
    return duplicated
  end
  
  def two_sum
    pairs = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        if (self[i] + self[j]).zero? && !(self[i].zero? || self[j].zero?)
          pairs << [i,j]
        end
        j += 1
      end
      i += 1
    end
    return pairs
  end

  def my_transpose
    transposed = []
    i = 0
    while i < self.length
      j = 0
      row = []
      while j < self.length
        row << self[j][i]
        j += 1
      end
      transposed << row
      i += 1
    end
    return transposed
  end
end

class TowerOfHanoi
  attr_reader :pile_one,:pile_two,:pile_three

  def initialize
    @pile_one, @pile_two, @pile_three = Array.new([4,3,2,1]), Array.new, Array.new
  end

  def move(from,to)
    from_disc = eval "self.#{from}.last"
    to_disc = eval "self.#{to}.last"

    if !to_disc.nil?
      raise ArgumentError if to_disc < from_disc
    end

    eval "self.#{to}.push(self.#{from}.pop)"
  end

  def won?
    self.pile_one == [4,3,2,1] || self.pile_two == [4,3,2,1] || self.pile_three == [4,3,2,1]
  end

  def render
    print "#{self.pile_one}\n"
    print "#{self.pile_two}\n"
    print "#{self.pile_three}\n"
  end

  def play
    system("clear")
    puts "Welcome to Towers Of Hanoi!"
    sleep(3)
    while true
      self.render
      puts "Enter your 'from' and 'to' pile (e.g 'pile_one pile_two'): "
      input = gets.chomp.split(" ")
      self.move(input.first,input.last)
      if self.won?
        puts "You've won!!"
        sleep(3)
        break
      end
      system("clear")
    end
  end
end
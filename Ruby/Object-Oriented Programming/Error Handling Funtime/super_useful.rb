# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if maybe_fruit == "coffee"
    raise TypeError
  elsif FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise ArgumentError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue ArgumentError => e
    puts "Not a fruit :("
  rescue TypeError => e
    puts "Yummmm..Coffee :D"
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)

    begin
      raise ArgumentError if yrs_known < 5
      @yrs_known = yrs_known
    rescue
      puts "Timeframe too short :("
      exit
    end

    begin
      raise ArgumentError if name.length <= 0
      @name = name
    rescue
      puts "No Name Friend ? :("
      exit
    end

    begin
      raise ArgumentError if fav_pastime.length <= 0
      @fav_pastime = fav_pastime
    rescue
      puts "No favorite pastime? :("
      exit
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end



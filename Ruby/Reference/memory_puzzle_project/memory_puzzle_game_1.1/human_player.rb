class HumanPlayer

  def initialize
  end

  def prompt
    # prompt user for input
    puts
    print "Please enter the position of the card you would like to flip (eg 2,3) : "
  end

  def get_input
    # get input from user
    gets.chomp.split(",").map!(&:to_i)
  end

  def receive_revealed_card(pos,value)
    # dummy
  end

end
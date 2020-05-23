require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_instance)
    puts @secret_code.num_exact_matches(code_instance)
    puts @secret_code.num_near_matches(code_instance)
  end

  def ask_user_for_guess
    puts "Enter a code"
    input = gets.chomp
    generated = Code.from_string(input)
    print_matches(generated)
    generated.pegs == @secret_code.pegs
  end
end

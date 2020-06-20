require_relative 'maze_solver_1.1.rb'
require_relative 'maze_solver_1.0.rb'

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to maze solver!"
  puts "Please Enter a mazefile"
  print "mazefile: "
  puts
  maze = gets.chomp
  begin
    mazefile = IO.readlines(maze,chomp:true)
  rescue
    puts "Enter a valid mazefile"
    return 0
  end
  puts
  print "Do you want to traverse diagonally? (y/n) : "
  dir = gets.chomp

  if dir.downcase.split.include?("y")
    solver = MazeSolverDiag.new(mazefile)
    solver.translate
    if !solver.find_end
      puts "No End in sight :("
    elsif !solver.starting_point
      puts "No Starting point :("
    end
    solver.search
  else
    solver = MazeSolver.new(mazefile)
    solver.translate
    if !solver.find_end
      puts "No End in sight :("
    elsif !solver.starting_point
      puts "No Starting point :("
    end
    solver.search
  end

end
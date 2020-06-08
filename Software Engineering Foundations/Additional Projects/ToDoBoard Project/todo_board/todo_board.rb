require_relative 'list.rb'

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    print "\nEnter a command : "
    command, *args = gets.chomp.split

    case command
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      @list.up(*(args.map(&:to_i)))
    when 'down'
      @list.down(*(args.map(&:to_i)))
    when 'swap'
      @list.swap(*(args.map(&:to_i)))
    when 'sort'
      @list.sort_by_date!
    when 'priority'
      print "\n"
      print "#{@list.print_full_item(0)}"
    when 'print'
      if args == []
        @list.print
      else
        @list.print_full_item(args.first.to_i)
      end
    when 'quit'
      return false
    else
      print "\nInvalid command\n"
    end
    true
  end

  def run
    running = true
    while running
      running = self.get_command
    end
  end
end
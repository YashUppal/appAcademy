require_relative 'list.rb'

class TodoBoard
  def initialize
    # @list = List.new(label)
    @lists = Hash.new { |key, value| key[value] = Array.new }
  end

  def get_command
    print "\nEnter a command : "
    command, *args = gets.chomp.split

    case command
    when 'help'
      puts " 'ls' - List labels of all the lists"
      puts " 'mklist' - Make a new list. USAGE 'mklist <new_list_label>'"
      puts " 'showall' - Show all lists. USAGE 'showall'"
      puts " 'mktodo' - Make a To Do item. USAGE 'mktodo <list_label> <item_title> <item_deadline> <optional_item_description>'"
      puts " 'toggle' - Toggle an item done or undone. USAGE 'toggle <list_label> <item_index>'"
      puts " 'rm' - Remove an item. USAGE 'rm <list_label> <item_index>'"
      puts " 'purge' - Remove all done items. USAGE 'purge <list_label>'"
      puts " 'up' - Move an item up in the list. USAGE 'up <list_label> <item_index> <optional_amount>'"
      puts " 'down' - Move an item down in the list. USAGE 'down <list_label> <item_index> <optional_amount>'"
      puts " 'swap' - Swap positions of two items. USAGE 'swap <list_label> <item_index_1> <item_index_2>"
      puts " 'sort' - Sort items by deadline. USAGE 'sort <list_label>"
      puts " 'priority' - Print first item. USAGE 'priority <list_label>'"
      puts " 'print' - Print an item. USAGE 'print <list_label> <optional_index>'"
      puts " 'quit' - Quit the program"
    when 'mklist'
      @lists[args.first] = List.new(args.first)
    when 'ls'
      puts @lists.keys
    when 'showall'
      @lists.each do |key_list_label,value_list|
        value_list.print
      end
    when 'mktodo'
      # @lists[args.first] << @list.add_item(*args)
      @lists[args.shift].add_item(*args)
    when 'toggle'
      list_label = args.first
      item_idx = args.last.to_i
      @lists[list_label].toggle_item(item_idx)

    when 'rm'
      list_label = args.first
      item_index = args.last.to_i

      @lists[list_label].remove_index(item_index)

    when 'purge'
      list_label = args.first
      @lists[list_label].purge
    when 'up'
      list_label = args.shift
      @lists[list_label].up(*(args.map(&:to_i)))
    when 'down'
      list_label = args.shift
      @lists[list_label].down(*(args.map(&:to_i)))
    when 'swap'
      list_label = args.shift
      @lists[list_label].swap(*(args.map(&:to_i)))
    when 'sort'
      list_label = args.first
      @lists[list_label].sort_by_date!
    when 'priority'
      list_label = args.first
      print "\n"
      print "#{@lists[list_label].print_full_item(0)}"
    when 'print'
      list_label = args.shift
      if args == []
        @lists[list_label].print
      else
        @lists[list_label].print_full_item(args.first.to_i)
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

board = TodoBoard.new()
board.run


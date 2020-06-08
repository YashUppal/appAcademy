require_relative 'item.rb'

class List

  attr_reader :label

  def initialize(label)
    @label = label
    @items = Array.new
  end

  def label=(new_label)
    @label = new_label
  end

  def add_item(title, deadline, description="")
    if Item.valid_date?(deadline)
      @items.push(Item.new(title,deadline,description))
      return true
    else
      return false
    end
  end

  def size
    @items.length
  end

  def valid_index?(index)
    index < self.size && index >= 0
  end

  def swap(index_1, index_2)
    if self.valid_index?(index_1) && self.valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      return true
    else
      return false
    end
  end

  def priority
    @items.first
  end

  def print
    puts "#{"".ljust(50,"-")}"
    puts "#{label.rjust(25," ")} #{"".ljust(25," ")}"
    puts "#{"".ljust(50,"-")}"
    puts "#{"Index".ljust(5," ")} | #{"Item".ljust(28," ")} | #{"Deadline".ljust(17," ")}"
    puts "#{"".ljust(50,"-")}"
    
    @items.each_with_index do |item, item_idx|
      puts "#{item_idx.to_s.ljust(5," ")} | #{item.title.ljust(28," ")} | #{item.deadline.ljust(17," ")}"
    end

    puts "#{"".ljust(50, "-")}"
  end

  def print_full_item(index)
    if valid_index?(index)
      puts "#{"".ljust(50,"-")}"
      puts "#{@items[index].title.ljust(35," ")}#{@items[index].deadline.rjust(15," ")}"
      puts "#{@items[index].description.ljust(50," ")}"
      puts "#{"".ljust(50,"-")}"
    end
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(index, amount=1)
    if self.valid_index?(index)
      to_swap = @items[index]
      # swap_idx = @items.index(to_swap)
      while amount > 0
        swap_idx = @items.index(to_swap)
        self.swap(swap_idx, swap_idx-1) if swap_idx != 0
        amount -= 1
      end
      return true
    else
      return false
    end
  end

  def down(index, amount=1)
    if self.valid_index?(index)
      to_move = @items[index]
      iterator = 0
      while iterator < amount
        index = @items.index(to_move)
        self.swap(index, index+1)
        iterator += 1
      end
      return true
    else
      return false
    end
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end

end

# load 'list.rb'
# list = List.new("Goals")
# list.add_item("asdf","2020-12-12","asdf")
# list.print
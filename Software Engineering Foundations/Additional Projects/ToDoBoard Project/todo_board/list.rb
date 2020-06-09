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
    
    puts "#{"".ljust(70,"-")}"
    puts "#{label.rjust(35," ")} #{"".ljust(35," ")}"
    puts "#{"".ljust(70,"-")}"
    puts "#{"Index".ljust(5," ")} | #{"Item".ljust(28," ")} | #{"Deadline".ljust(17," ")} | #{"Done".ljust(20," ")}"
    puts "#{"".ljust(70,"-")}"

    @items.each_with_index do |item, item_idx|
      puts "#{item_idx.to_s.ljust(5," ")} | #{item.title.ljust(28," ")} | #{item.deadline.ljust(17," ")} | #{(item.done) ? ("✓".ljust(20, " ")) : ""}"
    end
    
    puts "#{"".ljust(70, "-")}"
  end

  def print_full_item(index)
    if valid_index?(index)
      puts "#{"".ljust(70,"-")}"
      puts "#{@items[index].title.ljust(35," ")}#{@items[index].deadline.rjust(15," ")}#{(@items[index].done) ? ("✓".rjust(15, " ")) : ""}"
      puts "#{@items[index].description.ljust(70," ")}"
      puts "#{"".ljust(70,"-")}"
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

  def toggle_item(index)
    @items[index].toggle
  end

  def remove_index(index)
    @items.delete_at(index)
  end

  def purge
    # @items = @items.select do |items|
    #   !items.done
    # end

    @items.each_with_index do |item, idx|
      @items.delete_at(idx) if item.done
    end
  end
end
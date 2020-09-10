require 'benchmark'

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    dequeued = @store.shift
    return dequeued
  end

  def peek
    return @store.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    popped = @store.shift
    return popped
  end

  def push(element)
    local_max = @store.first

    if local_max.nil? || local_max.last < element
      @store.unshift([element,element])
    else
      @store.unshift([element,local_max.last])
    end
  end

  def peek
    return @store.first.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end
end

class StackQueue
  def initialize
    @stack_1 = MyStack.new
    @stack_2 = MyStack.new
  end

  def enqueue(element)
    @stack_2.push(element)
    while !@stack_1.empty?
      @stack_2.push(@stack_1.pop)
    end
  end

  def dequeue
    while !@stack_2.empty?
      @stack_1.push(@stack_2.pop)
    end
    @stack_1.pop
  end

  def size
    if @stack_1.length > @stack_2.length
      return @stack_1.length
    else
      return @stack_2.length
    end
  end

  def empty?
    return true if (@stack_1.empty? && @stack_2.empty)
    return false
  end
end

class MinMaxStack
  def initialize
    @store = []
  end

  def pop
    popped = @store.shift
    return popped.last
  end

  def push(element)
    local_max = @store.first

    if local_max.nil? || local_max.last < element
      @store.unshift([element,element])
    else
      @store.unshift([element,local_max.last])
    end
  end

  def max
    @store.first.last
  end

  def min
    @store.last.first
  end

  def peek
    return @store.first.first
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end
end

class MinMaxStackQueue
  def initialize
    @stack_1 = MinMaxStack.new
    @stack_2 = MinMaxStack.new
  end

  def enqueue(element)
    @stack_2.push(element)
    while !@stack_1.empty?
      @stack_2.push(@stack_1.pop)
    end
  end

  def dequeue
    while !@stack_2.empty?
      @stack_1.push(@stack_2.pop)
    end
    @stack_1.pop
  end

  def size
    return [@stack_1.size, @stack_2.size].max
  end

  def empty?
    if (@stack_2.empty?)
      return true
    else
      return false
    end
  end

  def max
    if @stack_1.empty?
      return @stack_2.max
    else
      return @stack_1.max
    end
  end

  def min
    if @stack_1.empty?
      return @stack_2.min
    else
      return @stack_1.min
    end
  end
end

def windowed_max_range(array,window_size)
  current_max_range = nil
  i = 0
  while i <= array.length - window_size
    window = array[i..i+window_size-1]
    min_value = window.min
    max_value = window.max
    size = max_value - min_value
    if current_max_range.nil? || current_max_range < size
      current_max_range = size
    end

    i += 1
  end
  return current_max_range
end

def better_max_windowed_range(array,window_size)
  current_max_range = nil
  window = MinMaxStackQueue.new

  while !array.empty?
    window_size.times do
      window.enqueue(array.pop)
    end
    
    size = window.max - window.min

    if current_max_range.nil? || current_max_range < (size)
      current_max_range = (size)
    end

    while !window.empty?
      window.dequeue
    end
  end
  return current_max_range
end

Benchmark.bm do |x|
  x.report("windowed_max_range:") { windowed_max_range([1, 0, 2, 5, 4, 8], 2) }
  x.report("better_max_windowed_range:") { better_max_windowed_range([1, 0, 2, 5, 4, 8], 2) }
end
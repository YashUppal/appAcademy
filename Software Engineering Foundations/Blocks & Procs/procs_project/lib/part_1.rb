# implement your own map, select, count, any?, none?, all? methods

def my_map(arr, &block)
  mapped = []
  arr.each do |ele|
    mapped << block.call(ele)
  end
  mapped
end

def my_select(arr, &block)
  selected = []
  arr.each do |ele|
    selected << ele if block.call(ele)
  end
  selected
end

def my_count(arr, &block)
  count = 0
  arr.each do |ele|
    count += 1 if block.call(ele)
  end
  count
end

def my_any?(arr, &block)
  arr.each do |ele|
    return true if block.call(ele)
  end
  false
end

def my_all?(arr, &block)
  arr.each do |ele|
    return false if !(block.call(ele))
  end
  true
end

def my_none?(arr, &block)
  arr.each do |ele|
    return false if block.call(ele)
  end
  true
end
def sluggish_octopus
  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  biggest = ""
  fishes.each do |fish_outer|
    biggest = fish_outer
    fishes.each do |fish_inner|
      if fish_inner.length > biggest.length
        biggest = fish_inner
      end
    end
  end
  puts "Sluggish Octopus eats #{biggest}"
end

def dominant_octopus
  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  biggest = ""
  fishes = merge_sort(fishes)
  return fishes.last
end


def merge(arr1,arr2)
  
  merged = Array.new
  
  if arr1.length < arr2.length
    smaller = arr1.length
  elsif arr2.length < arr1.length
    smaller = arr2.length
  else
    smaller = arr1.length
  end
  
  i = 0
  j = 0
  while merged.length < (arr1.length + arr2.length)

    if arr1[i].nil? || arr2[j].nil?
      break
    end

    if arr1[i].length < arr2[j].length
      merged << arr1[i]
      i += 1
    elsif arr1[i].length > arr2[j].length
      merged << arr2[j]
      j += 1
    else
      merged << arr1[i]
      merged << arr2[j]
      i += 1
      j += 1
    end
  end

  merged += arr1[i..-1]
  merged += arr2[j..-1]

  return merged
end

def merge_sort(arr)
  if arr.length == 1 || arr.empty?
    return arr
  end

  part_1 = (arr[0...arr.length/2])
  part_2 = (arr[arr.length/2..-1])

  merge(merge_sort(part_1),merge_sort(part_2))
end

def clever_octopus
  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  longest_fish = fishes.first
  fishes.each do |fish|
    if fish.length > longest_fish.length
      longest_fish = fish
    end
  end
  return longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction,tiles_array)
  index = 0
  while index < tiles_array.length
    if direction == tiles_array[index]
      break
    end
    index += 1
  end
  return index
end 

new_tiles_data_structure = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction,new_tiles_data_structure)
  return new_tiles_data_structure[direction]
end
# Big O-ctopus and Biggest Fish

def sluggish_octopus
  # O(n^2)
  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  longest_fish = ""
  fishes.each do |fish_outer|
    fishes.each do |fish_inner|
      if fish_inner.length > fish_outer.length
        longest_fish = fish_inner
      end
    end
  end
  puts "Sluggish Octopus eats #{longest_fish}"
end

def dominant_octopus
  # O(nlogn)
  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  


end

def merge_sort(arr)
  if arr.length == 1
    return arr
  end

  mid_point = arr.length/2

  


end

sluggish_octopus


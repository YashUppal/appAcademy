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
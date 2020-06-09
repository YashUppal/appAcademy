# Write a method array_translate that takes in an array whose elements alternate between words and numbers. The method should return a string where each word is repeated the number of times that immediately follows in the array.

def array_translate(array)
  str = ""
  
  nums = (0..9)
  
  array.each_with_index do |ele, idx|
    if nums.include?(ele)
      ele.times do 
        str = str + array[idx - 1]
      end
    end
  end
  return str
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts
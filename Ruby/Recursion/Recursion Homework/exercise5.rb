# Write a function reverse(string) that takes in a string and returns it reversed.

def reverse(string)
  return string if string.empty?
  reverse(string[1..-1]) + string[0]
end

  # Test Cases
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
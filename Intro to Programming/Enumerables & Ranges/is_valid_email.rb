# Write a method is_valid_email that takes in a string and returns a boolean indicating whether or not it is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  
  nums = ("0".."9")
  
  str_arr = str.split("@")
  
  contains_num = false
  one_dot = false
  
  # checking for any numbers before the "@"
  str_arr[0].each_char do |char|
    if nums.include?(char)
      contains_num = true
    end
  end
  
  # checking for single "." after "@"
  if str_arr[str_arr.length - 1].split(".").length == 2
    one_dot = true
  end
  
  # returns true if all conditions met
  if str_arr.length == 2 && !(contains_num) && one_dot && str_arr[0].downcase == str_arr[0]
    return true
  else
    return false
  end
  
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false
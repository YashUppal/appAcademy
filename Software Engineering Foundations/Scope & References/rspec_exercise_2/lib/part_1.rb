def partition(arr,num)

  # partition_arr = Array.new(2)
  # partition_arr[0] = arr.select { |ele| ele < num }
  # partition_arr[-1] = arr.select { |ele| ele >= num }
  # partition_arr

  # concise
  [arr.select { |ele| ele < num}, arr.select { |ele| ele >= num }]

end

def merge(hash1, hash2)
  merged_hash = {}

  hash1.each do |key, value|
    merged_hash[key] = value
  end

  # hash1 key-value pair will be overwritted by hash2 key-value pair
  hash2.each do |key, value|
    merged_hash[key] = value
  end

  return merged_hash
end



def my_reject(arr, &prc)
  filtered = []
  arr.each do |ele|
    filtered << ele if !prc.call(ele)
  end
  filtered
end

def my_one?(arr, &prc)
  count = 0
  arr.each do |ele|
    count += 1 if prc.call(ele)
  end
  
  if count == 1
    return true
  else
    return false
  end
end

def hash_select(hash, &prc)
  selected = {}
  hash.each do |key, value|
    selected[key] = value if prc.call(key, value)
  end
  selected
end

def xor_select(arr, prc1, prc2)
  xord = []
  arr.each do |ele|
    xord << ele if ((prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)))
  end
  xord
end

def proc_count(val, arr)
  count = 0
  arr.each do |prc|
    count += 1 if prc.call(val)
  end
  count
end
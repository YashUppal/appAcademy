def is_prime?(num)
  return false if num < 2
  (2...num).each do |fact|
    return false if (num % fact).zero?
  end
  return true
end

def nth_prime(n)
  primes = []
  iterator = 2
  while primes.length < n
    primes << iterator if is_prime?(iterator)
    iterator += 1
  end
  return primes.last
end

def prime_range(min,max)
  primes = []
  (min..max).each do |num|
    primes << num if is_prime?(num)
  end
  primes
end

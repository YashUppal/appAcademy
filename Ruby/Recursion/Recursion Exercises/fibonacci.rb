def iterative_fibonacci(n)
  fibonacci = [1,1]
  while fibonacci.length < n
    fibonacci << fibonacci[-1] + fibonacci[-2]
  end
  return fibonacci
end

def recursive_fibonacci(n)
  return [1,1] if n == 2
  return [1] if n == 1
  recursive_fibonacci(n-1) + [recursive_fibonacci(n-1)[-1] + recursive_fibonacci(n-1)[-2]]
end
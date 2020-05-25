# Recursion

## Recursion

### What is recursion.

* Recursion is the process by which a method calls itself.

```ruby
def recursive
    print "hello"
    recursive # method call
end

# prints "hello" infinitely until SystemStackError
```

* Every recursive method should have two things
    1) Base case: situation when we halt the execution.
    2) Recursive step: where we continue the recursion.

```ruby
def countdown(n)
  # base case
  if n == 0
     print "Liftoff..."
     return
  end
  
  # recursive step
  p n
  countdown(n-1)
end
```
## Recursive Factorial

* We can solve the factorial problem using recursion.

```ruby
def fact(n)
  return 1 if n == 0
  n *= fact(n-1)
end

fact(5) # 120
fact(3) # 6
```

## Recursive Fibonacci

 * We can write a program ```fib``` that takes an argument ```n``` and returns the ```nth``` term in the fibonacci sequence.

* Fibonacci sequence is the sequence of whole numbers in which each numbers is a sum of previous two numbers. First five fibonacci nums are 1, 1, 2, 3, 5

```ruby
def fib(n)
  return 1 if n == 1 || n == 2
  fib(n-1) + fib(n-2)
end
```

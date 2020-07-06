# Intro to Recursion

## What is Recursion?
* Shorter Version - Recursion is when a method calls itself.

* Longer Version - Recursion is the idea in computer programming, where a function that intends to solve a problem, solves it by calling itself on a smaller version of the same problem, and keeps calling it on smaller and smaller version until it reaches a base case, after which it starts returning.

## Base case and Inductive Step

* Base case - Base case is the point when the functions will return some value/solution to stop the recursion. Absense of a base case will result in an infinite loop, eventually, a stack overflow.

* Inductive step - In Mathematics, induction is a way of proving things, very similar to the Domino effect. If one domino falls, every other domino after it will fall. Similarly, in the context of recursion, Inductive step would be the step or line in the function where a smaller version of the problem is passed to itself.

```ruby
def factorial(n)
  return 1 if n == 1 # base case
  n * factorial(n-1) # inductive step
```

## Recursion vs Iteration

* Anything that could be done Recursively, could also be done Iteratively. Usually, recursive solutions are more elegant and concise, whereas iterative solutions are slighly more performant.
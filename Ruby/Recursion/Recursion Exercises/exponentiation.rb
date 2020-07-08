def exp1(b,n)
  return 1 if n.zero?
  b * exp1(b,n-1)
end

def exp2(b,n)
  return 1 if n.zero?
  return b if n == 1

  if n.even?
    res = exp2(b, n/2)
    res = res * res
  else
    res = (exp2(b,(n-1)/2))
    res = b * (res * res)
  end
end
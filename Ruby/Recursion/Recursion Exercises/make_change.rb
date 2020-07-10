def make_better_change(amount, coins = [25, 10, 5, 1])
  change = []

  return change if amount.zero?

  coin = coins[choose_coin(amount,coins)]
  change << coin
  new_amount = amount - coin

  change += make_change(new_amount,coins)
end

def choose_coin(amount,coins)
  smallest = coins.map do |coin|
    if amount >= coin
      amount - coin 
    else
      coin
    end
  end

  smallest_remainder = coins.map do |coin|
    if coin != 1
      amount % coin
    else
      coin
    end
  end

  if smallest_remainder.any?(0)
    return smallest_remainder.index(smallest_remainder.min)
  else
    return smallest.index(smallest.min)
  end
end
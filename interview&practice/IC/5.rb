# Your quirky boss collects rare, old coins...
# They found out you're a programmer and asked you to solve something they've been wondering for a long time.
#
# Write a function that, given:
#
# an amount of money
# an array of coin denominations
# computes the number of ways to make the amount of money with coins of the available denominations.


def coin_computer(target, array)

  computer(target,[],array,0)
end

def computer(target,curr_amount,array,index)
  result = []

  while index < array.length
    amount_sum = curr_amount.reduce(:+)|| 0
    curr_sum = amount_sum + array[index]

    if curr_sum < target
      result.concat(computer(target,curr_amount.concat([array[index]]),array,index))
    elsif curr_sum === target
      result << curr_amount.concat([array[index]])
    end

    index += 1
  end
  result
end


def change_possibilities_bottom_up(amount, denominations)
    ways_of_doing_n_cents = [0] * (amount + 1)
    ways_of_doing_n_cents[0] = 1

    denominations.each do |coin|
        (coin..amount).each do |higher_amount|
            higher_amount_remainder = higher_amount - coin
            ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
        end
    end

    return ways_of_doing_n_cents[amount]
end

# p change_possibilities_bottom_up(4,[1,2,3])

# look more into solution

# Make Change: write a function that takes in an amount and a set of coins. Return the minimum number of coins needed to make change for the given amount. You may assume you have an unlimited supply of each type of coin. If it's not possible to make change for a given amount, return nil or NaN.
#
# Example:
#
# make_change(14, [10, 7, 1])
# return 2 because [7, 7] is the smallest combination


def make_change(coins,total)
  totals = Array.new(total+1) {0}
  # totals[0] = 1

  coins.each do |coin|
    (coin..total).each do |higher_amount|
      remainder = higher_amount - coin
      if totals[higher_amount] > 0
        totals[higher_amount] = [totals[higher_amount],totals[remainder]  + 1].min
      else
        totals[higher_amount] = totals[remainder] + 1
      end
    end
  end

  totals[-1]
end

p make_change([1,7,10],14)

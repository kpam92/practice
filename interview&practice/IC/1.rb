# Writing programming interview questions hasn't made me rich. Maybe trading Apple stocks will.
# Suppose we could access yesterday's stock prices as an array, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.



def stocks(prices)

  highest_so_far = 0

  idx1 = 0
  idx2 = 0

  while idx2 < prices.length
    curr_highest = prices[idx2] - prices[idx2]

    idx1 = idx2 if prices[idx2] < prices[idx1]

    idx2 += 1
  end

  highest_so_far
end

puts stocks([10, 7, 5, 8, 11, 9])

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
    curr_highest = prices[idx2] - prices[idx1]
    highest_so_far = curr_highest if curr_highest > highest_so_far
    idx1 = idx2 if prices[idx2] < prices[idx1]

    idx2 += 1
  end

  highest_so_far
end

# puts stocks([10, 7, 5, 8, 11, 9])

# how it works:

# We iterate through the stocks with two markers, the first one is the
# current lowest stock price. We find the current difference, and change
# the highest_so_far if we find a bigger difference. We change the first marker
# to the the second if we find a lower integer. This takes O(1) space, and O(n)
# time, where n is the length of the array of stock prices.

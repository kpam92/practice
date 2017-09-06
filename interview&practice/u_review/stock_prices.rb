# Writing programming interview questions hasn't made me rich. Maybe trading Apple stocks will.
# Suppose we could access yesterday's stock prices as an array, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.


def stock_picker(array)
  curr_highest = nil
  return 0 if array.length < 2

  buy = 0
  sell = 1
  curr_highest = array[sell] - array[buy]

  while sell < array.length
    curr_diff = array[sell] - array[buy]
    curr_highest = curr_diff if curr_diff > curr_highest
    buy = sell if array[sell] < array[buy]
    sell += 1
  end

  curr_highest
end

  stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

  puts stock_picker(stock_prices_yesterday)

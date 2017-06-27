# Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.
# To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as arrays ↴ of integers [start_time, end_time]. These integers represent the number of 30-minute blocks past 9:00am.
# Write a function merge_ranges() that takes an array of meeting time ranges and returns an array of condensed ranges.

def merge_ranges(ranges)

  ranges = ranges.sort {|x,y| x[0] <=> y[0]}
  result = []


  idx = 1

  curr_range = ranges[0]

  while idx < ranges.length
    curr = ranges[idx]

    if curr[0] > curr_range[1]
      # [1,2] -- [3,4]
      result << curr_range
      curr_range = curr
    elsif curr[0] >= curr_range[0] && curr[1] <= curr_range[1]
      # [1,4] -- [2,3] --> [1,4]

    elsif curr[0] < curr_range[0] && curr[1] > curr_range[1]
      # [1,2] -- [0,3] --> [0,3]
      curr_range = curr
    elsif curr[0] <= curr_range[1] && curr[0] > curr_range[0] && curr[1] >= curr_range[1]
      #[1,3] -- [2,4] --> [1,4]
      curr_range[1] = curr[1]
    end
    idx += 1
  end

  result << curr_range if result[-1] != curr_range

  result
end

# 
# how it works:
# This solution first sorts the ranges by the beginning numbers. We store
# the current range. If the current range falls within the current held variable,
# we alter the current variable and continue. If the range is afterwards, we push
# the current variable on to our result, and hold a new range. This takes O(n) space
# and time, where n is the length of the array of ranges.

# p merge_ranges([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]])
# p merge_ranges([[1, 2], [2, 3]])
# p merge_ranges([[1, 5], [2, 3]])
# p merge_ranges([[1, 10], [2, 6], [3, 5], [7, 9]])

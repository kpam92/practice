# 6.1 Write a program that takes an array A and an index i into A,
#  and rearranges the elements such that all elements less than
#  A[i] (the 'pivot') appear first, followed by elements equal
#  to the pivot, followed by elements greater than the pivot.

# first-attempt

def array_sorter(array,index)
  pivot = array[index]
  less,equal,greater = [],[],[]
  until array.empty?
    if array[0] < pivot
      less << array.shift
    elsif array[0] > pivot
      greater << array.shift
    else
      equal << array.shift
    end
  end
  less.concat(equal).concat(greater)
end

# This method has three seperate empty arrays, then iterates through
# the array, and splits up the numbers accordingly. It iterates through
# the array, so time complexity is O(n); numbers are moved around instead
# of copied, so space complexity is O(1)

# This can be improved in terms of space by doing everything in place.
# So instead of sorting into three subarrays to concat later, let's just
# work with the single array


def array_sorter(array,index)
  low_idx = 0
  equal = 0
  high_idx = array.length - 1
  pivot_element = array[index]
  while equal <= high_idx
    if array[equal] > pivot_element
      array[equal],array[high_idx] = array[high_idx],array[equal]
      high_idx -= 1
    elsif array[equal] == pivot_element
      equal += 1
    else # array[equal] < pivot_element
      array[equal], array[low_idx] = array[low_idx],array[equal]
      equal += 1
      low_idx += 1
    end
  end
  array
end

# How this works:
# the high and low idx keep track of how many more values are left
# in the array that have not been iterated through.(we need this
# as we keep shifting values around) If the element is greater than
# the target value, it is swapped with the farthest unknown value
# on the right side. If the element is smaller, it is swapped to
# the right most side, potentially with a value equal to target.
# If element equals target, then the equal variable moves up, and
# item will be moved closer to target after more sorting. The
# sorted array is returned afterwards. The function only iterates
# through each value once, so it is O(n) time complexity. Aside from
# index variables, there is no addition space used, so space
# complexity is O(1)


# 6.5 Write a problem that takes a sorted array and outputs that array
# with all duplicates deleted, then add a 0 to the end of the array, so
# that the array stays the same length

def duplicate_deleter(array)
  count = 0
  original_length = array.length
  end_idx = (array.length - 1)
  zeroes = 0

  until count == original_length
      curr_num = array.shift
      if curr_num == array[-1]
        zeroes += 1
      else
        array.push(curr_num)
      end
      count += 1
  end
  array.concat([0] * zeroes)

end

# How it works:
# This solution iterates through the sorted array in place by popping the first
# element, then checking for a duplicate. If a duplicate exists, we add 1 to 'zeroes',
# if not, then we push it back on to the end, keeping track of the array's original length.
# This has O(n) time complexity where n is the length of the array, and O(1) space complexity
# because we only store variables.

# 6.6 Write a program that takes an array denoting the daily stock price,
# and returns the maximum profit that could be made by buying and
# then selling one share of that stock.

#this is the hard code it out solution
def stock_picker(array)
  idx1 = 0
  highest_diff = 0
  while idx1 < array.length - 1
    idx2 = idx1 + 1
    while idx2 < array.length
      current_diff = array[idx2] - array[idx1]
      if current_diff > highest_diff
        highest_diff = current_diff
      end
      idx2 += 1
    end
    idx1 += 1
  end
  highest_diff
end

# This iterates through each value, and then iterates through each pairing,
# checking to see if its difference is higher than current highest difference.
# This has a loop within a loop, so time complexity is O(n^2), space is O(1).
# Let's try a more 'greedy' solution that only iterates once

def stock_picker(array)
  highest_diff = array[1] - array[0]
  idx1 = 0
  idx2 = 1
  while idx2 < array.length
    if array[idx2] < array[idx1]
      idx1 = idx2
    else
      current_diff = array[idx2] - array[idx1]
      highest_diff = current_diff if current_diff > highest_diff
    end
    idx2 += 1
  end
  highest_diff
end

# How this works:
# This solution iterates through once, keeping track of the highest
# difference and changing the place of the low value when it passes along.
# It has O(n) time complexity and O(1) space complexity.

# Write a program which takes as input an array of digits that represent
# a decimal number ([1,2,3] === 123), and returns an array that shows that
# number + 1 ([1,2,4])

def decimal_adder(array)

  idx = array.length - 1
  sorted = false

  until sorted
    sorted = true
    curr_num = array[idx] + 1

    if curr_num == 10 && idx > 0
      sorted = false
      array[idx] = 0
      idx -= 1
    elsif curr_num == 10 && idx == 0
       array[idx] = 0
       array.unshift(1)
    else
      array[idx] = curr_num
    end
  end
  array
end

# How it works:
# The function iterates backwards through the array, adding 1 to the
# initial number, and only continuing if the number exceeds 1 digit.
# The space is O(1) because it only has variables, and has a runtime
# of O(n), n representing the length of the array

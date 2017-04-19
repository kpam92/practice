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

  while equal <= high_idx
    if array[equal] > array[index]
      array[equal],array[high_idx] = array[high_idx],array[equal]
      high_idx -= 1
    elsif array[equal] == array[index]
      equal += 1
    else
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
# the right mos side, potentially with a value equal to target.
# If element equals target, then the equal variable moves up, and
# item will be moved closer to target after more sorting. The
# sorted array is returned afterwards. The function only iterates
# through each value once, so it is O(n) time complexity. Aside from
# index variables, there is no addition space used, so space
# complexity is O(1)


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

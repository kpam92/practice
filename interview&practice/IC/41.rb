# Find a duplicate, Space Edition™ BEAST MODE
# In Find a duplicate, Space Edition™, we were given an array of integers where:
#
# the integers are in the range 1..n1..n
# the array has a length of n+1n+1
# These properties mean the array must have at least 1 duplicate. Our challenge was to find a duplicate number, while optimizing for space. We used a divide and conquer approach, iteratively cutting the array in half to find a duplicate integer in O(n\lg{n})O(nlgn) time and O(1)O(1) space (sort of a modified binary search).
#
# But we can actually do better. We can find a duplicate integer in O(n)O(n) time while keeping our space cost at O(1)O(1).

def find_dup(array)
  idx = 0

  while idx < array.length
    if array[(array[idx]).abs - 1] < 0
      return array[idx].abs
    else
      array[(array[idx]).abs - 1] *= -1
    end

    idx += 1
  end
  return 'no repeating character'
end


# puts find_dup([1,1,2,3,4,5,6,7,7,8])
# puts find_dup([1,2,3,4,5,6,7,8])

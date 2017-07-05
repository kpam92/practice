# Find a duplicate, Space Edition™.
# We have an array of integers, where:
#
# The integers are in the range 1..n1..n
# The array has a length of n+1n+1
# It follows that our array has at least one integer which appears at least twice. But it may have several duplicates, and each duplicate may appear more than twice.
#
# Write a function which finds an integer that appears more than once in our array. (If there are multiple duplicates, you only need to find one of them.)
#
# We're going to run this function on our new, super-hip Macbook Pro With Retina Display™. Thing is, the damn thing came with the RAM soldered right to the motherboard, so we can't upgrade our RAM. So we need to optimize for space!


def find_dup(array)
  halfway = array.length/2
  if array[halfway] == array[halfway + 1] || array[halfway] == array[halfway - 1]
    return array[halfway]
  end
  return 'no repeating character' if array.length < 4
  if array[halfway] == halfway + 1
    find_dup(array[halfway..-1])
  else
    find_dup(array[0..halfway])
  end
end

# How it works:

# This solution uses a binary search method. Knowing that this array is sorted,
# with integers within the entire range, we find the halfway point. If that integer
# is more than what should be there in a normal range, then we know that the duplicate
# will be found in the first range. If not, then the duplicate is in the second half. We
# keep calling a recursive call on the respective half until we find the duplicate. If we
# don't find a duplicate and the array is less than 4 integers, then we return nil.

# puts find_dup([1,2,3,4,5,6,7])
# puts find_dup([1,2,3,4,5,6,6,7])
# puts find_dup([1,1,2,3,4,5,6,6,7])
# puts find_dup([1,1,2,3,4,5,6,6,7,7])

# Suppose we had an array ↴ of nn integers sorted in ascending order. How quickly could we check if a given integer is in the array?


def integer_checker(target, array)
  halfway = array.length/2
  return true if array[halfway] == target
  return false if array.length < 2

  if array[halfway] > target
    integer_checker(target,array[0...halfway])
  else
    integer_checker(target,array[halfway+1..-1])
  end
end

# How it works:
Because the array is sorted, the fastest way to check through for a
specific value is to search in binary fashion. This takes O(1) space
and O(logn) time.

# puts integer_checker(2,[1,2,3,4,5,7,9,44])
# puts integer_checker(9,[1,2,3,4,5,7,9,44])
# puts integer_checker(44,[1,2,3,4,5,7,9,44])
# puts integer_checker(1,[1,2,3,4,5,7,9,44])
# puts integer_checker(0,[1,2,3,4,5,7,9,44])

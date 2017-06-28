# Suppose we had an array ↴ of nn integers sorted in ascending order. How quickly could we check if a given integer is in the array?


def integer_checker(target, array)
  halfway = array.length/2
  return true if array[halfway] == target
  return false if array.length < 2

  if array[halfway] > target
    integer_checker(target,array[0..halfway])
  else
    integer_checker(target,array[halfway..-1])
  end
end

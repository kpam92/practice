# Given an array, return the two largest numbers in it
# Note. This is the largest and second largest INSTANCE.
# This means that if the largest number shows up twice,
# we return it twice.

# highest_two([4,4,4,4]) ==> [4,4]
# highest_two([4,4,4,4,2]) ==> [4,4]
# highest_two([1,2,4]) ==> [2,4]
# highest_two([4,1]) ==> [1,4]
# highest_two([1]) ==> [nil,1]
# highest_two([]) ==> []

def highest_two(array)

  return [] if array.empty?
  return [nil,array[0]] if array.length < 2
  return array if array.length == 2

  largest = array[0] > array[1] ? array[0] : array[1]
  second_largest = array[0] < array[1] ? array[0] : array[1]

  idx = 2

  while idx < array.length

    if array[idx] > largest
      second_largest = largest
      largest = array[idx]
    elsif array[idx] > second_largest
      second_largest = array[idx]
    end

    idx += 1
  end

  [second_largest,largest]
end

p highest_two([4,4,4,4]) == [4,4]
# p highest_two([4,4,4,4,2]) == [4,4]
# p highest_two([1,2,4]) == [2,4]
# p highest_two([4,1]) == [4,1]
# p highest_two([1]) == [nil,1]
# p highest_two([]) == []
# p highest_two([1,2,3,4,5,6,7,8,9,10,11,2]) == [10,11]

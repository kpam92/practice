# Given two arrays of integers, build the maximum number possible from all the input numbers without violating the internal order of either of the original arrays.
#
# Example: [1,3,2], [9,1,1] => 913211
# [1,1,2,1], [1,1,1] => 1121111

def biggest_num(array1,array2)
end

def next_biggest(array1,array2)

  idx = 0

  while idx < [array1.length,array2.length].min
    if array1[idx] == array2[idx] && (array2.length - 1) == idx && array1.length > array2.length
      return [1,idx]
    elsif array1[idx] == array2[idx] && (array1.length - 1) == idx && array2.length > array1.length
      return [2,idx]
    elsif array1[idx1] > array2[idx]
      return [1,idx]
    elsif array2[idx] > array1[idx]
      return [2,idx]
    elsif array1[idx] == array2[idx]
      idx += 1
    end
  end
  return [1, idx - 1]
end

puts next_biggest([1,1,2,1],[1,1,1])

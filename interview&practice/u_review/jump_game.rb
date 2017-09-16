=begin
Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.

A = [3,2,1,0,4], return false.
=end

def jumper(array)

  idx = 0
  moves = 0

  while idx < array.length
    moves = [moves,array[idx]].max
    return true if idx == array.length - 1
    return false if moves == 0

    moves -= 1
    idx += 1
  end
end

# puts jumper([2,3,1,1,4]) == true
#
# puts jumper([3,2,1,0,4]) == false

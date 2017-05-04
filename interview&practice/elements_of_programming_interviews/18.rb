# Design an algorithm that takes as input an array and a number,
# and determines if there are three entries in the array
# (not necessarily distinct) which add up to the specified number.
# This means you can use use any amount of the integers in the array.


# we're going to assume that the array is sorted,
# and that we only want distinct ones
def three_sum(array,target)

  array.each_with_index do |base,idx|
    idx1 = idx + 1
    idx2 = array.length - 1

    until idx1 == idx2
      calculation = base + array[idx1] + array[idx2]
      if calculation == target
        return true
      elsif calculation < target
        idx1 += 1
      else
        idx2 -= 1
      end
    end
end

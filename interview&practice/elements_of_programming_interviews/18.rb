# Design an algorithm that takes as input an array and a number,
# and determines if there are two entries in the array
# which add up to the specified number. Output the indexes

def two_sum(array,target)
  seen_nums = Hash.new {|h,k| h[k] = []}

  array.each_with_index do |num,idx|
    curr_diff = target - num
    return [seen_nums[curr_diff][0],idx] if seen_nums[curr_diff].length > 0
    seen_nums[num] << idx
  end
  seen_nums
end

# How it works:
# The function is greedy as it traverses the array once, first checking
# if the counterpart exists, and if not, then collects that instance of
# the number. It returns nil if nothing is found. It is O(n) time and space.

# Design an algorithm that takes as input an array and a number,
# and determines if there are three entries in the array
# (not necessarily distinct) which add up to the specified number.
# This means you can use use any amount of the integers in the array.


# we're going to assume that the array is sorted,
# and that we only want distinct ones
def three_sum(array,target)

  array.each_with_index do |base,idx|
    break if idx > array.length - 3
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
  false
end


# how it works:
The function iterates through each number, with the exception of numbers
that [-2] spaces close to the end, then iterates through possible combinations
of each base. This

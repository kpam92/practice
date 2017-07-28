# Given an array of integers, every element appears twice except for one. Find that single one.
#
# Note:
# Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?


# this solution would normally be solved using an XOR operator, but we are going
# to use a hash that will operate on O(n) space

def find_single_num(array)
  nums = Hash.new

  array.each do |num|
    if nums[num]
      nums.delete(num)
    else
      nums[num] = true
    end
  end

  nums.keys[0]
end


# puts find_single_num([2,2,1])

# How it works:
# This solution iterates through the numbers, then adds them to the nums
# hash, and takes them away if the second one is found. Afterwards, we return
# the only number in the hash. This takes O(n) time, and O(n/2) space, which
# then turns in to O(n) space.

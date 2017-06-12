# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
#
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# You are given a target value to search. If found in the array return its index, otherwise return -1.
#
# You may assume no duplicate exists in the array.

require 'byebug'

def search(nums, target)
  middle_idx = nums.length / 2

  return middle_idx if nums[middle_idx] == target
  return 0 if nums[0] == target
  return -1 if nums.length < 2

  byebug
  if nums[0] > nums[middle_idx] && target.between?(nums[0],nums[middle_idx])
    return search(nums[0...middle_idx],target)
  else
    next_result = search(nums[middle_idx..-1], target)
    return middle_idx + search(nums[middle_idx..-1],target) if next_result != -1
    return -1
  end
  nil
end

puts search([4,5,6,7,0,1,2],0)

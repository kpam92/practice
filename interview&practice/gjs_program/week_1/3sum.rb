# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
# Note: The solution set must not contain duplicate triplets.
#
# For example, given array S = [-1, 0, 1, 2, -1, -4],
# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]


def three_sum(nums)
  result = Hash.new

  seen = Hash.new {|h| h = 0}

  nums.each {|num| seen[num] += 1}

  idx1 = 0

  while idx1 < nums.length - 1

    idx2 = idx1 + 1

    while idx2 < nums.length

      current_seen = seen.dup

      curr_num = nums[idx1] + nums[idx2]
      search_integer = 0 - curr_num

      valid = true
      curr_result = [nums[idx1],nums[idx2], search_integer].sort

      curr_result.each do |num|
        current_seen[num] -= 1
        if current_seen[num] < 0
          valid = false
          break
        end
      end

      result[curr_result] = true if valid

      idx2 += 1
    end

    idx1 += 1
  end

  result.keys
end


# How it works
# 
# This iterates once over the entire array, storing the number of instances
# of each number. Then we iterate again over the array with two indices,
# checking the result of adding the pair, and checking if that number exists
# in the seen hash. We use a hash dup to check make sure that we aren't
# checking with duplicates of the same instance. If this passes, then we add
# the instance in our result hash. If the same combination existed previously,
# it won't repeat. The time complexity is O(n^2), where n is the length of the
# array because we have to check each number in two loops.

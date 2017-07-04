# Write a function for doing an in-place ↴ shuffle of an array.
# The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.
#
# Assume that you have a function get_random(floor, ceiling) for getting a random integer that is >= floor and <= ceiling.


def shuffle(array)
  nums = {}
  (1..array.length - 1).each {|x| nums[x] = true}

  array.each do |num|
    idx = 1 + rand(nums.keys.length - 1)
    num = [num, idx]
    nums.delete(idx)
  end

  idx = 0

  while idx < array.length
    array[array[idx][1]] = [array[array[idx][1]],array[idx]]
    idx += 1
  end

  array.each {|x| x = x[1]}
  array
end

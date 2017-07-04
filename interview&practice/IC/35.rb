# Write a function for doing an in-place ↴ shuffle of an array.
# The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.
#
# Assume that you have a function get_random(floor, ceiling) for getting a random integer that is >= floor and <= ceiling.


def shuffle(array)
  nums = {}
  (1..array.length - 1).each {|x| nums[x] = true}
  idx = 0
  while idx < array.length
    if nums.keys.length == 1
      rand_idx = 0
    else
      rand_idx = rand(nums.keys.length)
    end
    array[idx] = [array[idx], nums.keys[rand_idx]]
    nums.delete(nums.keys[rand_idx])
    idx += 1
  end

  # idx = 0
  #
  # while idx < array.length
  #   array[array[idx][1]] = [array[array[idx][1]],array[idx]]
  #   idx += 1
  # end

  # array.map {|x| x = x[1]}
  array
end

print shuffle([1,2,3,4,5])

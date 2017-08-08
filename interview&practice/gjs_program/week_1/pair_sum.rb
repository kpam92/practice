# Given an integer array, output all distinct pairs that sum up to a specific value k. Consider the fact that the same number can add up to k with its duplicates in the array.
#
# For example the array is [1, 1, 2, 3, 4] and the desired sum is 4. Should we output the pair (1, 3) twice or just once? Also do we output the reverse of a pair, meaning both (3, 1) and (1, 3)? Let’s keep the output as short as possible and print each pair only once. So, we will output only one copy of (1, 3). Also note that we shouldn’t output (2, 2) because it’s not a pair of two distinct elements.

def pair_sum(array, target)

  seen = Hash.new

  result = Hash.new

  array.each do |value|
    second_val = target - value
    if seen[second_val]
      seen.delete(second_val)
      result[[[value, second_val].min, [value, second_val].max]] = true
    else
      seen[value] = true
    end
  end

  result.keys
end

# print pair_sum([1, 1, 2, 3, 4],4)

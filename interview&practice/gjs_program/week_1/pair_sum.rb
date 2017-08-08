# Given an integer array, output all distinct pairs that sum up to a specific value k. Consider the fact that the same number can add up to k with its duplicates in the array.
#
# For example the array is [1, 1, 2, 3, 4] and the desired sum is 4. Should we output the pair (1, 3) twice or just once? Also do we output the reverse of a pair, meaning both (3, 1) and (1, 3)? Let’s keep the output as short as possible and print each pair only once. So, we will output only one copy of (1, 3). Also note that we shouldn’t output (2, 2) because it’s not a pair of two distinct elements.

def pair_sum(array, target)

  numbers = Hash.new { |h,k| h[k] = 0 }

  array.each {|num| numbers[num] += 1 }

  result = Hash.new

  numbers.map do |key, value|
    until value == 0
      second_val = target - value

      if second_val == val && value > 1
        value -= 1
        result[[value,value]] = true
      elsif second_val != val && numbers[second_val]
        result[[value,second_val].sort] = true
        numbers[second_val] -= 1
      end
      value -= 1
    end
  end

  result.keys

end

puts pair_sum([1, 1, 2, 3, 4],4)

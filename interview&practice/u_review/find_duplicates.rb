# Given an array, return all duplicate integers
# [1,2,3,2,4] ==> [2]
# [1,2,3,2,1] ==> [1,2] or [2,1]
# [1,1,1,1,1] ==> [1]
# [1,2,3,4,5] ==> []

def duplicates(array)
  seen_hash = Hash.new { |h, k| h[k] = 0 }
  result = []

  array.each do |num|
    seen_hash[num] += 1
    result.push(num) if seen_hash[num] == 2
  end

  result
end

# p duplicates([1,2,3,2,4]) == [2]
# p duplicates([1,2,3,2,1]) == [2,1]
# p duplicates([1,1,1,1,1]) == [1]
# p duplicates([1,2,3,4,5]) == []

# given an array of integers, and k, return indices of a pair of numbers that
# equal k. return nil if none are found
# A. best solution with unsorted elements

def sum_pair_one(array,k)
  seen = {}

  idx = 0

  while idx < array.length
    remainder = k - array[idx]
    return [seen[remainder], idx] if seen[remainder]
    seen[array[idx]] = idx
    idx += 1
  end

  nil
end

p sum_pair_one([1,2,3],4)

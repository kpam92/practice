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

# p sum_pair_one([1,2,3],4)
# p sum_pair_one([1],4)

# B. super fast computer but can't use extra space

def sum_pair_two(array,k)
  idx1 = 0
  while idx1 < array.length - 1
    idx2 = idx1 + 1
    while idx2 < array.length
      return [idx1,idx2] if array[idx1] + array[idx2] == k
      idx2 += 1
    end
    idx1 += 1
  end
  nil
end

# p sum_pair_two([1,2,3],4)
# p sum_pair_two([1],4)


# C. the input array is sorted, still no extra space

def sum_pair_three(array,k)
  head = 0
  tail = array.length - 1

  while head < tail
    curr = array[head] + array[tail]
    if curr == k
      return [head,tail]
    elsif curr > k
      tail -= 1
    else # curr < k
      head += 1
    end
  end
  nil
end

# p sum_pair_three([1,2,3,4,10],7)
# p sum_pair_three([1],4)

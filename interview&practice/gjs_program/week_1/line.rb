# A line for tickets has a rule that you can only buy one ticket,
# then you must re-enter the line to get another one. Each transaction
# is 1 second. Given an input of an array representing people and
# their ticket amount, and an index, how many seconds will it take
# to get tickets for the target person.

# example input ([5,5,2,3], 3)
# Once a person buys all tickets, they do not re-enter the line
# 0.[5,5,2,3*]
# 1.[5,2,3*,4]
# 2.[2,3*,4,4]
# 3.[3*,4,4,1]
# 4.[4,4,1,2*]
# 5.[4,1,2*,3]
# 6.[1,2*,3,3]
# 7.[2*,3,3]
# 8.[3,3,1*]
# 9.[3,1*,2]
# 10.[1*,2,2]
# 11.[2,2]
# The answer would be 11


def wait(array,target)
  idx = 0
  counter = 0

  until array[target] == 0
    if array[idx] > 0
        array[idx] -= 1
        counter += 1
    end
    idx = (idx + 1) % array.length
  end
  counter
end

# How it works:
# The problem iterates through the line, counting 1 while subtracting
# from each number, skipping 0 values. It then returns the counter when
# array[target] == 0


# Let's see if we can optimize This

def wait2(array,target)
  result = 0

  array[0..target].each_with_index do |num,idx|
    if array[idx] >= target
      result += array[target]
    else
      result += num
    end
  end

  array[target+1..-1].each_with_index do |num,idx|
    if array[idx] >= target
      result += array[target] - 1
    else
      result += num
    end
  end
  result
end

#How it works
# This solution iterates only once over the array, adding less than
# or up to the target amount if before the target, and less than or
# one less than target amount if after. This is O(n) time complexity
# rather than the previous example, where the iterating loop could go
# on for an extremely large time.

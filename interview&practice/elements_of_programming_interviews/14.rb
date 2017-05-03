# Write a program which takes as input two sorted arrays,
# and returns a new array containing elements that are
# present in both of the input arrays. The arrays may
# have duplicate entries, but answer should be free of duplicates.

def common_array(array1,array2)
  idx1 = 0
  idx2 = 0
  result = {}

  until idx1 >= array1.length || idx2 >= array2.length

    if array1[idx1] == array2[idx2]
      result[array1[idx1]] = true
      idx1 += 1
      idx2 += 1
    elsif array1[idx1] > array2[idx2]
      idx2 += 1
    elsif array1[idx1] < array2[idx2]
      idx1 += 1
    else
      idx1 += 1
      idx2 += 1
    end

  end
  result.keys
end

# How it works:
# both arrays are iterated through, collecting items that equal each other
# in a Hash set. Depending on other options, a respective array is iterated
# forward once, until one of the arrays is done being cycled through. The
# hash keys are then returned. This has a time complexity of O(n), n being
# the shorter array

# The book solves the problem in a similar fashion

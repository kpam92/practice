

def sub_array(array)
# helper function that takes in array as an argument, presumably with
# number -1,0, and 1, and crawls through each number, adding each number
# to the count, while also adding an extra sum of numbers to the count
# if there is a contiguous progression. i.e. if the array is [1,1,1.0],
# count will go up for each 1, but it will also go up for [1,1],[1,1] & [1,1,1]
  idx1 = 0
  idx2 = 1
  curr_count = array[idx1]
  while idx2 < array.length
    curr_count += array[idx2]
    if array[idx2] == array[idx1]
      curr_count += (array[idx2] * (idx2 - idx1))
    else
      idx1 = idx2
    end
    idx2 += 1
  end
  curr_count
end

def array_subs(array,length,k)
  differences = []

  # this while loop iterates through the array and compares every
  # permutation pair, then pushes the result into the differences array.
  # positive progression = 1, none = 0, negative = -1. This creates the array
  # that will be passed into the subArray helper function above.
  idx = 0
  while idx < (length - 2)
    differences << (array[idx+1] <=> array[idx])
    idx += 1
  end

idx3 = 0
while idx3 < array.length - k + 1
  puts sub_array(differences[idx3..idx3+(k-2)])
  idx3 += 1
end

end

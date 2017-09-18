def find_array_quadruplet(arr, s)
  # your code goes here

  # hash holding the sums of two numbers
  # iterate through the array, subtract x from the sum
  # check the hash to see if that counterpart exists

  arr = arr.sort

  return [] if arr.length < 4

  idx1 = 0

  while idx1 < arr.length - 3

    idx2 = idx1 + 1

    while idx2 < arr.length - 2
      remainder = s - (arr[idx2] + arr[idx1])

      low = idx2 + 1
      high = arr.length - 1

      while low < high
        if (arr[low] + arr[high] < remainder)
          low += 1
        elsif (arr[low] + arr[high] > remainder)
          high -= 1
        else
          return [arr[idx1], arr[idx2], arr[low], arr[high]]
        end
      end
      idx2 += 1
    end
    idx1 += 1
  end
  return []
end

  arr = [2, 7, 4, 0, 9, 5, 1, 3]
  s = 200

puts find_array_quadruplet(arr, s)

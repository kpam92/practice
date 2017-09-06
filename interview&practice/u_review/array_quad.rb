# Given an unsorted array of integers arr and a number s, write a function findArrayQuadruplet that finds four numbers (quadruplet) in arr that sum up to s. Your function should return an array of these numbers in an ascending order. If such a quadruplet doesn’t exist, return an empty array.
#
# Note that there may be more than one quadruplet in arr whose sum is s. You’re asked to return the first one you encounter.
#
# Explain and code the most efficient solution possible, and analyze its time and space complexities.
#
# Example:
#
# input:  arr = [2, 7, 4, 0, 9, 5, 1, 3], s = 20
#
# output: [0, 4, 7, 9] # The ordered quadruplet of (7, 4, 0, 9)
#                      # whose sum is 20. Notice that there
#                      # are two other quadruplets whose sum is 20:
#                      # (7, 9, 1, 3) and (2, 4, 9, 5), but again you’re
#                      # asked to return the just one quadruplet (in an
#                      # ascending order)


def find_array_quadruplet(array, sum)
  array = merge_sort(array)
  i = 0

  while i < array.length - 3
    j = i + 1
    while j < array.length - 2
         # r stores the complementing sum
       r = sum - (array[i] + array[j])
       low = j + 1
       high = array.length - 1
       while (low < high)
          if (array[low] + array[high] < r)
            low+= 1
          elsif (array[low] + array[high] > r)
            high-= 1
          else
            return [array[i], array[j], array[low], array[high]]
          end
        end

        j += 1
      end

      i += 1
    end
    return []
end



# merge sort helper function

def merge_sort(array)
  return array if array.length < 2
  halfway = array.length/2

  array1 = array[0...halfway]
  array2 = array[halfway..-1]

  merger(merge_sort(array1),merge_sort(array2))
end

def merger(array1,array2)
  result = []

  until array1.empty? || array2.empty?
    if array1[0] > array2[0]
      result.push(array2.shift)
    else
      result.push(array1.shift)
    end
  end

  result.concat(array1).concat(array2)
end

arr = [2, 7, 4, 0, 9]
s = 20

puts find_array_quadruplet(arr,s)

 # given an unordered array find the smallest window to sort in order to make a sorted array
 #
 # input: [1 1 2 3 4 6 5]
 # output: 2 because the smallest window would be [6 5]

 # do this with O(n) space and O(nlogn) time

def smallest_window(array)
  array2 = array.sort

  low = 0
  low += 1 until array[low] != array2[low]

  high = array.length - 1
  high -= 1 until arra[high] != array2[high]

  high - low + 1
end


puts smallest_window([1,1,2,3,4,6,5])

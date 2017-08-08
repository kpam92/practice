# Write a function that accepts a multi dimensional array and returns a flattened version.

def flatten_array(array)

  result = []

  until array.empty?

    if array[0].is_a?(Array)
      result.concat(flatten_array(array.shift))
    else
      result.push(array.shift)
    end
  end

  result
end

# How it works:
# This solution iterates through the array, shifting off the first element,
# adding it to the result if its a number, and performing flatten_array if its
# another array. This takes O(n) space and time, where n is the number of elements.

# print flatten_array([1,[2,[3,4],5],6])

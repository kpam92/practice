# Write a function that accepts a multi dimensional array and returns a flattened version.

def flatten_array(array)
  idx = 0
  result = []
  
  until array.empty?

    if array[idx].is_a?(Array)
      result.concat(flatten_array(array.shift))
    else
      result.push(array.shift)
    end

    idx += 1
  end

  result
end

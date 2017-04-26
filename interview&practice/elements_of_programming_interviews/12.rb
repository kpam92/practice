# Searching


# Write a method that takes a sorted array and a key and
# returns the index of the first occurence of that key in the array.

# Watch out that if you first find an occurence, that doesn't necessarily
# mean that it is the first one.

# warmup doing regular bsearch with a sorted array

def bsearch(array,target)
  middle = array.length/2
  return middle if array[middle] == target
  return nil if array.length <=1

  if array[middle] > target
    return bsearch(array[0...middle],target)
  else
    left = bsearch(array[middle+1..-1],target)
    left.nil? ? nil : left + (middle + 1)
  end

end

def first_idx(array,target)
end

# Given an array of numbers, return all subsets of the numbers

def subsets(array)
  return [[]] if array.empty?
  result = []
  curr_num = array.shift

  remaining_sets = subsets(array)
  result = result.concat(remaining_sets)

  remaining_sets.each do |set|
    result.unshift([curr_num] + set)
  end

  result
end

# p subsets([1,2,3])

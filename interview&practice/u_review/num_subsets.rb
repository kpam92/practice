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


def subsetter(array)
  return [[]] if array.empty?

  curr_num = array.shift

  curr_subsets = subsetter(array)
  result = []
  result = result.concat(curr_subsets)
  curr_subsets.each {|set| result.unshift([curr_num] + set)}

  result

end

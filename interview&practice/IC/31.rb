# Write a recursive function for generating all permutations of an input string. Return them as a set.
# Don't worry about time or space complexity—if we wanted efficiency we'd write an iterative version.
#
# To start, assume every character in the input string is unique.
#
# Your function can have loops—it just needs to also be recursive.


def permutations(string)
  characters = Hash.new
  string.chars.each { |x| characters[x] = true }
  permutate(characters)
end

def permutate(set)
  result = []
  return [""] if set.empty?

  set.each do |letter,value|
    curr_set = set.dup
    curr_set.delete(letter)
    curr_result = permutate(curr_set)
    curr_result.map! {|x| x = letter + x }

    result.concat(curr_result)
  end

  result
end

# puts permutations('ca')

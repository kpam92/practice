# Given a length, interpet all the different permutations there are
# of that length with the letters A and B. For example, input 2 would
# result in ['AA','AB','BA', 'BB']


def perm(length)
  return ['A','B'] if length < 2

  result = []
  appended_end = perm(length - 1)
  current = ['A','B']

  current.each do |letter|
    appended_end.each do |latter_part|
      result.push(letter+latter_part)
    end
  end
  result
end

# How it works:
#
# This recursively calls on itself, appending all possible combinations
# on to the two letters. It's time complexity would be 0(2^n), where
# n is the length given

# let's try iteratively

def perm_it(length)
  result = []
  current = "A" * length
end

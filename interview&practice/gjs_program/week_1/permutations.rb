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

# again but with "A,B,C"

def perm(length)
  return ['A','B', 'C'] if length < 2

  result = []
  appended_end = perm(length - 1)
  current = ['A','B','C']

  current.each do |letter|
    appended_end.each do |latter_part|
      result.push(letter+latter_part)
    end
  end
  result
end


# create a method that will intake a string of numbers, and return
# the different permutations will their mnemonic letters

def num_perm(string)
  num_hash = {
    '2' => ['A','B','C'],
    '3' => ['D','E','F'],
    '4' => ['G','H','I'],
    '5' => ['J','K','L'],
    '6' => ['M','N','O'],
    '7' => ['P','Q','R','S'],
    '8' => ['T','U','V'],
    '9' => ['W','X','Y','Z']
  }
  result = []

  return num_hash[string] if string.length < 2

  curr_num = num_hash[string[0]]
  appended_end = num_perm(string[1..-1])

  curr_num.each do |letter|
    appended_end.each do |latter_part|
      result.push(letter + latter_part)
    end
  end
  result
end

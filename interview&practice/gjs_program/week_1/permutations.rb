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

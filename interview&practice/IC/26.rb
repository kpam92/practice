# Write a function to reverse a string in place.

def reverse_string(string)
  idx1 = 0
  idx2 = string.length - 1

  while idx1 < idx2
    string[idx1],string[idx2] = string[idx2],string[idx1]

    idx1 += 1
    idx2 -= 1
  end
  string
end


puts reverse_string('anna')
puts reverse_string('banana')
puts reverse_string('hello kitty')
puts reverse_string('hello world')
puts reverse_string('this is a sentence')
puts reverse_string('whats up')

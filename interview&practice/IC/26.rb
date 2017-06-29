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


# how it works:
# This uses two indices, and we traverse through the letters from the beginning
# and end, and we swap elements, and stop when they meet. This has O(1) space and
# O(n) time, where n is the length of the string. (more specifically O(n/2) time)

# puts reverse_string('anna')
# puts reverse_string('banana')
# puts reverse_string('hello kitty')
# puts reverse_string('hello world')
# puts reverse_string('this is a sentence')
# puts reverse_string('whats up')

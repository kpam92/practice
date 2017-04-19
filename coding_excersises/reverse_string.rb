#reverse a string in place

def reverse_string(string)
  idx1 = 0
  while idx1 < string.length/2
    idx2 = (string.length - 1) - idx1
    string[idx1], string[idx2] = string[idx2], string[idx1]
    idx1 += 1
  end

  string
end

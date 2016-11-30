#reverse words in message, assuming all words are seperated by only spaces

def reverse_message(string)
  string = string.split(" ")
  idx1 = 0

  while idx1 < string.length/2
    idx2 = string.length - (idx1 + 1)

    string[idx1], string[idx2] = string[idx2], string[idx1]
    idx1 += 1
  end
  string.join(" ")
end

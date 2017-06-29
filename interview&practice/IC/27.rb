# You're working on a secret team solving coded transmissions.
# Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backwards! Your colleagues have handed off the last step to you.
#
# Write a function reverse_words() that takes a string message and reverses the order of the words in-place ↴ .


def decipher(string)

  string = reverse_word(string)

  idx1 = 0

  while idx1 < string.length

    if string[idx1] != ' '

      idx2 = idx1 + 1
       while string[idx2] != ' ' && idx2 < string.length
         idx2 += 1
       end

       string[idx1...idx2] = reverse_word(string[idx1...idx2])
       idx1 = idx2
     else
     end

     idx1 += 1
  end

  string
end

def reverse_word(word)
  idx1 = 0
  idx2 = word.length - 1

  while idx1 < idx2
    word[idx1],word[idx2] = word[idx2], word[idx1]

    idx1 += 1
    idx2 -= 1
  end

  word
end


puts decipher("this is dumb")
puts decipher("find you will pain only go you recordings security the into if")

# We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle of str1 and str2 if it can be formed by interleaving the characters of str1 and str2 in a way that maintains the left to right ordering of the characters from each string. For example, given str1="abc" and str2="def", str3="dabecf" is a valid shuffle since it preserves the character ordering of the two strings. So, given these 3 strings write a function that detects whether str3 is a valid shuffle of str1 and str2.


def valid_shuffle(string1,string2,shuffled_deck)

  until string1.empty? && string2.empty?

    if string1[0] == shuffled_deck[0]
      string1 = string1[1..-1]
    elsif string2[0] == shuffled_deck[0]
      string2 = string2[1..-1]
    else
      return false
    end

    shuffled_deck = shuffled_deck[1..-1]
  end

  if shuffled_deck.empty?
    return true
  else
    return false
  end
end

str1="abc"
str2="def"
str3="dabecf"

puts valid_shuffle(str1,str2,str3)

# Given two strings, write a function
 # to check if they are one edit(or zero edits) away.

def one_away(string1, string2)

  return true if string1 == string2
  one_change = 0
  strings = [string1, string2].sort {|x,y| x.length <=> y.length}
  string1 = strings[1]
  string2 = strings[0]
  return false if (string1.length - string2.length) > 1
  idx1 = 0
  idx2 = 0

  while idx1 < string1.length

    if string1[idx1] != string2[idx2]
      one_change += 1
      idx2 += 1 if string1.length == string2.length
    else
      idx2 += 1
    end

    idx1 += 1
    if one_change > 1
      return false
    end
  end

  true
end

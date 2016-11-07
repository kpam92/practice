#write a method that checks to see if a string is a rotated version of another
# and uses only one call to a helper method is_substring once

def is_substring?(string, substring)

  idx1 = 0
  while idx1 < string.length

    if string[idx1] == substring[0]
      idx2 = idx1
      sub_idx = 0
      while idx2 < string.length

        break if string[idx2] != substring[sub_idx]
        return true if (string[idx2] == substring[sub_idx]) && (sub_idx == substring.length - 1)
        idx2 += 1
        sub_idx += 1
      end
    end

    idx1 += 1
  end
  false
end

def string_rotation?(string1,string2)
  return is_substring?((string2 + string2), string1)
end

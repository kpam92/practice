# Given a string, calculate the longest palindrome substring, spaces don't count


def longest_pal(string)
  result_string = string

  string = string.downcase
  idx = 0

  longest_pal = string[0] == string[1] ? string[0..1] : ""
  longest_pal_idx = string[0] == string[1] ? [0,1] : []
  idx = 1

  while idx < string.length
    curr_pal = string[idx]
    curr_pal, curr_pal_idx = longest_sub(string,idx - 1, idx + 1, curr_pal)

    if curr_pal.length > longest_pal.length
      longest_pal = curr_pal
      longest_pal_idx = curr_pal_idx
    end

    curr_pal = ""
    curr_pal, curr_pal_idx = longest_sub(string,idx, idx + 1, curr_pal)

    if curr_pal.length > longest_pal.length
      longest_pal = curr_pal
      longest_pal_idx = curr_pal_idx
    end

    idx += 1
  end

  result_string[longest_pal_idx[0]..longest_pal_idx[1]]
end

def longest_sub(string,idx1,idx2,curr_pal)
  while idx1 >= 0 && idx2 < string.length
    if (string[idx1].ord < 97 || string[idx1].ord > 122) && (string[idx2].ord < 96 || string[idx2].ord > 122)
      idx1 -= 1
      idx2 += 1
    elsif (string[idx1].ord < 96 || string[idx1].ord > 122)
      idx1 -= 1
    elsif (string[idx2].ord < 96 || string[idx2].ord > 122)
      idx2 += 1
    elsif string[idx1] == string[idx2]
      curr_pal = string[idx1] + curr_pal + string[idx2]
      idx1 -= 1
      idx2 += 1
    else
      break
    end
  end
  [curr_pal,[idx1 + 1,idx2 - 1]]
end

puts longest_pal("abc da  ba bakel")

# Given a string, calculate the longest palindrome substring, spaces don't count


def longest_pal(string)
  result_string = string

  string = string.downcase
  idx = 0

  longest_pal = string[0] == string[1] ? string[0..1] : ""
  idx = 1

  while idx < string.length
    curr_pal = string[idx]
    idx1 = idx - 1
    idx2 = idx + 1
    while idx1 >= 0 && idx2 < string.length

      if string[idx1] == string[idx2]
        curr_pal = string[idx1] + curr_pal + string[idx2]
        idx1 -= 1
        idx2 += 1
      else
        break
      end
    end
    longest_pal = [longest_pal,curr_pal].max

    curr_pal = ""
    idx1 = idx
    idx2 = idx + 1

    while idx1 >= 0 && idx2 < string.length
      if string[idx1] == string[idx2]
        curr_pal = string[idx1] + curr_pal + string[idx2]
        idx1 -= 1
        idx2 += 1
      else
        break
      end
    end
    longest_pal = [longest_pal,curr_pal].max

    idx += 1
  end

  longest_pal
end

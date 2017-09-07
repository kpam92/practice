# Given an array of unique characters arr and a string str, Implement a function getShortestUniqueSubstring that finds the smallest substring of str containing all the characters in arr. Return "" (empty string) if such a substring doesn’t exist.
#
# Come up with an asymptotically optimal solution and analyze the time and space complexities.
#
# Example:
#
# input:  arr = ['x','y','z'], str = "xyyzyzyx"
#
# output: "zyx"

def get_shortest_unique_substring(arr, str)
  curr_shortest = str
  seen_hash = {}
  arr.each { |x| seen_hash[x] = 0 }

  idx1 = 0
  idx2 = 1
  seen_hash[str[idx1]] += 1 if seen_hash[str[idx1]]
  seen_hash[str[idx2]] += 1 if seen_hash[str[idx2]]

  while seen_hash.values.include?(0)
    idx2 += 1
    seen_hash[str[idx2]] += 1 if seen_hash[str[idx2]]
    return '' if (idx2 >= str.length - 1) && seen_hash.values.include?(0)
  end

  curr_shortest = str[0..idx2] if str[0..idx2].length < curr_shortest.length

  while idx2 < str.length
    if seen_hash[str[idx1]] && (seen_hash[str[idx1]] - 1 > 0)
      seen_hash[str[idx1]] -= 1
      idx1 += 1
    elsif seen_hash[str[idx2]] && str[idx2] == str[idx1]
      idx1 += 1
      idx2 += 1
    elsif !seen_hash[str[idx1]]
      idx1 += 1
    else
      idx2 += 1
      seen_hash[str[idx2]] += 1 if seen_hash[str[idx2]]
    end
    curr_shortest = str[idx1..idx2] if str[idx1..idx2].length < curr_shortest.length
  end

  curr_shortest
end

# puts get_shortest_unique_substring(["A","B","C"], "ADOBECODEBANCDDD")
# puts get_shortest_unique_substring(["A"], "B")
# puts get_shortest_unique_substring(["A"], "A")
# puts get_shortest_unique_substring(["A","B","C"], "ADOBECODEBANCDDD")
# puts get_shortest_unique_substring(["A","B","C","E","K","I"], "KADOBECODEBANCDDDEI")
# puts get_shortest_unique_substring(["x","y","z"], "xyyzyzyx")
# puts get_shortest_unique_substring(["x","y","z","r"], "xyyzyzyx")


def get_shortest_two(string)

  return string if string.length == 1
  if string.length == 2
    string[0] == string[1] ? return string[0] : return string
  end
  seen_hash = Hash.new { |h,k| h[k] = 0 }

  string.chars.each { |x| seen_hash[x] += 1 }

  head = 0
  tail = 1
end

puts get_shortest_two('ss')

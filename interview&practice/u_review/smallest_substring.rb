# Given an array of unique characters arr and a string str, Implement a function getShortestUniqueSubstring that finds the smallest substring of str containing all the characters in arr. Return "" (empty string) if such a substring doesn’t exist.
#
# Come up with an asymptotically optimal solution and analyze the time and space complexities.
#
# Example:
#
# input:  arr = ['x','y','z'], str = "xyyzyzyx"
#
# output: "zyx"

def get_shortest_unique_substring(arr, string)
  curr_shortest = string
  seen_hash = {}
  arr.each { |x| seen_hash[x] = 0 }

  idx1 = 0
  idx2 = 1
  seen_hash[string[idx1]] += 1 if seen_hash[string[idx1]]
  seen_hash[string[idx2]] += 1 if seen_hash[string[idx2]]

  while seen_hash.values.include?(0)
    idx2 += 1
    seen_hash[string[idx2]] += 1 if seen_hash[string[idx2]]
    return '' if (idx2 == string.length - 1) && seen_hash.values.include?(0)
  end

  curr_shortest = string[0..idx2] if string[0..idx2].length < curr_shortest.length

  while idx2 < string.length
    if seen_hash[string[idx1]] && (seen_hash[string[idx1]] - 1 > 0)
      seen_hash[string[idx1]] -= 1
      idx1 += 1
    elsif seen_hash[string[idx2]] && string[idx2] == string[idx1]
      idx1 += 1
      idx2 += 1
    elsif !seen_hash[string[idx1]]
      idx1 += 1
    else
      idx2 += 1
      seen_hash[string[idx2]] += 1 if seen_hash[string[idx2]]
    end
    curr_shortest = string[idx1..idx2] if string[idx1..idx2].length < curr_shortest.length
  end

  curr_shortest
end

puts get_shortest_unique_substring(["A","B","C"], "ADOBECODEBANCDDD")

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
  # your code goes here
  # iterate through the string
  seen = Hash.new

  arr.each {|x| seen[x] = 0}

  str.chars.each  {|letter| seen[letter] += 1 if seen[letter]}

  arr.each {|letter| return '' if seen[letter] == 0}

  return '' if str.empty? || seen.values.include?(0)
  open = 0
  close = str.length - 1

  shortest = str

  curr_hash = seen.clone
  idx = 0
  while true
    if curr_hash[str[idx]] && (curr_hash[str[idx]] - 1) > 0
      curr_hash[str[idx]] -= 1
      idx += 1
    elsif curr_hash[str[idx]] && (curr_hash[str[idx]] - 1) == 0
        curr_result = short_helper(str[idx..-1],curr_hash,'beginning')
        shortest == curr_result if curr_result.length < shortest.length
    else
        idx += 1
    end
  end

  curr_hash = seen.clone
  idx = str.length - 1
  while true
    if curr_hash[str[idx]] && (curr_hash[str[idx]] - 1) > 0
      curr_hash[str[idx]] -= 1
      idx -= 1
    elsif curr_hash[str[idx]] && (curr_hash[str[idx]] - 1) == 0
        curr_result = short_helper(str[0..idx],curr_hash,'end')
        shortest == curr_result if curr_result.length < shortest.length
    else
        idx -= 1
    end
  end


  shortest
end

def short_helper(string,seen_hash,direction)

  idx = direction == 'beginning' ? 0 : string.length - 1

  while true
    if seen_hash[string[idx]] && (seen_hash[string[idx]] - 1) > 0
      seen_hash[string[idx]] -= 1
      idx += 1 if direction == 'beginning'
      idx -= 1 if direction == 'end'
    elsif !seen_hash[string[idx]]
      idx += 1 if direction == 'beginning'
      idx -= 1 if direction == 'end'
    else
        if direction == 'beginning'
          return string[idx..-1]
        else
          return string[0..idx]
        end
    end
  end
end

puts get_shortest_unique_substring(["A","B","C"], "ADOBECODEBANCDDD")

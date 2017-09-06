# Given an array of unique characters arr and a string str, Implement a function getShortestUniqueSubstring that finds the smallest substring of str containing all the characters in arr. Return "" (empty string) if such a substring doesn’t exist.
#
# Come up with an asymptotically optimal solution and analyze the time and space complexities.
#
# Example:
#
# input:  arr = ['x','y','z'], str = "xyyzyzyx"
#
# output: "zyx"

ef get_shortest_unique_substring(arr, str)
  # your code goes here
  # iterate through the string
  seen = Hash.new

  arr.each {|x| seen[x] = 0}

  str.chars.each  {|letter| seen[letter] += 1 if seen[letter]}

  arr.each {|letter| return '' if seen[letter] == 0}

  return '' if str.empty? || seen.values.include?(0)
  open = 0
  close = arr.length - 1

  shortest = str

  while open < close
    if seen[arr[close]] && ((seen[arr[close]] - 1) > 0)
      close -= 1
    end

    if seen[arr[open]] && ((seen[arr[open]] - 1) > 0)
      open += 1
    end
    shortest = arr[open..close] if arr[open..close].length < shortest.length
  end

  shortest
end

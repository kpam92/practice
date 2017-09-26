=begin
Given an array of strings, find all anagram pairs in the given array.
Input: arr[] =  {"geeksquiz", "geeksforgeeks", "abcd",
                 "forgeeksgeeks", "zuiqkeegs"};
Output: (geeksforgeeks, forgeeksgeeks), (geeksquiz, zuiqkeegs)
=end

def anagrams(arr)
  arr.each do |string|
    curr_hash = Hash.new {|h,k| h[k] = 0}
    string.chars.each {|x| curr_hash[x] += 1}
    string = [curr_hash,string]
  end
  result = []
  seen_hash = {}

  arr.each do |hash,string|
    if seen_hash[hash]
      result.push([seen_hash[hash],string])
    end
    seen_hash[hash] = string
  end

  result
end
arr = ["geeksquiz", "geeksforgeeks", "abcd","forgeeksgeeks", "zuiqkeegs"]

p anagrams(arr)

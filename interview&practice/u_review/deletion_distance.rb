# Deletion Distance
#
# The deletion distance of two strings is the minimum number of characters you need to delete in the two strings in order to get the same string. For instance, the deletion distance between "heat" and "hit" is 3:
#
# By deleting 'e' and 'a' in "heat", and 'i' in "hit", we get the string "ht" in both cases.
# We cannot get the same string from both strings by deleting 2 letters or fewer.
# Given the strings str1 and str2, write an efficient function deletionDistance that returns the deletion distance between them. Explain how your function works, and analyze its time and space complexities.
#
# Examples:
#
# input:  str1 = "dog", str2 = "frog"
# output: 3
#
# input:  str1 = "some", str2 = "some"
# output: 0
#
# input:  str1 = "some", str2 = "thing"
# output: 9
#
# input:  str1 = "", str2 = ""
# output: 0
require 'byebug'
def deletion_distance(string1,string2)


  matrix = Array.new(string1.length + 1) {Array.new(string2.length + 1) {0}}

  idx1 = 0

  while idx1 < string1.length + 1

    idx2 = 0
    while idx2 < string2.length + 1

      if idx1 == 0
        matrix[idx1][idx2] = idx2
      elsif idx2 == 0

        matrix[idx1][idx2] = idx1

      elsif string1[idx1 - 1] == string2[idx2 - 1]
        matrix[idx1][idx2] = matrix[idx1 - 1][idx2 - 1]
      else # string1[idx1] != string2[idx2]
        matrix[idx1][idx2] = 1 + [matrix[idx1 - 1][idx2],matrix[idx1][idx2 -1]].min
      end

      idx2 += 1
    end
    idx1 += 1
  end
  matrix[-1][-1]
end

p deletion_distance('frog','dog')
p deletion_distance('some','some')
p deletion_distance('some','thing')
p deletion_distance('this','that')
p deletion_distance('','')

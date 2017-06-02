# https://leetcode.com/problems/regular-expression-matching/#/description

require 'byebug'

def is_match(text, pattern)
  # your code goes here
  idx1 = 0
  idx2 = 0
  while idx2 < pattern.length || idx1 < text.length
    return false if text[idx1].nil? || pattern[idx2].nil?
    if pattern[idx2..idx2+1] == '.*'
      return true if pattern[idx2+2] == nil
      curr_result = matcher(text[idx1..-1],pattern[idx2+2], false)
      idx1 += curr_result
      idx2 += 2
    elsif pattern[idx2] == '.'
      idx1 += 1
      idx2 += 1
    elsif pattern[idx2+1] == '*'
      curr_result = matcher(text[idx1..-1],pattern[idx2], true)

      idx1 += curr_result
      idx2 += 2
    elsif pattern[idx2] == text[idx1]
      idx1 += 1
      idx2 += 1
    else
      return false
    end
  end
   true
end

def matcher(text,letter, matching)

  idx = 0
    if matching
        while idx < text.length
            if text[idx] != letter
              return idx
            else
              idx += 1
            end
        end
    else
        while idx < text.length
            if text[idx] == letter
              return idx
            else
              idx += 1
            end
        end
    end
  idx
end

puts is_match('aa','.*')

# Time Complexity: in the worst case, the solution above runs in time exponential in the size of the pattern. Patterns that take the most time, are the ones with multiple '*' symbols, that may provoke an exponential number of recursion calls: For example, for the text “bbbbbbbb” and the pattern “.*.*.*.*a”, this function will open a new recursive call to itself for every single way to divide the text in four (the number of “.*”).
#
# Space Complexity: the space required is also exponential because of the number of recursion calls filling up the stack. There are, in fact, algorithms that solve the matching problem in polynomial time and space. They are based on Nondeterministic Finite State Machines, which we didn’t provide here due to the fact that it requires more knowledge in theoretical computer science.
#
#
#
#
#
#
# function isMatch(text, pattern):
#     return isMatchHelper(text, pattern, 0, 0)
#
#
# #  Input:
# #    text - the text to check,
# #    pattern - the regular expression to be checked,
# #    textIndex - the index the text is checked from
# #    patIndex -  the index the pattern is checked from
# #  Output:
# #   true if the text from the index textIndex matches
# #   the regular expression pattern from the pattern Index.
# #   E.g. isMatchHelper(“aaabb”,”cab*”,2, 1) since the text
# #   from index 2 (“abb”) matches the pattern from index 1 (“ab*”)
#
# function isMatchHelper(text, pattern, textIndex, patIndex):
#     # base cases - one of the indexes reached the end of text or pattern
#     if (textIndex >= text.length):
#         if (patIndex >= pattern.length):
#             return true
#         else:
#             if (patIndex+1 < pattern.length) AND  (pattern[patIndex+1] == '*'):
#                 return isMatchHelper(text, pattern, textIndex, patIndex + 2)
#             else:
#                 return false
#
#     else if (patIndex >= pattern.length) AND (textIndex < text.length):
#         return false
#
#     # string matching for character followed by '*'
#     else if (patIndex+1 < pattern.length) AND (pattern[patIndex+1] == '*'):
#         if (pattern[patIndex] == '.') OR (text[textIndex] == pattern[patIndex]):
#             return (isMatchHelper(text, pattern, textIndex, patIndex + 2) OR
#                     isMatchHelper(text, pattern, textIndex + 1, patIndex))
#         else:
#             return isMatchHelper(text, pattern, textIndex, patIndex + 2)
#
#     # string matching for '.' or ordinary char.
#     else if (pattern[patIndex] == '.') OR
#             (pattern[patIndex] == text[textIndex]):
#         return  isMatchHelper(text, pattern, textIndex + 1, patIndex + 1)
#     else:
#         return false
#
# -----------------------------
#
# function findInOrderSuccessor(inputNode):
#     if (inputNode.right != null):
#         # return the node with minimum key in the right subtree
#         return findMinKeyWithinTree(inputNode.right)
#
#     ancestor = inputNode.parent
#     child = inputNode
#
#     # travel up using the parent pointer until you see
#     # a node which is the left child of its parent. The parent
#     # of such a node is successorNode.
#     while (ancestor != null AND child == ancestor.right):
#         child = ancestor
#         ancestor = child.parent
#
#     return ancestor
#
# function findMinKeyWithinTree(inputNode):
#     while (inputNode.left != null):
#         inputNode = inputNode.left
#
#     return inputNode

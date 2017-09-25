# =begin
# Each test file starts with an integer ‘t’ - the number of testcases.
# In each of the next ‘t’ lines, you are given a string of ‘n’ characters [ either ‘(‘ or ’)’ or ‘*’ ].
# Your task is to find the number of distinct balanced parentheses expressions you can make by replacing the ‘*’ with either ‘(‘ or ‘)’ or removing the ‘*’
# Note : You have to replace each ‘*’ with one of ‘(‘ or ‘)’ or remove it. If removed, assume the string has reduced by 1 character.
# Duplicate strings are not allowed. The final expressions to be counted have to be distinct
# As the answer may be large, please output it modulo 1000000007 (10^9+7)
# Output one integer per line corresponding to each testcase.
# Constraints :
# 1 <= t <= 20
# 1 <= n <= 100
# 0 <= Number of ‘*’ in the input string <= min(n,10)
#
# Sample Input:
# 2
# (*(*)*)
# *(*(**)*
# Sample Output
# 5
# 9
# Explanation
# The five possible valid solutions are for the first input are :
# ((()))
# ()(())
# ()()()
# (())()
# (())
# The nine possible valid solutions are for the second input are :
# (((())))
# (()(()))
# (()()())
# (()())
# ((()))
# ()(())
# ()()()
# ()()
# (())
#
#
# =end
#
# def pairs(string)
#   memo = {}
#   results = pair_helper(string,0).uniq
# end
#
# def pair_helper(string,count)
#   return nil if count < 0
#   if string.empty?
#     return [''] if count == 0
#     return nil
#   end
#   curr = string[0]
#   string = string[1..-1]
#
#   if curr == '('
#     curr_results = pair_helper(string,count + 1)
#   elsif curr == ')'
#     curr_results = pair_helper(string,count - 1)
#   else # curr == '*'
#     option1 = pair_helper(string,count + 1)||[]
#     option2 = pair_helper(string,count - 1)||[]
#     option3 = pair_helper(string,count)||[]
#     curr_results =  (option1 + option2 + option3)
#   end
#
#   if curr_results
#     return curr_results.map {|x| curr + x}
#   else
#     return nil
#   end
# end
#
# p pairs("(*(*)*)")
# =begin
#          (())
#          (())
#
# =end
# # p pairs("*(*(**)*")

=begin
Uber
1. Mirror Binary Tree
2. String pattern matching
The matching should cover the entire input string (not partial).
The function prototype should be:
bool isMatch(String str, String pattern)
Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa","a{1,3}") → true
isMatch("aaa","a{1,3}") → false
isMatch("ab","a{1,3}b{1,3}") → true
isMatch("abc","a{1,3}b{1,3}c") → true
isMatch("abbc","a{1,3}b{1,2}c") → false
isMatch("acbac","a{1,3}b{1,3}c") → false
isMatch("abcc","a{1,3}b{1,3}cc{1,3}") → true
In pattern string, a char followed by {lower, upper} means that the char occur lower to upper(exclusive) times. e.g. a{1, 3} -> a occurs 1 or 2 times.


=end

def regex_parser(string,pattern)
  
end

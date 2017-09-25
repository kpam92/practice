# Given a string s, return all the palindromic permutations ( without duplicates), of it. Return an empty array if no palindromic combinations can be formed.

def pal_perm(string)
  seen = Hash.new {|h,k| h[k] = 0}
  (0...string.length).each {|x| seen[string[x]] += 1}
  
end

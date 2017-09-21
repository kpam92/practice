require 'byebug'

# Pattern Matching
# You are given two strings, pattern and value. The pattern string consists of just
# the letters a and b, describing a pattern within a string. For example, the string
# catcatgocatgo matches the pattern aabab (where cat is a and go is b). It also matches
# patterns like a, ab, and b. Write a method to determine if value matches pattern.


def pattern_matcher(pattern,string)
return true if pattern.length == 1 && string.length > 0
return true if pattern.length == 2 && string.length > 1
  #normalize pattern to make 'a' be first
  if pattern[0] == 'b'
     (0...pattern.length).each do |x|
      if pattern[x] == 'b'
        pattern[x] = 'a'
      else
        pattern[x] = 'b'
      end
    end
  end

  pattern_helper(pattern,string,nil,nil)
end

def pattern_helper(pattern,string,a,b)
  if pattern.length == 1

    if pattern == 'a'
      return true if a.nil? || string == a
      return false
    elsif pattern == 'b'
      return true if b.nil? || string == b
      return false
    end
  end
  if pattern[0] == 'a' && !a.nil?
    return false if string[0...a.length] != a
    return pattern_helper(pattern[1..-1],string[a.length..-1],a,b)

  elsif pattern[0] == 'b' && !b.nil?

    return false if string[0...b.length] != b
    return pattern_helper(pattern[1..-1],string[b.length..-1],a,b)

  elsif pattern[0] == 'a' && a.nil?

    idx = 0
    while idx < string.length
      curr_check = pattern_helper(pattern[1..-1],string[idx+1..-1],string[0..idx],b)
      return curr_check if curr_check
      idx += 1
    end

  elsif pattern[0] == 'b' && b.nil?

    idx = 0
    while idx < string.length
      curr_check = pattern_helper(pattern[1..-1],string[idx+1..-1],a,string[0..idx])
      return curr_check if curr_check
      idx += 1
    end
  end
  false
end

p pattern_matcher('bbaba','catcatgocatgo')

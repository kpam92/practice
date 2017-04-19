
# 7.1 Implement methods that take a string representing
# an integer and return the corresponding integer, and
# vice-versa. Should handle negative numbers
# &&& NO LIBRARY FUNCTIONS (i.e. 'to_s' and 'to_i')

def str_to_int(string)
  if string[0] == '-'
    negative = true
    string = string[1..-1]
  end
  negative ||= false
  result = 0
  string.chars.each do |num|
    result = result * 10 + (num.ord - '0'.ord)
  end
  negative ? -result : result

end

def int_to_str(integer)
end

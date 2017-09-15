
# 7.1 Implement methods that take a string representing
# an integer and return the corresponding integer, and
# vice-versa. Should handle negative numbers
# &&& NO LIBRARY FUNCTIONS (i.e. 'to_s' and 'to_i')

def str_to_int(string)
  negative = false

  if string[0] == '-'
    negative = true
    string = string[1..-1]
  end

  result = 0
  string.chars.each do |num|
    result = result * 10 + (num.ord - '0'.ord)
  end
  negative ? -result : result

end

def int_to_str(integer)
  number = ''
  negative = integer < 0 ? true : false
  integer = -integer if negative
  while integer > 0
    curr_num = integer % 10
    number = (curr_num.ord + 48).chr + number
    integer /= 10
  end
  negative ? '-' + number : number
end

# How it works:
# Both iterate through each digit of the number/string, and uses
# the 'ord' element to switch into its opposite string or integer
# form. This uses O(n) time, and O(1) space complexity
# *****CHECK WITH SOMEONE IF SPACE COMPLEXITY IS CORRECT

# write a function that takes an array of letters and applies:
# 1. replace each 'a' with 2 'd's
# 2. delete each 'b'

# [a,c,d,b,b,c,a] ==> [d,d,c,d,c,d,d]
# O(n) time and O(1) space

def changer(array)
  array_counter = array.length

  while array_counter > 0
    curr_letter = array.shift
    if curr_letter == 'a'
      array.push('d','d')
    elsif curr_letter != 'b'
      array.push(curr_letter)
    end
    array_counter -= 1
  end
  array
end

require 'byebug'
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
# how it works:
# This function shifts the first letter,
# then depending on if it equals 'a' or 'b', it
# adds the respective changes by pushing the result onto the end
# when the counter reaches 0, we return the resulting array
# O(n) time where n is the length of the original array,
# O(1) space because we only hold onto variables instead of additional memory.


# create a function that changes a string of numbers into all possible combinations
# of letters from a telephone

def number_parse(string)
  # number_parser = {
  #   '2' => ['A','B','C'],
  #   '3' => ['D','E','F'],
  #   '4' => ['G','H','I'],
  #   '5' => ['J','K','L'],
  #   '6' => ['M','N','O'],
  #   '7' => ['P','Q','R','S'],
  #   '8' => ['T','U','V'],
  #   '9' => ['W','X','Y','Z']
  # }
  number_parser = {
    '1' => ['1'],
    '2' => %w(A B C),
    '3' => %w(D E F),
    '4' => %w(G H I),
    '5' => %w(J K L),
    '6' => %w(M N O),
    '7' => %w(P Q R S),
    '8' => %w(T U V),
    '9' => %w(W X Y Z),
    '0' => ['0']
  }

  return number_parser[string] if string.length == 1

  curr_letter_set = number_parser[string[0]]
  other_sets = number_parse(string[1..-1])

  result = []

  curr_letter_set.each do |letter|
    other_sets.each do |set|
      result << letter + set
    end
  end

  result

end

# How it works:
# this function takes out the first number and finds its set of letters,
# then iterates over subsequent sequences of the set and returns those sets
# with each letter in its sequence in a recursive manner. This takes O(4^n)
# because of all the possibilities of each sequence.

# Looksay sequence starts with '1', then afterwards follows with numbers of
# how many digits appear. i.e. '1', '11','21','1211'. Given an integer,
# find the n'th number in the sequence.

def look_say(n)
  return 0 if n == 0
  return 1 if n == 1

  counter = 1
  result = ['1']
  until counter == n

    curr_result = []
    count = 0
    curr_num = result[0] #1

    idx = 0
    while idx < result.length
      if result[idx] == curr_num
        count += 1
      else # result[idx] != curr_num
        curr_result.push("#{count}","#{curr_num}")
        count = 1
        curr_num = result[idx]
      end

      if idx == result.length - 1

        curr_result.push("#{count}","#{curr_num}")
      end
      idx += 1
    end

    result = curr_result
    counter += 1
  end
  result.join
end

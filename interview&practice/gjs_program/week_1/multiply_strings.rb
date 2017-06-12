# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
#
# Note:
#
# The length of both num1 and num2 is < 110.
# Both num1 and num2 contains only digits 0-9.
# Both num1 and num2 does not contain any leading zero.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

require 'byebug'

def multiply(num1, num2)
  string_to_num = {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '0' => 0,
  }
  # num_to_string = {
  #   1 => '1',
  #   2 => '2',
  #   3 => '3',
  #   4 => '4',
  #   5 => '5',
  #   6 => '6',
  #   7 => '7',
  #   8 => '8',
  #   9 => '9',
  #   0 => '0',
  # }

  num1 > num2 ? (num1, num2 = num2, num1) : (num1, num2 = num1, num2)

  idx1 = num1.length - 1
  multiplier = 1
  result = 0
  while idx1 >= 0
    curr_num = string_to_num[num1[idx1]]
    curr_prod = 0
    entire_num_multiplier = 1
    curr_multiplier = 1
    idx2 = num2.length - 1

    while idx2 >= 0
      # byebug
      curr_prod += (curr_num * string_to_num[num2[idx2]] * entire_num_multiplier * curr_multiplier)
      idx2 -= 1
      curr_multiplier *= 10
    end

    result += curr_prod
    entire_num_multiplier *= 10
    idx1 -= 1
  end
  result
end

puts multiply('90','1010')

# def add_zero(n)
#   n == 0 ? n = 10 : n *= 10
#   n
# end

# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
#
# Note:
#
# The length of both num1 and num2 is < 110.
# Both num1 and num2 contains only digits 0-9.
# Both num1 and num2 does not contain any leading zero.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.


def multiply(num1, num2)
  num_convert = {
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

  num1 > num2 ? (num1, num2 = num2, num1) : next

  idx1 = num2.length - 1
  multiplier = 1

  while idx1 >= 0
    curr_num = num_convert[num1[idx]]
    curr_prod = 0
    curr_multiplier = 1
    idx2 = num2.length - 1

    while idx2 >= 0
      curr_prod += (curr_num * num_convert[num2[idx2]] * curr_multiplier)
      idx2 -= 1
    end

    curr_multiplier *= 10
    idx1 -= 1
  end
end

# def add_zero(n)
#   n == 0 ? n = 10 : n *= 10
#   n
# end

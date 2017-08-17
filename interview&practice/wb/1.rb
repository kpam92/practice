# Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.

def digital_root(num)
  until (num % 10) == num
    num = digital_helper(num)
  end

  num
end

def digital_helper(num)
  result = 0
  multiplier = 10000000

  until num % multiplier != num
    multiplier /= 10
  end

  until num == 0
    result += (num - (num % multiplier)) / multiplier
    num %= multiplier
    multiplier /= 10
  end

  result
end


# puts digital_root(9999)

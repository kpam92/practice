# Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.

def digital_root(num)
  while num >= 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  divisor = 1

  until num % divisor == num
    divisor *= 10
  end

  divisor /= 10

  result = 0
  while num > 0
    remainder = num % divisor
    result += (num - remainder) / divisor
    num = remainder
    divisor /= 10
  end
  result
end


# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.

def caesar_cipher(string,shift)
  string = string.chars.map do |letter|

    new_ord = letter.ord + shift
    new_ord -= 26 if new_ord > 122
    letter = new_ord.chr

  end
  string.join('')
end

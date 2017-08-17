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


# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.

def caesar_cipher(string, shift)
  idx = 0

  while idx < string.length

    if string[idx].ord > 96 && string[idx].ord < 123
      curr_ord = string[idx].ord + shift

      if curr_ord > 122
        curr_ord -= 26
      elsif curr_ord < 97
        curr_ord += 26
      end

      string[idx] = curr_ord.chr
    end

    idx += 1
  end

  string
end

# Write a function, longest_common_substring(str1, str2) that takes two strings and returns the longest common substring. A substring is defined as any consecutive slice of letters from another string.

def longest_common_substring(string1, string2)
end


# Write a function that takes an array of integers and returns their sum. Use recursion.

def array_sum(array)
  curr_num = array.pop
  return curr_num if array.empty?

  curr_num + array_sum(array)
end

# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
#
# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows:
#
# string convert(string text, int nRows);
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
# Subscribe to see which companies asked this question.


def convert(s, num_rows)

  return s if num_rows == 1

  result = []
  num_rows.times { result << ""}

  array_idx = 0
  idx = 0
  forward = true

  while idx < s.length
    result[array_idx] += s[idx]

    if forward && array_idx != (num_rows - 1)
      array_idx += 1
    elsif !forward && array_idx != 0
      array_idx -= 1
    elsif forward
      forward = false
      array_idx -= 1
    else
      forward = true
      array_idx += 1
    end

    idx += 1
  end

  result.join
end

puts convert("ABCD", 1)
puts convert("ABCD", 2)

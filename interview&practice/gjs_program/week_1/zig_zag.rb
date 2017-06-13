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
    converted = []
    num_rows.times { converted << ''}

    array_idx = 0
    idx = 0

    while idx < s.length
      converted[array_idx] += s[idx]

      if array_idx == (num_rows - 1) && idx != (s.length - 1)
        idx += 1
        median = num_rows.even? ? (num_rows/2 - 1) : num_rows/2
        converted[median] += s[idx]

        # to make sure array_idx is 0 next time
        array_idx = -1
      end

      idx += 1
      array_idx += 1
    end
  converted.join
end

puts convert("A", 1)

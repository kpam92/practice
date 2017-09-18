# Given two arrays of integers, build the maximum number possible from all the input numbers without violating the internal order of either of the original arrays.
#
# Example: [1,3,2], [9,1,1] => 913211 [1,1,2,1], [1,1,1] => 1121111

def max_num(array1,array2)
  result = ''

  until array1.empty? || array2.empty?
    if array1[0] > array2[0]
      result += array1.shift.to_s
    elsif array2[0] > array1[0]
      result += array2.shift.to_s
    else # array1[0] == array2[0]
      next_num = find_next_diff(array1,array2)
      if next_num[0] == 'array1'
        result += array1.shift(next_num[1] - 1).map(&:to_s).join
      else
        result += array2.shift(next_num[1] - 1).map(&:to_s).join
      end
    end
  end
end

def find_next_diff(array1,array2)
  idx = 0
  while idx < array1.length && idx < array2.length
    if array1[idx1] == array[idx2]
      if idx == array1.length - 1
        return ['array2',idx]
      elsif idx == array2.length - 1
        return ['array1',idx]
      end
      idx += 1
    else # they don't equal
      if array1[idx] > array2[idx]
        return ['array1',idx - 1]
      else
        return ['array2',idx - 1]
      end
    end
  end
  ['array1',idx - 1]
end

p max_num([1,3,2], [9,1,1])

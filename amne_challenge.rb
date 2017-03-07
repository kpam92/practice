

def sub_array(array)
  idx1 = 0
  idx2 = 1
  curr_count = array[idx1]
  while idx2 < array.length
    curr_count += array[idx2]
    if array[idx2] == array[idx1]
      curr_count += (array[idx2] * (idx2 - idx1))
    else
      idx1 = idx2
    end
    idx2 += 1
  end
  curr_count
end

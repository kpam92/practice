

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

def array_subs(array,length,k)
  differences = []

  idx = 0
  while idx < (length - 2)
    differences << (array[idx+1] <=> array[idx])
    idx += 1
  end

idx3 = 0
while idx3 < array.length - k + 1
  puts sub_array(differences[idx3..idx3+(k-2)])
  idx3 += 1
end

end

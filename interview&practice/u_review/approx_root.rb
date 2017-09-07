
def find_root(x,n)
  return 0 if x == 0

  low = 0
  upper = [1,x].max
  approx_root = (low + upper)/2

  while approx_root - low >= 0.001
    if approx_root**n > x
      upper = approx_root
    elsif approx_root**n < x
      low = approx_root
    else
      break
    end
    approx_root = (upper + lower)/2
  end
  approx_root
end


puts find_root(7,1)

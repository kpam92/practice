require 'byebug'
def find_root(x,n)
  return 0 if x == 0

  low = 0
  upper = [1,x].max
  approx_root = ((low + upper)/2).to_f

  while approx_root - low >= 0.001
    if approx_root**n > x
      upper = approx_root
    elsif approx_root**n < x
      low = approx_root
    else
      byebug
      break
    end
    approx_root = ((upper + low)/2).to_f
  end
  approx_root.round(3)
end


puts find_root(7,1)

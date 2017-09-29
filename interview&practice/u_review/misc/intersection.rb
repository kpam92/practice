# Given arr1 and arr2, find the intersection of both sets. It should be trivial to write an O(n**2) solution. Use sorting to solve in O(nlog(n)). Next, improve this to O(n) time (maybe use a non-array datastructure).

#O(n^2)
def intersect1(arr1,arr2)

  idx1 = 0
  while idx1 < arr1.length
    idx2 = 0
    while idx2 < arr2.length
      if arr1[idx1] == arr2[idx2]
        curr = idx1
        while arr1[idx1] == arr2[idx2]
          idx1 += 1
          idx2 += 1
        end
        return arr1[curr...idx1]
      end
      idx2 += 1
    end
    idx1 += 1
  end
end

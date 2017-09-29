require 'set'
# Given arr1 and arr2, find the intersection of both sets. It should be trivial to write an O(n**2) solution. Use sorting to solve in O(nlog(n)). Next, improve this to O(n) time (maybe use a non-array datastructure).

#O(n^2)
def intersection1(arr1, arr2)
  arr1.uniq.select { |el| arr2.include?(el) }
end

#O(nlogn)

def interection2(arr1,arr2)
  arr1.sort!
  arr2.sort!

  idx1 = 0
  idx2 = 0

  while idx1 < arr1.length && idx2 < arr2.length
    result = []

    if arr1[idx1] == arr2[idx2]
      result.push(arr1[idx1])
      idx1 += 1
      idx2 += 1
    elsif arr1[idx1] < arr2[idx2]
      idx1 += 1
    else #arr1[idx1] > arr2[idx2]
      idx2 += 1
    end
  end

  result
end

#O(n)

def intersection3(arr1,arr2)
  seen = Set.new
  result = []
  arr1.each {|x| seen.add(x)}
  arr2.each {|x| result << x if seen.include?(x)}
  result
end

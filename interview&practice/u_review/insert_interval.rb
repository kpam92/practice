=begin
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

Example 1:
Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].

Example 2:
Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].

This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
[1,2],[3,5],[6,7],[8,10],[12,16]
        XX   XX    XX
                  [3,10]
=end

def insert_interval(sets,n)
  result = []

  idx = 0

  until sets.empty?
    curr_compare = sets.shift
    if intersect?(n,curr_compare)
      n = [[n[0],curr_compare[0]].min,[n[1],curr_compare[1]].max]
    elsif n[1] < curr_compare[1]
      result.push(n)
      result.concat(sets)
      break
    else
      result.push(curr_compare)
      result.push(n) if sets.length == 0
    end
  end

  result
end

def intersect?(array1,array2)
  array1[1] >= array2[0] && array1[0] <= array2[1]
end

p insert_interval([[1,2],[3,5],[6,7],[8,10],[12,16]],[4,9])

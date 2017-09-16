=begin
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].
=end

def merge(intervals)

    return intervals if intervals.length < 2

    curr_interval = intervals[0]

    idx = 1
    result = []
    while idx < intervals.length
        intersecting = check_intersection(curr_interval,intervals[idx])

        if intersecting
            curr_interval = [[curr_interval[0],intervals[idx][0]].min,[curr_interval[1],intervals[idx][1]].max]
        else # intersecting == false
            result.push(curr_interval)
            curr_interval = intervals[idx]
        end
        if idx == intervals.length - 1
            result.push(curr_interval)
        end
        idx += 1
    end

    result
end

def check_intersection(array1,array2)
    array1[1] >= array2[0] && array1[0] <= array2[1]
end

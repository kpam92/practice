# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

require 'byebug'
def find_median_sorted_arrays(nums1, nums2)

    return nil if nums1.empty? && nums2.empty?

    half_length = (nums1.length + nums2.length) / 2

    count = 0
    curr_before_median = nil
    curr_median = nil

    idx1 = 0
    idx2 = 0

    until count == half_length + 1

      if nums2[idx2].nil?
        curr_before_median = curr_median
        curr_median = nums1[idx1]
        idx1 += 1
      elsif  nums1[idx1].nil?
        curr_before_median = curr_median
        curr_median = nums2[idx2]
        idx2 += 1
      elsif (nums1[idx1] < nums2[idx2])
        curr_before_median = curr_median
        curr_median = nums1[idx1]
        idx1 += 1
      elsif  nums1[idx1] >= nums2[idx2]
        curr_before_median = curr_median
        curr_median = nums2[idx2]
        idx2 += 1
      end

      count += 1

    end

    if (nums1.length + nums2.length).even?
      diff = (curr_median - curr_before_median).to_f / 2
      return curr_before_median + diff
    else
      return curr_median
    end
end

puts find_median_sorted_arrays([1,2],[3,4])

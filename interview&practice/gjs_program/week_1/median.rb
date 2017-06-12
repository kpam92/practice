# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).


def find_median_sorted_arrays(nums1, nums2)
    total_length = nums1.length + nums2.length
    if total_length.odd?
        odd_median(nums1,nums2,total_length/2)
    else
        even_median(nums1,nums2,total_length/2)
    end
end

def odd_median(nums1,num2,length)
    count = 0

    idx1 = 0
    idx2 = 0
    curr_median = nil
    while count < length
        if nums1[idx1] < nums2[idx2]
            count += 1
            return nums1[idx1] if count + 1 == length
            idx1 += 1
            count += 1
        else
            count += 1
            return nums2[idx2] if count + 1 == length
            idx2 += 1
            count += 1
        end
    end

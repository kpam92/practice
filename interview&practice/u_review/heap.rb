arr = [1,4,2,3,5,6]

def heap_sort(arr)
  arr = heapify_up(arr)
  arr = heapify_down(arr)
end

def heapify_up(arr)
  tail = 0

  while tail < arr.length

    curr_idx = tail
    sorted = false

    until sorted

      if curr_idx == 0
        sorted = true
        break
      end

      parent_idx = (curr_idx - 1)/2

      if arr[parent_idx] >= arr[curr_idx]
        sorted = true
      else # parent < curr
        arr[parent_idx],arr[curr_idx] = arr[curr_idx],arr[parent_idx]
        curr_idx = parent_idx
      end
    end

    tail += 1
  end

  arr
end

def heapify_down(arr)

  tail = arr.length - 1

  while tail > 0
    arr[0],arr[tail] = arr[tail],arr[0]
    tail -= 1

    curr_idx = 0
    sorted = false

    until sorted
      children = []
      child_1 = (curr_idx*2) + 1 < tail ? (curr_idx*2) + 1 : nil
      child_2 = (curr_idx*2) + 2 < tail ? (curr_idx*2) + 2 : nil

      highest_child_idx = nil

      unless child_1.nil?
        if arr[child_1] > arr[curr_idx]
          highest_child_idx = child_1
        end
      end

      unless child_2.nil?
        if highest_child_idx && arr[child_2] > arr[highest_child_idx]
          highest_child_idx = child_2
        elsif highest_child_idx.nil? && arr[child_2] > arr[curr_idx]
          highest_child_idx = child_2
        end
      end

      if highest_child_idx.nil?
        sorted = true
      else
        arr[curr_idx],arr[highest_child_idx] = arr[highest_child_idx],arr[curr_idx]
        curr_idx  = highest_child_idx
      end

    end
  end
  arr
end

puts heap_sort([6,1,4,11,2,0,3,7,10,5,8,9])

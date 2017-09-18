class BinaryMinHeap
  def initialize(&prc)
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    children = []
    child_1 = (2*parent_index) + 1
    child_2 = (2*parent_index) + 2
    children.push(child_1) if child_1 < len
    children.push(child_2) if child_2 < len
    children
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    parent = (child_index - 1)/2

  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc||= Proc.new {|x,y| y <=> x }

    curr_idx = parent_idx
    sorted = false
    until sorted
          children = []
          child_1 = (curr_idx*2) + 1 < len ? (curr_idx*2) + 1 : nil
          child_2 = (curr_idx*2) + 2 < len ? (curr_idx*2) + 2 : nil

          highest_child_idx = nil

          unless child_1.nil?
            if prc.call(array[child_1], array[curr_idx]) == 1
              highest_child_idx = child_1
            end
          end

          unless child_2.nil?
            if highest_child_idx && prc.call(array[child_2],array[highest_child_idx]) == 1
              highest_child_idx = child_2
            elsif highest_child_idx.nil? && prc.call(array[child_2],array[curr_idx]) == -1
              highest_child_idx = child_2
            end
          end

          if highest_child_idx.nil?
            sorted = true
          else
            array[curr_idx],array[highest_child_idx] = array[highest_child_idx],array[curr_idx]
            curr_idx  = highest_child_idx
          end

        end
        array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc||= Proc.new {|x,y| x <=> y}

    curr_idx = child_idx
    sorted = false
    until sorted
      if curr_idx == 0
        sorted = true
        break
      end

      parent_idx = (curr_idx - 1)/2

      if prc.call(array[parent_idx],array[curr_idx]) == -1
        sorted = true
      else # parent < curr
        array[parent_idx],array[curr_idx] = array[curr_idx],array[parent_idx]
        curr_idx = parent_idx
      end
    end
    array
  end
end

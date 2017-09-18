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
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end

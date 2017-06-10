# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    length1 = 0
    length2 = 0

    first_list = l1
    second_list = l2

    until l1.next.nil?
        l1 = l1.next
        length1 += 1
    end

    until l2.next.nil?
        l2 = l2.next
        length2 += 1
    end

    if length1 > length2
        until length2 == length1
            length2 += 1
            l2.next = ListNode.new(0)
            l2 = l2.next
        end
    elsif length2 > length1
        until length1 == length2
            length1 += 1
            l1.next = ListNode.new(0)
            l1 = l1.next
        end
    end

    curr_val = first_list.val + second_list.val
    remainder = curr_val / 10


    result = ListNode.new(curr_val % 10)
    first_list = first_list.next
    second_list = second_list.next

    curr_result_node = result

    until first_list.nil?
        curr_val = (first_list.val + second_list.val) + remainder
        curr_result_node.next = ListNode.new(curr_val % 10)
        remainder = curr_val / 10
        curr_result_node = curr_result_node.next
        first_list = first_list.next
        second_list = second_list.next
    end

    if remainder > 0
        curr_result_node.next = ListNode.new(remainder)
    end

    result
end

# a = ListNode.new(2)
# b = ListNode.new(4)
# c = ListNode.new(3)
# d = ListNode.new(5)
# e = ListNode.new(6)
# f = ListNode.new(4)
# a.next = b
# b.next = c
# d.next = e
# e.next = f

# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.


def is_valid(s)
    partners = { '('=> ")", "{"=> "}", "[" => "]" }

    stack = []

    idx = 0

    while idx < s.length

        if partners[s[idx]]
            stack.push(s[idx])
        else
            if s[idx] == partners[stack[-1]]
                stack.pop
            else
                return false
            end
        end
        idx += 1
    end
    stack.empty? ? true : false
end

# puts is_valid(']')
# puts is_valid('[')

# how it works
# this solution utilizes a hash and a stack, where each opening bracket
# is thrown into the stack, and will pop off the stack when its partner
# is seen, otherwise it returns false. If at the end the stack is empty
# it will return true. This iterates through the entire string, so it has
# O(n) time complexity, where n is the length of the string.

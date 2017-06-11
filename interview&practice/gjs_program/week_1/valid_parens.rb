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

# Given an absolute path for a file (Unix-style), simplify it.
#
# For example,
# path = , => "/home"
# path = "/a/./b/../../c/", => "/c"
# click to show corner cases.


def absolute_path(string)
  words = string.split("/")
  result = []
  idx = 0

  while idx < words.length
    if words[idx] == "" || words[idx] == "."
      next
    elsif word == ".."
      result.pop
    else
      result.push(words[idx])
    end

    idx += 1
  end

  result.join("/")
end

puts absolute_path("/home/")
puts absolute_path("/a/./b/../../c/")

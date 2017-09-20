=begin
Write a function to generate all possible n pairs of balanced parentheses.

For example,

Input : n=1
Output: {}

Input : n=2
Output:
{}{}
{{}}
=end


def parens_print(n)
  parens_creator(n,0,0)
end

def parens_creator(n,open_count,close_count)
  if open_count == n && (close_count == n - 1)
    return [')']
  end
  next_subsets = []
  if open_count < n && open_count == close_count # equal sets
    #we have to add an open parenthesis if open and close are equal
    curr_subs = parens_creator(n,open_count+1,close_count)
    curr_subs.map! {|x| '(' + x}
    next_subsets.concat(curr_subs)
  elsif open_count == n && close_count < n
    curr_subs = parens_creator(n,open_count,close_count + 1)
    curr_subs.map! {|x| ')' + x}
    next_subsets.concat(curr_subs)
  elsif open_count < n && close_count < n
    curr_open_subs = parens_creator(n,open_count+1,close_count)
    curr_open_subs.map! {|x| '(' + x}
    next_subsets.concat(curr_open_subs)
    curr_close_subs = parens_creator(n,open_count,close_count + 1)
    curr_close_subs.map! {|x| ')' + x}
    next_subsets.concat(curr_close_subs)
  end
  next_subsets
end

p parens_print(1)

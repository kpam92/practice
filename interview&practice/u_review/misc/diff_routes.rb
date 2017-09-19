=begin
Consider that the driver with one trip want to pick up some peoples in different locations like this:
String[] locations ={
"person1, person2, person3, person4, person5",
" person6, person7, person8, person9",
"person10, person11, person12",
"person13, person14, person15",}
in each location there are different choice, so write a code present all possible way to pick up people in the different locations. you can use every data structure needs.
=end

def routes(array)
  return [[]] if array.empty?
  curr_people = array.shift
  next_subs = routes(array)
  result = next_subs

  curr_people.each do |curr_pass|
    next_subs.each do |curr_sub|
      result.push([curr_pass] + curr_sub)
    end
  end
  result
end


puts routes([['a','b'],['c','d']])

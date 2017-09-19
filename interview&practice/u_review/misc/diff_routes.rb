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
  return array[0].map {|x| x = [x]} if array.length == 1
  curr_people = array.shift

  next_subs = routes(array)
  result = []

  curr_people.each do |curr_pass|
    next_subs.each do |curr_sub|
      result << ([curr_pass] + curr_sub)
    end
  end
  result
end


p routes([['a','b'],['c','d'],['e','f']])

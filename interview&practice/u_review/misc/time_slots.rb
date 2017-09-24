=begin
Given input which is vector of log entries of some online system each entry is something like (user_name, login_time, logout_time), come up with an algorithm with outputs number of users logged in the system at each time slot in the input, output should contain only the time slot which are in the input. For the example given below output should contain timeslots
[(1.2, 1), (3.1, 2), (4.5, 1), (6.7, 0), (8.9, 1), (10.3,0)]

/*
[
("Jane", 1.2, 4.5),
("Jin", 3.1, 6.7),
("June", 8.9, 10.3)
]

=>

[(1.2, 1), (3.1, 2), (4.5, 1), (6.7, 0), (8.9, 1), (10.3, 0)]

*/


=end

def time_slots(array)
  time_slots = []
  until array.empty?
    curr_in,curr_out = array.shift
    time_slots.push([curr_in,1],[curr_out,-1])
  end

  time_slots.sort!
  result = []
  logged = 0
  idx = 0

  while idx < time_slots.length
    curr_time, logged_in = time_slots[idx]
    logged += logged_in
    result.push([curr_time, logged])
    idx += 1
  end

  result
end
times = [
  [1.2, 4.5],
  [3.1, 6.7],
  [8.9, 10.3]
]
p time_slots(times) == [[1.2, 1], [3.1, 2], [4.5, 1], [6.7, 0], [8.9, 1], [10.3, 0]]

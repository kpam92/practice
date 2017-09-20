=begin
A city's skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Now suppose you are given the locations and height of all the buildings as shown on a cityscape photo (Figure A), write a program to output the skyline formed by these buildings collectively (Figure B).
The geometric information of each building is represented by a triplet of integers [Li, Ri, Hi], where Li and Ri are the x coordinates of the left and right edge of the ith building, respectively, and Hi is its height.

For instance, the dimensions of all buildings in Figure A are recorded as: [ [2 9 10], [3 7 15], [5 12 12], [15 20 10], [19 24 8] ] .

The output is a list of "key points" (red dots in Figure B) in the format of [ [x1,y1], [x2, y2], [x3, y3], ... ] that uniquely defines a skyline. A key point is the left endpoint of a horizontal line segment. Note that the last key point, where the rightmost building ends, is merely used to mark the termination of the skyline, and always has zero height. Also, the ground in between any two adjacent buildings should be considered part of the skyline contour.

For instance, the skyline in Figure B should be represented as:[ [2 10], [3 15], [7 12], [12 0], [15 10], [20 8], [24, 0] ].

=end

def skyline(buildings)

  max_x = buildings.max_by {|x| x[1]}[1]

  height_array = []
  (max_x+1).times do |i|
    height_array << [i,0]
  end

  buildings.each do |tower|
    (tower[0]..tower[1]).each do |i|
      height_array[i][1] = tower[2] if tower[2] > height_array[i][1]
    end
  end

  height_array.each_with_index do |coord,idx|
    next if idx == 0
    height_array[idx-1][1] = coord[1] if coord[1] > height_array[idx-1][1]
  end


    result = []

    (0..height_array.length-1).each do |i|

      next if result.empty? && height_array[i][1].zero?

      if i == 0
        result << height_array[i]
        next
      end

      result << height_array[i] if height_array[i][1] != height_array[i-1][1]

      result << [i, 0] if i == height_array.length - 1
    end

    result
  end

buildings = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
p skyline(buildings)

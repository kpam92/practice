# Write a function for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.

# let's reimagine this to be with an array of sorted numbers for easier read


def find_rotation_point(array)

  floor_index = 0
  ceiling_index = array.length - 1

  while floor_index < ceiling_index

    guess_index = (floor_index + ceiling_index)

    if array[floor_index] <= array[guess_index]
      floor_index = guess_index
    else
      ceiling_index = guess_index
    end

    if floor_index + 1 == ceiling_index
      return ceiling_index
    end
  end
end

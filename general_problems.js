// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function() {
  ctx = this;
  start = arguments[0]
  end = arguments[1] === undefined ? this.length : arguments[1];
  end > this.length ? end = this.length : end = end;
  result = ""
  for(start; start < end; start++) {
    result += ctx[start];
  }
  return result;
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function(callback) {
  let accum = this[0];
  this.slice(1).forEach(el=> {
    accum = callback(accum,el);
  })
  return accum;
}

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.
def quicksort(array,&prc)

  prc ||= proc { |x,y| x <=> y }

  return array if array.length < 2

  pivot = array.first
  left,right = [],[]

  array.drop(1).each do |el|
    if prc.call(el,pivot) == 1
      left << el
    else
      right << el
    end
  end

  return quicksort(left,prc).concat([pivot]).concat(quicksort(right,prc))

end
// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

// write sumNPrimes(n)

// write Function.prototype.myBind.

// write Function.prototype.inherits.

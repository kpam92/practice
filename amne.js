var fs = require('fs');
var input = fs.readFileSync('input.txt').toString().split("\n");

var array = input[1].split(" ")
for(var i=0; i<array.length; i++) { array[i] = +array[i]; }

var length = parseInt(input[0].split(" ")[0])
var k = parseInt(input[0].split(" ")[1])

arraySubs(array,length,k);

/*
helper function that takes in array as an argument, presumably with
number -1,0, and 1, and crawls through each number, adding each number
to the count, while also adding an extra sum of numbers to the count
if there is a contiguous progression. i.e. if the array is [1,1,1.0],
count will go up for each 1, but it will also go up for [1,1],[1,1] & [1,1,1]
*/
function subArray(array) {

  let idx1 = 0
  let idx2 = 1
  let currCount = array[idx1]
  while (idx2 < array.length) {
    currCount += array[idx2]
    if (array[idx2] == array[idx1]){
      currCount += (array[idx2] * (idx2 - idx1))
    } else {
    idx1 = idx2
    };
    idx2 += 1;
  }
  return currCount;
};

function arraySubs(array,length,k){

  let differences = [];


  /*
  this while loop iterates through the array and compares every
  permutation pair, then pushes the result into the differences array.
  positive progression = 1, none = 0, negative = -1. This creates the array
  that will be passed into the subArray helper function above.
  */
  let idx1 = 0
  while (idx1 < (length - 2)){
    if (array[idx1] < array[idx1+1]) {
      differences.push(1)
    } else if (array[idx1] > array[idx1+1]) {
      differences.push(-1)
    } else {
      differences.push(0)
    };
    idx1 += 1;
  };

  let idx3 = 0;
  /*
  this while loop passes the differences array into the subArray helper
  helper function and prints the results of each sub array window
  */
  while ( idx3 < array.length - k + 1) {
    console.log(subArray(differences.slice(idx3,(idx3 + (k-1)))))
    idx3 += 1
  };

};

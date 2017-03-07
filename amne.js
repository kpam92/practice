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

  while ( idx3 < array.length - k + 1) {
    console.log(subArray(differences.slice(idx3,(idx3 + (k-1)))))
    idx3 += 1
  };

};

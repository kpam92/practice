function uniq(array) {
  result = [];
  array.forEach(x=>{
    if (result.indexOf(x) === -1) {
      result.push(x);
    }
  })
  return result;
}

function twoSum(array,x) {
  for(i = 0; i < array.length - 1; i++){
    for(j = i + 1; j < array.length; i++) {
      if (array[i] + array[j] === x) {
        return true;
      }
    }
  }
  return false;
}

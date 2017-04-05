
function sum(...args) {
  let sum = 0
  args.forEach(arg=> sum += arg)
  return sum;
}

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(number){
    numbers.push(number);

    if (numbers.length === numArgs) {
      total = 0;
      numbers.forEach(el => total += el);
      return total;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

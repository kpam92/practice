
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

Function.prototype.myBind = function(ctx) {
  let that = this;
  let bindArgs = Array.from(arguments).slice(1);
  return function() {
    let callArgs = Array.from(arguments);
    return that.apply(ctx,bindArgs.concat(callArgs));
  };

}

Function.prototype.myBind2 = function(ctx,...bindArgs) {
  return (...callArgs) => {this.apply(ctx,bindArgs.concat(callArgs))}

}

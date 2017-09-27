// let error = {
//   name: ['This field is required', 'Another error'],
//   age: ['Only numeric characters are allowed'],
// };
//
// // transformed
error = {
  name: ['This field is required'],
  age: ['This field is required', 'Only numeric characters are allowed'],
  urls: [{}, {}, {
    site: {
      code: ['This site code is invalid'],
      id: ['Unsupported id'],
    }
  }],
  tags: [{}, {
    non_field_errors: ['Only alphanumeric characters are allowed'],
    another_error: ['Only alphanumeric characters are allowed'],
    third_error: ['Third error']
  }, {}, {
    non_field_errors: [
      'Minumum length of 10 characters is required',
      'Only alphanumeric characters are allowed',
    ],
  }],
  tag: {
    nested: {
      non_field_errors: ['Only alphanumeric characters are allowed'],
    },
  }
};
// const Immutable = require('immutable');
// const errors = Immutable.fromJS({
//   name: 'This field is required. Another error.',
//   age: 'Only numeric characters are allowed.'
// });


function errorChanger(topObject) {
  return Object.keys(topObject).map(key => {
    if (Object.prototype.toString.call(topObject[key]) == '[object Array]') {
      return {key:key, value:[...new Set(arrayParser(topObject[key]))].join('. ')};
    } else if (Object.prototype.toString.call(topObject[key]) == '[object Object]') {
      return {key:key, value:[...new Set(flatten(objectParser(topObject[key])))]};
    } else if (Object.prototype.toString.call(topObject[key]) == '[object String]') {
      // console.log(topObject[key])
      return {key:key,value:topObject[key]};
      // return 'hi'
    }
  }).reduce(function(obj,item){
  obj[item.key] = item.value;
  return obj;
  }, {});
}
function flatten(ary) {
  return ary.reduce(function(a, b) {
    if (Array.isArray(b)) {
      return a.concat(flatten(b))
    }
    return a.concat(b)
  }, [])
}
function objectParser(currObject) {
  return flatten(Object.keys(currObject).map(key => {
    if (Object.prototype.toString.call(currObject[key]) == '[object Array]') {
      if (key == 'non_field_errors') {
        console.log(flatten(arrayParser(currObject[key])))
      }
      return flatten(arrayParser(currObject[key]));
    }
    else if (Object.prototype.toString.call(currObject[key]) == '[object Object]') {
      return objectParser(currObject[key]);
    } else if (Object.prototype.toString.call(currObject[key]) == '[object String]'){
      return currObject[key];
    }
  }))
}

function arrayParser(currArray) {
  return flatten(currArray.map(item => {
    if (Object.prototype.toString.call(item) == '[object Array]'){
      return arrayParser(item);
    } else if (Object.prototype.toString.call(item) == '[object Object]'){
      return objectParser(item);
    } else if (Object.prototype.toString.call(item) == '[object String]'){
      return item;
    };
  }))
}
console.log(errorChanger(error))
// console.log(arrayParser(['hi','hello',{'hi':'hello'}]))
//iterate over initial keys
// iterate through array of each key. collecting the errors in an object

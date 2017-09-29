const Immutable = require('immutable');
const assert = require('assert');


function transformErrors(currObject) {
  function errorChanger(topObject) {
    // console.log(topObject.keySeq().toArray())
    // console.log(Object.prototype.toString.call(topObject.get('name').toJS()))

    // console.log(Object.prototype.toString.call(topObject.get('name').toJS()))
  return topObject.keySeq().toArray().map(key => {
    if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object Array]') {
      return {key:key, value:[...new Set(arrayParser(topObject.get(key)))].join('. ')};
    } else if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object Object]') {
      return {key:key, value:[...new Set(objectParser(topObject.get(key)))].join('. ')};
    } else if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object String]') {
      // console.log(topObject[key])
      return {key:key,value:topObject[key]};
      // return 'hi'
    }
    })
    // .reduce(function(obj,item){
    // obj[item.key] = item.value;
    // return obj;
    // }, {});
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
      if (Object.prototype.toString.call(currObject.get(key)) == '[object Array]') {
        if (key == 'non_field_errors') {
          console.log(flatten(arrayParser(currObject.get(key))))
        }
        return flatten(arrayParser(currObject.get(key)));
      }
      else if (Object.prototype.toString.call(currObject.get(key)) == '[object Object]') {
        return objectParser(currObject.get(key));
      } else if (Object.prototype.toString.call(currObject.get(key)) == '[object String]'){
        return currObject[key];
      }
    }))
  }

  function arrayParser(currArray) {
    // console.log(currArray).map(item => {
    //   if (Object.prototype.toString.call(item) == '[object Array]'){
    //     return arrayParser(item);
    //   } else if (Object.prototype.toString.call(item) == '[object Object]'){
    //     return objectParser(item);
    //   } else if (Object.prototype.toString.call(item) == '[object String]'){
    //     return item;
    //   };
    // })
    return flatten(currArray.map(item => {
      if (Object.prototype.toString.call(item) == '[object Array]'){
        return arrayParser(item);
      } else if (Object.prototype.toString.call(item) == '[object Object]'){
        return objectParser(item);
      } else if (Object.prototype.toString.call(item) == '[object String]'){
        console.log(item)
        return item;
      };
    }))
  }
  return errorChanger(currObject);
}

it('should tranform errors', () => {
  // example error object returned from API converted to Immutable.Map
  const errors = Immutable.fromJS({
    name: ['This field is required'],
    age: ['This field is required', 'Only numeric characters are allowed'],
    urls: [{}, {}, {
      site: {
        code: ['This site code is invalid'],
        id: ['Unsupported id'],
      }
    }],
    url: {
      site: {
        code: ['This site code is invalid'],
        id: ['Unsupported id'],
      }
    },
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
    },
  });

  // in this specific case,
  // errors for `url` and `urls` keys should be nested
  // see expected object below
  const result = transformErrors(errors);
  // console.log(result)
  assert.deepEqual(result.toJS(), {
    name: 'This field is required.',
    age: 'This field is required. Only numeric characters are allowed.',
    urls: [{}, {}, {
      site: {
        code: 'This site code is invalid.',
        id: 'Unsupported id.',
      },
    }],
    url: {
      site: {
        code: 'This site code is invalid.',
        id: 'Unsupported id.',
      },
    },
    tags: 'Only alphanumeric characters are allowed. Third error. ' +
      'Minumum length of 10 characters is required.',
    tag: 'Only alphanumeric characters are allowed.',
  });
});

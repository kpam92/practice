const Immutable = require('immutable');
const assert = require('assert');


function transformErrors(currObject) {

  function errorChanger(topObject) {
    return topObject.keySeq().toArray().map(key => {
      if (key == 'url' || key == 'urls') {
        return {key:key, value:topObject.get(key)};
      } else if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object Array]') {
        return {key:key, value:[...new Set(arrayParser(topObject.get(key)))].join('. ')};
      } else if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object Object]') {
        return {key:key, value:[...new Set(objectParser(topObject.get(key)))].join('. ')};
      } else if (Object.prototype.toString.call(topObject.get(key).toJS()) == '[object String]') {
        return {key:key,value:topObject[key]};
      }
      })
      // .reduce(function(obj,item){
      //   obj.set(item.key,item.value);
      //   return obj;
      //   }, Immutable.Map());
  };

  function flatten(ary) {
    return ary.reduce(function(a, b) {
      if (Array.isArray(b)) {
        return a.concat(flatten(b))
      }
      return a.concat(b)
    }, [])
  };

  function objectParser(currObject) {
    return flatten(Object.keys(currObject).map(key => {
      if (Object.prototype.toString.call(currObject.get(key)) == '[object Array]') {
        return flatten(arrayParser(currObject.get(key)));
      }
      else if (Object.prototype.toString.call(currObject.get(key)) == '[object Object]') {
        return objectParser(currObject.get(key));
      } else if (Object.prototype.toString.call(currObject.get(key)) == '[object String]'){
        return currObject[key];
      }
    }))
  };

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
  };


  console.log(errorChanger(currObject));
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

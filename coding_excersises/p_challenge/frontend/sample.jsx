import React from 'react';
const Immutable = require('immutable');
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

class Sample extends React.Component {
  constructor() {
    super()
    this.errorChanger = this.errorChanger.bind(this);
    this.flatten = this.flatten.bind(this);
    this.objectParser = this.objectParser.bind(this);
    this.arrayParser = this.arrayParser.bind(this);
  }

  errorChanger(topObject) {
    debugger;
    return Object.keys(topObject).map(key => {
      if (Object.prototype.toString.call(topObject.get(key)) == '[object Array]') {
        return {key:key, value:[...new Set(arrayParser(topObject.get(key)))].join('. ')};
      } else if (Object.prototype.toString.call(topObject.get(key)) == '[object Object]') {
        return {key:key, value:[...new Set(objectParser(topObject.get(key)))].join('. ')};
      } else if (Object.prototype.toString.call(topObject.get(key)) == '[object String]') {
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
   flatten(ary) {
    return ary.reduce(function(a, b) {
      if (Array.isArray(b)) {
        return a.concat(flatten(b))
      }
      return a.concat(b)
    }, [])
  }
   objectParser(currObject) {
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

   arrayParser(currArray) {
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
  render(){
    return(
      <h1>{this.errorChanger(errors)}</h1>
    )
  }
}

export default Sample;

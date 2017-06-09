### Top features of ES6 vs. es5

* default parameters
  - Now instead of having to hard code in default parameters, you can now set them within declaration explicitly.
  ```javascript
  var link = function (height, color, url) {
      var height = height || 50
      var color = color || 'blue'
      var url = url || 'google.com'
      ...
  }

  //----------------------------------

  var link = function (height = 50, color = 'blue', url = 'google.com') {
    ...
  }
  ```
* Template Literals/Interpolation
  - Instead of adding strings together, you can now interpolate with ${}
  ```javascript
  var title = 'My name is ' + name + '.'

  //----------------------------------

  var title = `My name is ${name}.`
  ```    
* Multiple line strings
  - Instead of hard coding in line breaks, use back ticks and it notices line breaks
  ```javascript
  var monologue = "I DON’T HAVE A SUGAR DADDY.\n\t"
  + "I’VE NEVER HAD A SUGAR DADDY.\n\t "
  + "IF I WANTED A SUGAR DADDY,\n\t "
  + "YES I PROBABLY COULD GO OUT AND GET ONE.\n\t "
  + "BECAUSE I AM WHAT⁉ SICKENING‼\n\t "
  + "YOU COULD NEVER HAVE A SUGAR DADDY\n\t "
  + "BECAUSE YOU ARE NOT THAT KIND OF GIRL.\n\t"

  //----------------------------------

  var monologue = `I DON’T HAVE A SUGAR DADDY .
  I’VE NEVER HAD A SUGAR DADDY .
  IF I WANTED A SUGAR DADDY,
  YES I PROBABLY COULD GO OUT AND GET ONE.
  BECAUSE I AM WHAT⁉ SICKENING‼
  YOU COULD NEVER HAVE A SUGAR DADDY
  BECAUSE YOU ARE NOT THAT KIND OF GIRL.`

  ```    

* Object Desctructuring
  - Destructuring is a convenient way of extracting multiple values from data stored in (possibly nested) objects and Arrays.
  ```javascript
  var data = props;
  house = data.house;
  mouse = data.mouse;

  //----------------------------------

  var { house, mouse } = props
  // now you have access to variables 'house' and 'mouse'
  //you can also reassign them to new variables

  var { house: x, mouse: y } = props
  //now var 'x' and 'y' are declared with the values of 'house' and 'mouse'

  ```    
* FAT ARROW FUNCTIONS
  - fat arrow functions work in making sure that the 'this' context is lexically scoped, meaning that
  in a fat arrow function closure, the 'this' will not be reassigned to the global scope. This differs
  from functional scope of 'this', where in regularly defined functions, 'this' will be global. Now we
  don't need to bind or use a 'that' variable.
  ```javascript
  var logUpperCase = function() {
  var _this = this

    this.string = this.string.toUpperCase()
    return function () {
      return console.log(_this.string)
    }
  }

  logUpperCase.call({ string: 'es6 rocks' })()

  //----------------------------------
  var logUpperCase = function() {
  this.string = this.string.toUpperCase()
    return () => console.log(this.string)
  }

  logUpperCase.call({ string: 'es6 rocks' })()
  ```    

* Promises
- Promises are functions that are called after there is a successful return from a previous function. This functions just like callbacks, but are better for when there are multiple steps; promises are then easier to follow the flow in code and debug
```javascript
setTimeout(function(){
  console.log('Yay!')
}, 1000)

//----------------------------------
var wait1000 =  new Promise(function(resolve, reject) {
  setTimeout(resolve, 1000)
}).then(function() {
  console.log('Yay!')
})
//note that this example isn't the optimal time when to use callbacks, but rather with more complex methods (that I didn't want to clutter and confuse in an example)
```    
* 'Let' and 'Const'
- Var's are functionally scoped, so any vars declared and changed in any closure scope will persist.
- Const is immutable, so if no reassigning takes place, you should use this.
- Let can be reassigned and is limited in scope to the expression it is defined
  - NOTE: Let and var are not completely interchangeable, use them for their specific strengths
* Consider HTML5 as an open web platform. What are the building blocks of HTML5?
* Describe the difference between a cookie, sessionStorage and localStorage.
* Describe the difference between <script>, <script async> and <script defer>.

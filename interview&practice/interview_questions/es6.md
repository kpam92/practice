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
  var link = function (height = 50, color = 'blue', url = 'google.com') {
    ...
  }
  ```
* Template Literals/Interpolation
  - Instead of adding strings together, you can now interpolate with ${}
  ```javascript
  var title = 'My name is ' + name + '.'

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

  var { house, mouse } = props
  // now you have access to variables 'house' and 'mouse'
  //you can also reassign them to new variables

  var { house: x, mouse: y } = props
  //now var 'x' and 'y' are declared with the values of 'house' and 'mouse'

  ```    
* How do you serve a page with content in multiple languages?
* What kind of things must you be wary of when design or developing for multilingual sites?
* What are data- attributes good for?
* Consider HTML5 as an open web platform. What are the building blocks of HTML5?
* Describe the difference between a cookie, sessionStorage and localStorage.
* Describe the difference between <script>, <script async> and <script defer>.
* Why is it generally a good idea to position CSS <link>s between <head></head> and JS <script>s just before </body>? Do you know any exceptions?
* What is progressive rendering?
* Have you used different HTML templating languages before?

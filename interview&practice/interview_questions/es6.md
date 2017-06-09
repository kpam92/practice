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
* What's the difference between standards mode and quirks mode?
* What's the difference between HTML and XHTML?
* Are there any problems with serving pages as application/xhtml+xml?
* How do you serve a page with content in multiple languages?
* What kind of things must you be wary of when design or developing for multilingual sites?
* What are data- attributes good for?
* Consider HTML5 as an open web platform. What are the building blocks of HTML5?
* Describe the difference between a cookie, sessionStorage and localStorage.
* Describe the difference between <script>, <script async> and <script defer>.
* Why is it generally a good idea to position CSS <link>s between <head></head> and JS <script>s just before </body>? Do you know any exceptions?
* What is progressive rendering?
* Have you used different HTML templating languages before?

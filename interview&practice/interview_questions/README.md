#### JS Questions:

* Explain event delegation
    - Event propogation/event bubbling means that whenever an event occurs in an achor tag, it essentially bubbles up the DOM tree, triggering each parent event handlers. With the example of a 'ul' with multiple 'li's, instead of creating an event handler for each 'li', we would instead place one on the 'ul' that would catch if a specific 'li' event occured.
* Explain how `this` works in JavaScript
    - 'this' can be used in three places, in global scale, in constructor functions, and methods. If used in a global scale, 'this' refers to the global object/window. In constructors for a class, this would refer to the new instance of the class being created. In methods, 'this' refers to the receiver, the object on which the method is invoked. One thing to be careful with is using 'this' when using closures, invoked methods within other methods. In many instances, 'this' will refer to the global scope; the best way to avoid this is ES6 fat arrow functions, or by using the bind() method to explicitly attach the receiver of the method.
* Explain how prototypal inheritance works
    - Prototypal inheritance is the hierarchical inheritance structure in JavaScript. So if a function is invoked in an instance of a class, the interpreter will look for the it in the object itself, and then into the object's prototype until it is found or it reaches the end.
* What do you think of AMD vs CommonJS?
* Explain why the following doesn't work as an IIFE: `function foo(){ }();`.
  * What needs to be changed to properly make it an IIFE?
  - An IIFE is an immediately invoked function expression. This doesn't work
* What's the difference between a variable that is: `null`, `undefined` or undeclared?
  * How would you go about checking for any of these states?


* What is a closure, and how/why would you use one?
* What's a typical use case for anonymous functions?
* How do you organize your code? (module pattern, classical inheritance?)
* What's the difference between host objects and native objects?
* Difference between: `function Person(){}`, `var person = Person()`, and `var person = new Person()`?
* What's the difference between `.call` and `.apply`?
* Explain `Function.prototype.bind`.
* When would you use `document.write()`?
* What's the difference between feature detection, feature inference, and using the UA string?
* Explain Ajax in as much detail as possible.
* What are the advantages and disadvantages of using Ajax?
* Explain how JSONP works (and how it's not really Ajax).
* Have you ever used JavaScript templating?
  * If so, what libraries have you used?
* Explain "hoisting".
  - Hoisting is JavaScript's default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function).
  ```js
  var x = 5; // Initialize x

  elem = document.getElementById("demo"); // Find an element
  elem.innerHTML = x + " " + y;           // Display x and y

  var y = 7;    // declare var y and assign 7 to y
  //will output '5 undefined'
  ```
  the code above displays how hoisting will hoist declaration (var y) to the top, but not initialization (y = 7)
* Describe event bubbling.
* What's the difference between an "attribute" and a "property"?
* Why is extending built-in JavaScript objects not a good idea?
* Difference between document load event and document DOMContentLoaded event?
* What is the difference between `==` and `===`?
* Explain the same-origin policy with regards to JavaScript.
* Make this work:
```javascript
duplicate([1,2,3,4,5]); // [1,2,3,4,5,1,2,3,4,5]
```
* Why is it called a Ternary expression, what does the word "Ternary" indicate?
* What is `"use strict";`? what are the advantages and disadvantages to using it?
* Create a for loop that iterates up to `100` while outputting **"fizz"** at multiples of `3`, **"buzz"** at multiples of `5` and **"fizzbuzz"** at multiples of `3` and `5`
* Why is it, in general, a good idea to leave the global scope of a website as-is and never touch it?
* Why would you use something like the `load` event? Does this event have disadvantages? Do you know any alternatives, and why would you use those?
* Explain what a single page app is and how to make one SEO-friendly.
* What is the extent of your experience with Promises and/or their polyfills?
* What are the pros and cons of using Promises instead of callbacks?
* What are some of the advantages/disadvantages of writing JavaScript code in a language that compiles to JavaScript?
* What tools and techniques do you use debugging JavaScript code?
* What language constructions do you use for iterating over object properties and array items?
* Explain the difference between mutable and immutable objects.
  * What is an example of an immutable object in JavaScript?
  * What are the pros and cons of immutability?
  * How can you achieve immutability in your own code?
* Explain the difference between synchronous and asynchronous functions.
* What is event loop?
  * What is the difference between call stack and task queue?
* Explain the differences on the usage of `foo` between `function foo() {}` and `var foo = function() {}`

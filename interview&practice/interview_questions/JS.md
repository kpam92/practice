#### JS Questions:

* Explain event delegation
    <br><br>Event propogation/event bubbling means that whenever an event occurs in an achor tag, it essentially bubbles up the DOM tree, triggering each parent event handlers. With the example of a 'ul' with multiple 'li's, instead of creating an event handler for each 'li', we would instead place one on the 'ul' that would catch if a specific 'li' event occured.
* Explain how `this` works in JavaScript
    <br><br>'this' can be used in three places, in global scale, in constructor functions, and methods. If used in a global scale, 'this' refers to the global object/window. In constructors for a class, this would refer to the new instance of the class being created. In methods, 'this' refers to the receiver, the object on which the method is invoked. One thing to be careful with is using 'this' when using closures, invoked methods within other methods. In many instances, 'this' will refer to the global scope; the best way to avoid this is ES6 fat arrow functions, or by using the bind() method to explicitly attach the receiver of the method.
* Explain how prototypal inheritance works
    <br><br>Prototypal inheritance is the hierarchical inheritance structure in JavaScript. So if a function is invoked in an instance of a class, the interpreter will look for the it in the object itself, and then into the object's prototype until it is found or it reaches the end.
* What do you think of AMD vs CommonJS?
* Explain why the following doesn't work as an IIFE: `function foo(){ }();`.
  * What needs to be changed to properly make it an IIFE?
  <br><br>An IIFE is an immediately invoked function expression. This function shouldn't clutter up the global namespace by declaring the function with a variable name because it is supposed to be an anonymous immediately invoked function that is not called anywhere else. A better way to recreate the IIFE above is

  ```js
    (function(){})()
  ```
  the parenthesis around the anonymous function turns the code into an expression, and the parenthesis that follow immediately invoke the expression.
* What's the difference between a variable that is: `null`, `undefined` or undeclared?
  * How would you go about checking for any of these states?
  <br><br> Undefined means that a variable is declared but not defined. null is a value of a variable and a type of object.


* What is a closure, and how/why would you use one?
<br><br> A closure is a function, anonymous or named, within another function, that has access to variables within its own scope as well as those in the scope above.
```javascript
function foo(x,y){

  var z = 'mi';

  function closure(){
    return `${x} ${y} ${z}`;
  };

  return closure();
};

foo('do','re'); //returns 'do re mi'
```
Closures are the closest thing JS has to having private methods, where a user doesn't have access to a closure from outside of the function. So closures are usually used as private methods within other functions, as well as callbacks.
* What's a typical use case for anonymous functions?
<br><br>One typical use for an anonymous function would be an IIFE, as described above, where the function is only used once, and immediately invoked after its declaration. This is anonymous because it is only used once in the code and shouldn't be named so that it doesn't crowd the namespace. Other than that, an anonymous function can be used in places where it only needs to be called once. This can also be used as inline functions or closures, functions within a function, that are invoked only once within that code.
* How do you organize your code? (module pattern, classical inheritance?)
* What's the difference between host objects and native objects?
<br><br> Native objects are objects inherent to JS, both in the browser and in node. This includes string, array, integer, boolean and many more.<a href="http://es5.github.io/#x8">This is a list of many more</a>. Host objects are those that are available in the environment you are working in, such as having access to window ad hashHistory.
* Difference between: `function Person(){}`, `var person = Person()`, and `var person = new Person()`?
  <br><br> `function Person(){}` is a function declaration, both declaring and initializing the function 'Person'. `var person = Person()` is a variable that stores the result of a function call of Person(). `var person = new Person()` is instantiating a new instance from class Person.
* What's the difference between `.call` and `.apply`?
  <br><br> Both methods are means of applying a  `this` context object for a certain function; their difference is in how they accept the extra arguments that the method may take. Call accepts arguments separated by commas after the object to bind, while Apply takes the arguments as an array that follows the object. A good way to remember is the A in apply. A for apply which takes Array arguments. Call take arguments after Commas.
  ```javascript
  function foo(x,y) { return `${this.name} x y`}

  foo.call(object, “other argument”, “another one”);
  foo.apply(object, [“argument1”, “argument2”, “argument3”]);
  ```
* Explain `Function.prototype.bind`.
  <br><br> the bind() function explicitly couples the the original function with a new context as to what  `this` refers to in its code.
  ```javascript
  class Dog {
    constructor(name){
      this.name = name
    }

    greeting(){
      return `${this.name} says hi`
    }
  };

  var doggy = new Dog('Pepper');

  var Person = {
    name: 'Kevin'
  };

  doggy.greeting.bind(Person)(); \\returns `Kevin says hi`
  ```
* When would you use `document.write()`?
<br><br>This function writes to the document/web page the content that you put as the argument, i.e. `<h1>hi<h1>`. Using this after the DOM has loaded will overwrite all of the page. So, the common use for this is to upload third party code and script to the page, examples include ads and Google analytics.
* What's the difference between feature detection, feature inference, and using the UA string?
* Explain Ajax in as much detail as possible.
<br><br> AJAX stands for  asynchronous javascript and xml. It is the use of javscript to send and receive information using HTTP without reloading the page.
* What are the advantages and disadvantages of using Ajax?
<br><br> Advantages: better interactivity and more dynamic pages. Easier navigation. More succinct and compact code.
<br><br> Disadvantages: Reload and back are rendered useless, and can refresh page prior to ajax call.
* Explain how JSONP works (and how it's not really Ajax).
* Have you ever used JavaScript templating?
  * If so, what libraries have you used?
* Explain "hoisting".
  <br><br>Hoisting is JavaScript's default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function).
  ```js
  var x = 5; // Initialize x

  elem = document.getElementById("demo"); // Find an element
  elem.innerHTML = x + " " + y;           // Display x and y

  var y = 7;    // declare var y and assign 7 to y
  //will output '5 undefined'
  ```
  the code above displays how hoisting will hoist declaration (var y) to the top, but not initialization (y = 7). Also keep note that function declarations are hoisted with both declaration and initialization (i.e. function foo() {console.log('hi')}). But function expressions only have the declaration hoisted to the top (i.e. var foo = function bar() {console.log('hi')})
* Describe event bubbling.
<br><br> Event bubbling is what takes place when a user interacts with a specific element, where the event propogates up
through each ancestor element.
```html
<div class="ancestor">
  <div class="parent">
    <button> Click me! </button>
  </div>
</div>
```
```javascript
$( "button" ).click(function(event) {
  console.log( "button was clicked!" );
});

$( ".parent" ).click(function(event) {
  console.log( "child element was clicked!" );
});

$( ".ancestor" ).click(function(event) {
  console.log( "descendant element was clicked!" );
});
```
if the user were to click on the button, all the event listeners on the parent and ancestor elements would go off as well.

* What's the difference between an "attribute" and a "property"?
<br><br> Attributes are defined by HTML, Properties are defined by the DOM.  Properties are found within elements and are similar to instance variables. They can be multiple types of input (string, boolean, etc.). Attributes are similar to properties, but are defined by the HTML, and only return strings.
* Why is extending built-in JavaScript objects not a good idea?
* Difference between document load event and document DOMContentLoaded event?
  <br><br> DOMContentLoaded events are triggered after the document has been fully loaded, and before css and images are loaded. document load events are triggered after the document has been loaded, along with all the images and styles.
* What is the difference between `==` and `===`?
  <br><br> Both are relational operators, the difference is that `==` will compare for equality after doing any necessary
  conversions, while `===` is stricter, and provides no conversions before comparing both items.
* Explain the same-origin policy with regards to JavaScript.
  <br><br> The same-origin policy prevents malicious attacks from other sites, preventing code from a foreign site from executing. If JavaScript sees that its origin is different, the script stops. The origin is determined by the protocol(https), domain(www.domain.com), and port(8080).
* Make this work:
```javascript
duplicate([1,2,3,4,5]); // [1,2,3,4,5,1,2,3,4,5]

// solution
function duplicate(array) {return array.concat(array)}
```
* Why is it called a Ternary expression, what does the word "Ternary" indicate?
<br><br> A ternary expression takes three conditionals, and returns an output. The first conditional is a boolean, and the next two are the possible outputs, determinant on the first conditional's result. It will output the second piece if true, and the third if false. These are usually used in variable assignment in JS. Below is an example.
```javascript
let age = 17
let entry = age >= 21 ? true : false
```
"Ternary" is derived from the n-ary operation, 'ter' means that it deals with three conditionals.
* What is `"use strict";`? what are the advantages and disadvantages to using it?
<br><br>`use strict` helps catch common mistakes by throwing exceptions, throws errors when the user does unsafe actions, and disables certain features, such as hoisting. Using this mode helps avoid certain errors and write cleaner code.
* Create a for loop that iterates up to `100` while outputting **"fizz"** at multiples of `3`, **"buzz"** at multiples of `5` and **"fizzbuzz"** at multiples of `3` and `5`
* Why is it, in general, a good idea to leave the global scope of a website as-is and never touch it?
<br><br> It is better to leave the global scope as is for many reasons. Variables in the global namespace can be updated and changed anywhere in the code, so it makes it harder to trace and find where updates are. It then makes it harder to read code if variables are declared in the global namespace away from threads where they are used. This also make 'smelly' code that leaves the reader to assume the worst if a programmer writes lazy code. Lastly, naming in the global namespace creates a greater chance for name clashing of variables.
* Why would you use something like the `load` event? Does this event have disadvantages? Do you know any alternatives, and why would you use those?
* Explain what a single page app is and how to make one SEO-friendly.
* What is the extent of your experience with Promises and/or their polyfills?
* What are the pros and cons of using Promises instead of callbacks?
* What are some of the advantages/disadvantages of writing JavaScript code in a language that compiles to JavaScript?
* What tools and techniques do you use debugging JavaScript code?
<br><br> Putting `debugger` in JS code is a great way to analyze code and see where bugs are occurring. Another resource is creating RSpec testing and JEST for React/Redux.
* What language constructions do you use for iterating over object properties and array items?
<br><br> For iterating through an array, best to use a for loop to iterate through indices, or to use `forEach()` or another iterating method. Best method to iterate through an object is to map over the keys
```javascript
var obj = { first: "John", last: "Doe" };
// Visit non-inherited enumerable keys
Object.keys(obj).forEach(function(key) {
    console.log(key);
});
```
* Explain the difference between mutable and immutable objects.
  * What is an example of an immutable object in JavaScript?
  * What are the pros and cons of immutability?
  * How can you achieve immutability in your own code?
<br><br> Simply, mutable objects can be changed, while immutable ones cannot. An example of an immutable object is a declared 'const' in JS. Mutable: 'let' and 'var'. Immutability is advantageous for constant variables that you wouldn't want to have the option of changing. Immutability is an extra insurance. On the other hand, because immutability is strict, you have to make sure that you define your variables in a conscious manner.
* Explain the difference between synchronous and asynchronous functions.
<br><br> synchronous functions occur in a specific order in the code, where step 3 won't occur before step 1. But, an asynchronous function may occur at any point, waiting for a specific event to be triggered. In context, asynchronous functions may occur in JS through event listeners, where a user interacts with a specific part of the application, i.e. hovering or clicking. These events occur in the background. These are useful for having dynamic and interactive pages, where certain actions can cause code to run, and information to be fetched from the DB without a re-render.
* What is event loop?
  * What is the difference between call stack and task queue?
<br><br> Look at misc_questions for answer
* Explain the differences on the usage of `foo` between `function foo() {}` and `var foo = function() {}`
  <br><br>`function foo() {}` is a function declaration. It is initializing and declaring this specific function in the namespace 'foo.' `var foo = function(){}` is a functional expression, where the variable is declared and initialized as an anonymous function. The functional declaration is hoisted to the top in its entirety, while only declaration of a function expression is hoisted up.
* Why does the following quirk happen in JS, 'console.log(0.1 + 0.2) //0.300000000004'
  <br><br>This is an example of JS's binary floating point math. In most programming languages, it is based on the IEEE 754 standard. JavaScript uses 64-bit floating point representation, which is the same as Java's double. The crux of the problem is that numbers are represented in this format as a whole number times a power of two; rational numbers (such as 0.1, which is 1/10) whose denominator is not a power of two cannot be exactly represented.

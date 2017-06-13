This is a page to put miscellaneous software development
related questions and answers to them.

* What is dynamic programming?

* What happens when you type in 'www.google.com' and press enter?

* What are the upsides to ES6, and fat arrow functions?
  look on es6 doc

* binary trees, BFS vs. DFS
<br><br> Bread first search traverses through each level first, while Depth first search goes to the farthest reaches first, then moves up. BFS is best seen as a queue, DFS as a stack. BFS is slower and requires more memory. BFS is best used to find shortest paths for a node, and for looking for nodes closer to the root. DFS is better for traversing a tree and if target may be at the ends.

* Difference between function declarations and function expressions
  <br><br>Function declarations are name function variables that are declared without being assigned to a variable.
  ```js
  function bar() {console.log('foo')}
  ```
   A function expression is a function that is part of a larger syntax, usually variable assignment. This includes IIFE's as well.
   ```js
   var a = function() {console.log('example1')}
   var a = function foo() {console.log('example2')}
   (function(){console.log('example3');})();
   ```

   NOTE: hoisting will shoot up the entirety of function declarations, but it will only hoist the declaration of a function expression, not the initialization!

* difference between .__proto__ and .prototype
  - .__proto__ is used to find the prototype of an instance of a class, while .prototype would be used on the entire class itself. i.e. 'Dog.prototype' vs. 'Fido.__proto__'.The ‘prototype’ property points to the object that will be assigned as the prototype of instances created with that function when using ‘new’.

* What is a max-heap? min-heap?
  - a max-heap is a form of a binary tree where a node's children are all smaller than or equal to it. (don't get this at all confused with the structuring of a binary search tree). These nodes are then indexed in a BFS fashion, so if a node is at index K, then you would find its direct children at index 2K + 1(left) and 2K + 2(right). min-heap is the same rules but opposite order.

* What is the event loop in JavaScript?
  - JS is a nonblocking/asynchronous I/O, where multiple functions can be happening at the same time. The event loop is part of how this asynchronicity is possible. JS is a single-threaded programming language that has a single call stack, where different are placed and taken off as they are completed. But, because of this linear fashion, one call has to finish before the next one can complete etc. The problem then aligns with calls that take time (like setTimeOut or AJAX requests). And what if these functions don't complete at all? Then the stack wouldn't complete. So, when a webAPI type function such as event listeners, setTimeOut, and AJAX requests occur, they are taken off the stack and are run in the browser. All linear functions on the stack are then able to continue. Once the webAPI functions on the side complete, they are placed inside the task queue. Calls in the task queue are only allowed to run in the main stack once the stack is empty, after all the linear calls have completed. The event loop has the job of looking at both the stack and the queue, and moving calls from the queue to the stack once the stack is empty.<br><br>

  <a href="https://www.youtube.com/watch?v=8aGhZQkoFbQ">Very nice video</a>
  <br>
  <a href="http://blog.carbonfive.com/2013/10/27/the-javascript-event-loop-explained/">Very nice words</a>

* What is the object destructuring?
  - Object destructuring in ES6 makes it possible to extract parts of an object and assign those parts to different variables.
  ```javascript
  const { a: x, b: y } = { a: 1, b: 2 };

  x; //=> 1
  y; //=> 2
  ```
  This is used most often in React component to destructure props to avoid having to preface wanted variable with  `this.props.*`.
  ```javascript
  this.props = {
    userId: 1,
    user: {
      fname: 'Kevin',
      lname: 'Mathews'
    }
  };

  const { userId, user: { fname, lname } } = this.props;
  userId; //=> 1
  fname; //=> 'Kevin'
  lname; //=> 'Mathews'
  ```
* Describe the box model in CSS.
  - This term is usually when describing layout and design, specifically the box that wraps around every HTML element. This box includes padding, border, and the content.

* What is flexbox in CSS?
  - Flexbox is a layout module in CSS3 made to improve the items align, directions and order in the container even when they are with dynamic or even unknown size. The prime characteristic of the flex container is the ability to modify the width or height of its children to fill the available space in the best possible way on different screen sizes.

* What is a media_query in CSS?
  - Media_queries are the means of having specific code for certain dimensions, usually used in CSS to allow website and applications suitable for desktop,tablet, and mobile.

* With JavaScript, what are promises and why they are preferred over callbacks?
  - A promise represents the eventual result of an asynchronous operation. It is a placeholder into which the successful result value or reason for failure will materialize. They are preferred over callbacks because they are easier to catch errors in, and easier to read.

* What is the difference between object oriented programming and functional programming?
  - The main difference seems to be in terms of data vs. behavior, and identity vs. value. Object-oriented languages are good when you have a fixed set of operations on things, and as your code evolves, you primarily add new things. This can be accomplished by adding new classes which implement existing methods, and the existing classes are left alone. Functional languages are good when you have a fixed set of things, and as your code evolves, you primarily add new operations on existing things. This can be accomplished by adding new functions which compute with existing data types, and the existing functions are left alone.
  <br><br> TLDR: OOP is more inclined to behavior and identity, FP is more data and value. FP has a set fixed way of showing data, and with that can change functionality of the methods to change and use this data. OOP give more identity and structure through class and heirarchy, where functionality can be added and changes.

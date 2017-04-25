This is a page to put miscellaneous software development
related questions and answers to them.

* What is dynamic programming?

* What happens when you type in 'www.google.com' and press enter?

* What are the upsides to ES6, and fat arrow functions?

* binary trees, BFS vs. DFS

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
  - .__proto__ is used to find the prototype of an instance of a class, while .prototype would be used on the entire class itself. i.e. 'Dog.prototype' vs. 'Fido.__proto__'.The ‘prototype’ property points to the object that will be asigned as the prototype of instances created with that function when using ‘new’.

* What is a max-heap? min-heap?
  - a max-heap is a form of a binary tree where a node's children are all smaller than or equal to it. (don't get this at all confused with the structuring of a binary search tree). These nodes are then indexed in a BFS fashion, so if a node is at index K, then you would find its direct children at index 2K + 1(left) and 2K + 2(right). min-heap is the same rules but opposite order.

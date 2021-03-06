##### HTML
* What does a doctype do?
- It tells the browser what version the language the page is written in and how to render your document.
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


##### CSS

* What is the difference between classes and ID's in CSS?
<br><br> Both are selectors for elements on the page, but usually you have more classes on a page, while ID's are used for singular elements. An ID is a more specific selector than a class. This is a good article on css-selector specificity : https://css-tricks.com/specifics-on-css-specificity/
* What's the difference between "resetting" and "normalizing" CSS? Which would you choose, and why?
<br><br>Normalizing means to make a consistent look and feel of document styles for various browsers, while resetting is to clear the default CSS style of DOM elements.
* Describe Floats and how they work.
<br><br> Floats are `left`, `right`, and `none`. A float will take the element out of its original flow and pushes it to the direction specified.
* Describe z-index and how stacking context is formed.
<br><br> The z-index indicates the position of the element as it stacks on top of other elements. It's best to think of the elements as pieces of paper on top of each other. An element with a higher z-index will be higher up on the stack and presumably more visible to the viewer.
* Describe BFC(Block Formatting Context) and how it works.
<br><br> block formatting context is a part of a visual CSS rendering of a Web page. It is the region in which the layout of block boxes occurs and in which floats interact with each other
* What are the various clearing techniques and which is appropriate for what context?
* Explain CSS sprites, and how you would implement them on a page or site.
<br><br> A sprite is a large image that is made up of smaller images. This is effective for holding multiple images the developer may want to use, and singling out specific parts to display that specific image. It takes up less bandwidth, and easier to render because multiple images are store in one single file. This is most commonly seen in moving animations (think of 16bit video games with moving figures), and for smaller icons displayed on a website.
* What are your favourite image replacement techniques and which do you use when?
* How would you approach fixing browser-specific styling issues?
* How do you serve your pages for feature-constrained browsers?
* What techniques/processes do you use?
* What are the different ways to visually hide content (and make it available only for screen readers)?
* Have you ever used a grid system, and if so, what do you prefer?
* Have you used or implemented media queries or mobile specific layouts/CSS?
<br><br>Media queries are a means of creating css specific to viewport dimensions. This means that the user can see content on desktop, tablet, and mobile.
* Are you familiar with styling SVG?
* How do you optimize your webpages for print?
* What are some of the "gotchas" for writing efficient CSS?
* What are the advantages/disadvantages of using CSS preprocessors?
* Describe what you like and dislike about the CSS preprocessors you have used.
* How would you implement a web design comp that uses non-standard fonts?
* Explain how a browser determines what elements match a CSS selector.
* Describe pseudo-elements and discuss what they are used for.
* Explain your understanding of the box model and how you would tell the browser in CSS to render your layout in different box models.
* What does * { box-sizing: border-box; } do? What are its advantages?
* List as many values for the display property that you can remember.
* What's the difference between inline and inline-block?
* What's the difference between a relative, fixed, absolute and statically positioned element?
<br><br> Static is the default, and has the element positioned as it would regularly in relation to everything on the page. Relative means 'relative to itself'. This means that assigning top,left,right,bottom values will move the element in relation to its normal positioning. Absolute positions the element in relation to its parent element in a similar manner to relative positioning. This positioning doesn't affect any other element on the page, and doesn't affect any other elements as well. Fixed positioning is relative to the viewport, i.e. navigation bars and 'back to the top' icons.
* The 'C' in CSS stands for Cascading. How is priority determined in assigning styles (a few examples)? How can you use this system to your advantage?
<br><br> Cascading refers to the heirarchy and inheritance of each element on a page, and what takes precedence. ID - Class, psuedo-class - element, psuedo-element;  
* What existing CSS frameworks have you used locally, or in production? How would you change/improve them?
* Have you played around with the new CSS Flexbox or Grid specs?
* How is responsive design different from adaptive design?
<br><br> responsive entails one layout that changes depending on screen size, while adaptive means that there are distinct layouts that show dependent on screen size.
* Have you ever worked with retina graphics? If so, when and what techniques did you use?
* Is there any reason you'd want to use translate() instead of absolute positioning, or vice-versa? And why?

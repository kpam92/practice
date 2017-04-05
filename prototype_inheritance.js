

// We want to make all methods of animal accessible to any instance of dog


// old version of creating prototypal inheritance of dog to animal
function Animal (name) {
  this.name = name;
};

Animal.prototype.eat = function () {
  console.log("nom nom nom");
};

function Dog (name, age) {
  Animal.call(this, name);

  this.age = age;
}

function Surrogate() {};
Surrogate.prototype = Animal.prototype;
Dog.prototype = new Surrogate();

Dog.prototype.woof = function() {
  console.log(`${this.name} goes woof woof`)
}




// ES2015 extending through class

class Vehicle {
  constructor(color, model) {
    this.color = color;
    this.model = model;
  }

  move() {
    return "just movin' along here";
  }
}

class Hummer extends Vehicle {
  constructor(color, model, size) {
    super(color, model);
    this.size = size;
  }

  move() {
    const oldMove = super.move();
    return `${oldMove} VROOM VROOM`
  }
}

class Prius extends Vehicle {
  constructor(color, model, hybrid) {
    super(color, model);
    this.hybrid = hybrid;
  }

  move() {
    const oldMove = super.move();
    return `${oldMove} ~~silence~~`
  }
}



// BEST PRACTICE MEANS OF CREATING A PROTOTYPE'S PROTO

function Cat (name, age) {
  Animal.call(this, name);

  this.age = age;
}

Cat.prototype = Object.create(Animal.prototype);
Cat.prototype.constructor = Cat;

Cat.prototype.meow = function() {
  console.log(`${this.name} goes meow prrrr`)
}

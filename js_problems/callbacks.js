function uniq(array) {
  result = [];
  array.forEach(x=>{
    if (result.indexOf(x) === -1) {
      result.push(x);
    }
  })
  return result;
}

function twoSum(array,x) {
  for(i = 0; i < array.length - 1; i++){
    for(j = i + 1; j < array.length; i++) {
      if (array[i] + array[j] === x) {
        return true;
      }
    };
  };
  return false;
}


class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date()

    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    // 3. Call printTime.
    this.printTime()
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this),1000)
    }

  printTime() {
    // Format the time in HH:MM:SS
    let currentTime = `${this.hours}:${this.minutes}:${this.seconds}`;
    // Use console.log to print it.
    console.log(currentTime);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1
    if (this.seconds === 60) {
      this.seconds = 0
      this.minutes += 1
    }
    if (this.minutes === 60) {
      this.minutes = 0
      this.hours += 1
    }
    if (this.hours === 25) {
      this.hours = 0
    }
    this.printTime()
    // 2. Call printTime.
  }
}

const clock = new Clock();

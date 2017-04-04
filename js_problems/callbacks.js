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
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();
    // 3. Call printTime.
    printTime()
    // 4. Schedule the tick at 1 second intervals.
    setInterval(tick,1000)
    }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();

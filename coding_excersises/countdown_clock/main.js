var countDownDate = new Date("Jul 5, 2019 15:37:25").getTime();

// Update the count down every 1 second
  setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();

    // Find the distance between now an the count down date
    var distance = countDownDate - now;

    function zeroAdder(el) {
    	if (el.toString().length < 2) {
      	return '0' + el.toString()
      } else {
      	return el
      }
    }


    var dayDivider =  (1000 * 60 * 60 * 24)
    var days = zeroAdder(Math.floor(distance / dayDivider));

    var hourDivider = (1000 * 60 * 60)
    var hours = zeroAdder(Math.floor((distance % dayDivider) / hourDivider));

    var minuteDivider = (1000 * 60)
    var minutes = zeroAdder(Math.floor((distance % hourDivider) / minuteDivider));
    var seconds = zeroAdder(Math.floor((distance % minuteDivider) / 1000));




    document.getElementById('days').innerHTML = days;
    document.getElementById('hours').innerHTML = hours;
    document.getElementById('minutes').innerHTML = minutes;
    document.getElementById('seconds').innerHTML = seconds;

    // If the count down is over, write some text
    if (distance < 0) {
        clearInterval(x);
        document.getElementById('days').innerHTML = "00";
        document.getElementById('hours').innerHTML = "00";
        document.getElementById('minutes').innerHTML = "00";
        document.getElementById('seconds').innerHTML = "00";
    }
}, 1000);


document.addEventListener("submit", function(evt) {
    evt.preventDefault();

    var time = document.getElementById('time').value
    var date = document.getElementById('date').value
    if (time.length === 0 || date.length === 0){
      alert('Date or Time is empty!')
    } else {
      countDownDate = new Date(time + ' ' + date)
    }
    
}, true);

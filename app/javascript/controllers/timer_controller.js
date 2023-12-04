import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {

  static targets = ["hours", "minutes", "deadline"]
  connect() {
    const deadline = new Date(this.deadlineTarget.innerText);
    console.log(deadline);

    this.startTimer(deadline);
  }

  startTimer(deadline) {

    const difference_in_milliseconds = deadline.getTime() - new Date().getTime();
    console.log(difference_in_milliseconds)
    const totalminutes = Math.floor((difference_in_milliseconds / (1000 * 60) ));
    const hours = Math.floor(totalminutes / 60);
    console.log(hours)
    const minutes = Math.floor(totalminutes % 60);
    console.log(minutes)
    this.updateClock(hours, minutes);

    if (difference_in_milliseconds > 0) {
      this.timeinterval = setInterval(() => this.startTimer(deadline), 10000);
    } else {
      clearInterval(this.timeinterval)
    }
  }

  updateClock(hours, minutes) {

    this.hoursTarget.textContent = hours;
    this.minutesTarget.textContent = ("0" + minutes).slice(-2);

  }
}
// function getTimeRemaining(endtime) {
//   const total = Date.parse(endtime) - Date.parse(new Date());
//   const minutes = Math.floor((total / 1000 / 60) % 60);
//   const hours = Math.floor((total / (1000 * 60 * 60)) % 24);
//   return {
//     total,
//     hours,
//     minutes,
//   };
// }

// function initializeClock(id, endtime) {


//   function updateClock() {
//     const t = getTimeRemaining(endtime);

//     hoursSpan.innerHTML = t.hours;
//     minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);

//     if (t.total <= 0) {
//       clearInterval(timeinterval);
//     }
//   }

//   updateClock();
//   const timeinterval = setInterval(updateClock, 1000);
// }

// const deadline = new Date(Date.parse(new Date()) + 15 * 60 * 1000);

// export { initializeClock };

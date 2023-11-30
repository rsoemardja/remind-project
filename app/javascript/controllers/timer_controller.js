import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["hours", "minutes"]
  connect() {
    const timeout = 60000;
    // setTimeout(() => {
    console.log(this.hoursTarget)
    console.log(this.minutesTarget)
    console.log("Hello from timer controller")
    // }, timeout);
    const today = (new Date()).getTime()
    const duedate = (new Date("2023/12/02")).getTime()
    const diff = (duedate - today)
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    console.log(hours)
    console.log(minutes)
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
}

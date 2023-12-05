import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {

  static targets = ["hours", "minutes", "deadline"]
  connect() {
    const deadline = new Date(this.deadlineTarget.innerText);
    this.updateClock(...this.calculateTimeRemaining(deadline))
    this.startTimer(deadline);
  }
  calculateTimeRemaining(deadline) {
    const differenceInMilliseconds = deadline - new Date();
    const totalMinutesRemaining = Math.floor((differenceInMilliseconds / (1000 * 60)));
    const minutesRemaining = Math.floor(totalMinutesRemaining % 60) > 0 ? Math.floor(totalMinutesRemaining % 60) : 0;
    const hoursRemaining = Math.floor(minutesRemaining / 60) > 0 ? Math.floor(minutesRemaining / 60) : 0;

    return [hoursRemaining, minutesRemaining];
  }

  startTimer(deadline) {
    const [hoursRemaining, minutesRemaining] = this.calculateTimeRemaining(deadline);

      if (minutesRemaining > 0) {
        this.timeinterval = setInterval(() =>
        { this.updateClock(hoursRemaining, minutesRemaining)
          this.startTimer(deadline)}
          , 60000
        );
      } else {
        this.updateClock(hoursRemaining, minutesRemaining)
        clearInterval(this.timeinterval);
      }

  }
  updateClock(hours, minutes) {
      // Your code for updating the clock goes here
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

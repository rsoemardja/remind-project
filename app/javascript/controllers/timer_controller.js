import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {

  static targets = ["hours", "minutes", "deadline"]
  connect() {
    const deadline = new Date(this.deadlineTarget.innerText);
    this.updateClock(...this.calculateTimeRemaining(deadline))
    this.startTimer(deadline);
    // this.updateCountdown();
  }

  updateCountdown() {
    const now = new Date("2023-12-05 15:01:00").getTime();
    // console.log(now)
    const duedate = new Date(this.deadlineTarget.innerText).getTime();
    // console.log(duedate)

    // const duedate = new Date("2023-12-06 15:00:00").getTime();
    const timediff = duedate - now;
    const days = Math.floor(timediff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((timediff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    console.log(hours)
    const minutes = Math.floor((timediff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timediff % (1000 * 60)) / 1000);

    console.log(days, hours, minutes, seconds);
  }

  calculateTimeRemaining(deadline) {
    // BEGIN: ed8c6549bwf9
    const differenceInMilliseconds = deadline - Date.now();
    const totalMinutesRemaining = Math.floor((differenceInMilliseconds / (1000 * 60)));
    const minutesRemaining = Math.floor(totalMinutesRemaining % 60) > 0 ? Math.floor(totalMinutesRemaining % 60) : 0;
    const hoursRemaining = Math.floor(totalMinutesRemaining / 60) > 0 ? Math.floor(totalMinutesRemaining / 60) : 0;
    return [hoursRemaining, minutesRemaining];
    // END: ed8c6549bwf9
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
      console.log("Hours updated:", hours);
      this.hoursTarget.textContent = hours;
      console.log(this.hoursTarget.textContent)
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

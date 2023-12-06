import { Controller } from "@hotwired/stimulus"
import dropdown from "dropdown.js";

// Connects to data-controller="dropdown.js"
export default class extends Controller {
  connect() {
    this.element.querySelectorAll(".dropdown-toggle").forEach((element) => {
      element.addEventListener("click", (event) => {
        event.preventDefault()
        event.stopPropagation()
        this.toggle(event.currentTarget)
      })
    })
    
  }
}

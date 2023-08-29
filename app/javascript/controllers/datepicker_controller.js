import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr'

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // console.log(this.element) //=> returns the element where data-controller is present
    flatpickr(this.element)
  }
}

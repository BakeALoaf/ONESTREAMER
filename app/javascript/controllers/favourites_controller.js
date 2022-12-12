import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  connect() {
  }
  toggle() {
    this.element.classList.toggle("fa-regular")
    this.element.classList.toggle("fa-solid")
  }
}

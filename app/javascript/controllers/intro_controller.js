import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="intro"
export default class extends Controller {
  connect() {
    window.setTimeout(function() {
      window.location.href = `${window.location.href}/movies`;
      }, 2500);
  }
}

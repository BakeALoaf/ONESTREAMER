import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["input","icon"]
  connect() {
  }
  select(event) {
    this.inputTargets.forEach((input,index) => {
      if (input.checked) {
        this.iconTargets[index].classList.add("checked")
      } else {
        this.iconTargets[index].classList.remove("checked")
     }
    })
  }
}

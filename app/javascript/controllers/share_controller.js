import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["result", "name", "description"]
  connect() {
    console.log("connected to the share controller");
    console.log(this.data.get("urlValue"));
    console.log(this.resultTarget);
  }
  async share(e) {
    e.preventDefault();

    const shareData = {
      name: this.nameTarget.textContent,
      desciption: this.descriptionTarget.textContent,
      url: this.data.get("urlValue"),
    };

    if(navigator.share){
      try {
        await navigator.share(shareData);
      } catch (err) {
        this.resultTarget.textContent = `Error: ${err}`;
      }
    } else {
      this.resultTarget.textContent = `Your browser does not support the share function`;
    }
  }
}

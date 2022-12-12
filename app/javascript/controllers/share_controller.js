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
    try {
      await navigator.share(shareData);
      this.resultTarget.textContent = "MDN shared succesfully";
    } catch (err) {
      this.resultTarget.textContent = `Error: ${err}`;
    }

  }
}

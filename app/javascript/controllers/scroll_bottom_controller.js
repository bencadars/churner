import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-bottom"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log(coucou)
    this.formTarget.addEventListener("submit", this.handleSubmit.bind(this));
  }
  handleSubmit(event) {
    event.preventDefault();
    window.scrollTo(0, document.body.scrollHeight);
    this.formTarget.submit();
  }
}

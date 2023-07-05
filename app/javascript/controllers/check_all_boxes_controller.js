import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["checkbox"]
  connect() {
    console.log("coucou")
  }
  checkAll(event) {
    this.checkboxTargets.forEach(checkbox => {
      if (!checkbox.disabled) {
        checkbox.checked = event.currentTarget.checked
      }
    })
  }
}

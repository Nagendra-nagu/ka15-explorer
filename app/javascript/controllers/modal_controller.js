console.log("sbjdhsabdhajsbi")
import { Controller } from "stimulus"
import { fetch } from "@rails/request.js"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modal = new bootstrap.Modal(document.getElementById('globalModal'))
    console.log("Modal controller connected!")
  }

  async showModal(event) {
    event.preventDefault()
    const url = event.currentTarget.getAttribute('data-url')
    const response = await fetch(url, { responseKind: "turbo-stream" })

    if (response.ok) {
      this.modal.show()
    } else {
      console.error("Failed to load modal content")
    }
  }

  hideModal() {
    this.modal.hide()
  }
}

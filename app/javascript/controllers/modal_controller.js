// app/javascript/controllers/modal_controller.js

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modal = new bootstrap.Modal(document.getElementById('globalModal'))
    console.log("Modal controller connected!")
  }

  async showModal(event) {
    event.preventDefault()
    const url = event.currentTarget.getAttribute('data-url')
    const response = await fetch(url, {
      headers: {
        Accept: "text/html"
      }
    })

    if (response.ok) {
      const html = await response.text()
      const modalContent = document.getElementById('globalModalContent')
      modalContent.innerHTML = html
      this.modal.show()
    } else {
      console.error("Failed to load modal content")
    }
  }

  hideModal() {
    this.modal.hide()
  }
}

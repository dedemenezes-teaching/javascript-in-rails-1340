import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ['items', 'form']
  connect() {
    // console.log(this.itemsTarget)
    // console.log(this.formTarget.action)
  }

  send(event) {
    event.preventDefault()
    // console.log("TODO: submit AJAX request")
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { "Accept": 'application/json' },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.formTarget.outerHTML = data.form
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML('beforeend', data.inserted_item)
        }
      })
  }
}

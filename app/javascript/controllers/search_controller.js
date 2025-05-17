import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static values = {wait:{type:Number, default:3000}}
  static targets = ["input"]
  disconnect() {
    this.inputTarget.value = ""
  }

  debounce(){
    clearTimeout(this.timeoutId)
    this.timeoutId = setTimeout(()=> {
      this.element.requestSubmit()
    }, this.waitValue)
  }
}

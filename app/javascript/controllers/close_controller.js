import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="close"
export default class extends Controller {
  static targets = ["alert", "notice"]
  static values = {timeout: Number}
  static classes = ["hidden"]
  connect() {
    setTimeout(()=> this.hide(), this.timeoutValue)
  }
  hide() {
    if(this.hasAlertTarget){
      this.alertTarget.classList.add(this.hiddenClass)
    }
    if (this.hasNoticeTarget) {
      this.noticeTarget.classList.add(this.hiddenClass)
    }
  }
}

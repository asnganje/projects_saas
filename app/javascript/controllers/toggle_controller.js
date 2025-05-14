import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["profileCard", "sidebar"]
  toggleProfileCard(){
    this.profileCardTarget.classList.toggle("hidden")
  }

  toggleSideBar() {
    this.sidebarTarget.classList.toggle("hidden")
    // if (this.sidebarTarget.classList.includes("hidden")) {
    //   this.sidebarTarget.classList.remove("hidden")
    // } else{
    //   this.sidebarTarget.classList.add("hidden")
    // }
  }
}

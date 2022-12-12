import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "action" ]
  static values = { labels: { type: Array, default: ['follow', 'unfollow'] }, toggle: { type: Number, default: 0 }}

  connect() {
    this.index = this.toggleValue
    this.actionTarget.text = this.labelsValue[this.index % 2]
  }

  toggleAction() {
    this.index = (this.index + 1) % 2
    this.actionTarget.innerText = this.labelsValue[this.index % 2]
  }
}

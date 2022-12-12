import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "action" ]
  static values = { url: String, labels: { type: Array, default: ['follow', 'unfollow'] }, toggle: { type: Number, default: 0 }}

  connect() {
    this.index = this.toggleValue
    this.actionTarget.innerText = this.labelsValue[this.index % 2]
  }

  toggleAction() {
    this.index = (this.index + 1) % 2

    var _this = this
    fetch(this.urlValue + '?val='+ this.index)
    .then(() => {
       _this.actionTarget.innerText = _this.labelsValue[_this.index]
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }
}

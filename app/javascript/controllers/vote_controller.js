import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "overview", "up", "down" ]
  static values = { url: String, state: { type: Number, default: 0 }}

  connect() {
    this.state = this.stateValue
    this.setState()
  }

  setState() {
    if (this.state == 1) {
      this.upTarget.disabled = true
      this.downTarget.disabled = false
    } else if (this.state == -1) {
      this.upTarget.disabled = false
      this.downTarget.disabled = true
    } else {
      this.upTarget.disabled = false
      this.downTarget.disabled = false
    }
  }

  updateVote() {
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

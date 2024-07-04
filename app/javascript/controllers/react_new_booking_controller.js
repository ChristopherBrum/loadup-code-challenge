import { Controller } from "@hotwired/stimulus"
import { mountReactComponent } from "../application"

export default class extends Controller {
  connect() {
    mountReactComponent('NewBooking', this.element.id)
  }
}

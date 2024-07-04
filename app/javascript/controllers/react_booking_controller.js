import { Controller } from "@hotwired/stimulus"
import { mountReactComponent } from "../application"

export default class extends Controller {
  connect() {
    const bookingsData = JSON.parse(this.element.dataset.bookings)
    mountReactComponent('Booking', this.element.id, { bookings: bookingsData })
  }
}

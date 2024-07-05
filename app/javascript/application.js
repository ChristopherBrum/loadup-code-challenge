import "@hotwired/turbo-rails";
import "./controllers";
import * as React from "react";
import * as ReactDOM from "react-dom/client";
import Booking from "./components/Booking";
import NewBooking from "./components/NewBooking";
import ShowBooking from "./components/ShowBooking";

const Components = {
  Booking,
  NewBooking,
  ShowBooking,
};

const mountReactComponent = (componentName, elementId, props = {}) => {
  console.log(
    `Attempting to mount ${componentName} on element with id ${elementId}`
  );
  const element = document.getElementById(elementId);
  if (element) {
    const Component = Components[componentName];
    if (Component) {
      const root = ReactDOM.createRoot(element);
      root.render(
        <React.StrictMode>
          <Component {...props} />
        </React.StrictMode>
      );
      console.log(`Successfully mounted ${componentName}`);
    } else {
      console.error(`Component ${componentName} not found`);
    }
  } else {
    console.error(`Element with id ${elementId} not found`);
  }
};

document.addEventListener("turbo:load", () => {
  console.log("Turbo load event fired");

  const bookingElement = document.getElementById("booking-component");
  if (bookingElement) {
    const bookingsData = bookingElement.dataset.bookings;
    mountReactComponent("Booking", "booking-component", {
      bookings: bookingsData,
    });
  }

  const newBookingElement = document.getElementById("new-booking-component");
  if (newBookingElement) {
    mountReactComponent("NewBooking", "new-booking-component");
  }

  const showBookingElement = document.getElementById("show-booking-component");
  if (showBookingElement) {
    const bookingData = JSON.parse(showBookingElement.dataset.booking);
    mountReactComponent("ShowBooking", "show-booking-component", {
      booking: bookingData,
    });
  }
});

window.mountReactComponent = mountReactComponent;

export { mountReactComponent, Booking, NewBooking, ShowBooking };

import "@hotwired/turbo-rails";
import * as React from "react";
import * as ReactDOM from "react-dom/client";

// This file is the entry point to the apps javascript
// This file should import all react components and set up the mounting function

const Components = {
  Booking,
};

// Expose the component globally
import Booking from "./components/Booking";


const mountReactComponent = (componentName, elementId, props = {}) => {
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
    } else {
      console.error(`Component ${componentName} not found`);
    }
  } else {
    console.error(`Element with id ${elementId} not found`);
  }
};

// Expose mountReactComponent globally
window.mountReactComponent = mountReactComponent;

// remove at some point
console.log(
  "application.js loaded, mountReactComponent:",
  window.mountReactComponent
);

export { mountReactComponent, Booking };

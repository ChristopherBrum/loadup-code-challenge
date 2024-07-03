import "@hotwired/turbo-rails";
import * as React from "react";
import * as ReactDOM from "react-dom/client";
import Booking from "./components/Booking";

const Components = {
  Booking,
};

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

window.mountReactComponent = mountReactComponent;

export { mountReactComponent, Booking };

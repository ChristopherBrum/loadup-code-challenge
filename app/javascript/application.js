// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers";
import * as React from "react";
import * as ReactDOM from "react-dom/client";

window.mountReactComponent = (Component, elementId, props = {}) => {
  const element = document.getElementById(elementId);
  if (element) {
    const root = ReactDOM.createRoot(element);
    root.render(
      <React.StrictMode>
        <Component {...props} />
      </React.StrictMode>
    );
  }
};

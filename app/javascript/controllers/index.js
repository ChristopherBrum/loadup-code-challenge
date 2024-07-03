// Import and register all your controllers from the importmap under controllers/*

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.
import { defineAllControllers } from "./define_controllers"
defineAllControllers(application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

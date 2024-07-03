import { identifierForContextKey } from "@hotwired/stimulus-webpack-helpers"

export function defineAllControllers(application) {
  const context = require.context(".", true, /_controller\.js$/)

  context.keys().forEach((key) => {
    const identifier = identifierForContextKey(key)
    const controllerConstructor = context(key).default
    application.register(identifier, controllerConstructor)
  })
}

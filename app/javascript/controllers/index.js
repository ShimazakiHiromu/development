// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Stimulus controllersの自動ロード
const context = require.context("./", true, /\.js$/)
context.keys().forEach((key) => {
  const controller = context(key)
  application.register(key.split("/").pop().replace(".js", ""), controller.default)
})
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
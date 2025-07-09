import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
import $ from "jquery";
window.$ = $;
window.jQuery = $;

import "controllers" // if you use Hotwire/Stimulus

import "@nathanvda/cocoon"; // <-- Add this


import Rails from "@rails/ujs"
import { Turbo } from "@hotwired/turbo-rails"
import "controllers" // This should be pointing to your Stimulus controllers if you are using Stimulus

// Initialize Rails UJS and Turbo
Rails.start()
Turbo.start()
// import 'bootstrap'
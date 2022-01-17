import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./diagnosis_items_loader.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

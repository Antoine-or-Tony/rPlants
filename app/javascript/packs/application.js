// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css"

const elementStart = document.querySelector("#flatpickr-start")
const elementEnd = document.querySelector("#flatpickr-end")
const startDate = document.querySelector(".choose-dates").dataset.start
const endDate = document.querySelector(".choose-dates").dataset.end

document.addEventListener('turbolinks:load', () => {
  initMapbox();

  console.log(elementStart)
  if (elementStart) {
    var href = document.querySelector(".link-to-booking").href.split("=")[0] + '='
    console.log("flatpickr")
    flatpickr(elementStart, {
      enable: [{from: startDate, to: endDate}],
      onChange: function(selectedDates, dateStr, instance) {
        console.log(dateStr)
        href = href + "|start:" + dateStr
        document.querySelector(".link-to-booking").href = href
        console.log(href)
      },
    });
    flatpickr(elementEnd, {
      enable: [{from: startDate, to: endDate}],
      onChange: function(selectedDates, dateStr, instance) {
        console.log(dateStr)
        href = href + "|end:" + dateStr
        document.querySelector(".link-to-booking").href = href
        console.log(href)
      },
    });
  }
})

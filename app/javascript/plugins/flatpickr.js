import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const displayTotalPrice = (date) => {

  const dates = document.querySelector('#range_start');
  if (dates) {
    const totalPriceTag = document.querySelector('#total_price');
    const plantPrice = totalPriceTag.dataset.price

    const updateValue = () => {
      const totalPrice = (date[1] - date[0])/(1000*3600*24) * plantPrice
      totalPriceTag.innerText = totalPrice
    }

    dates.addEventListener('input', updateValue);
  };
}

flatpickr("#range_start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})],
  onClose: displayTotalPrice
})


// old code

  // if (document.querySelector(".choose-dates")) {
  //   const elementStart = document.querySelector("#flatpickr-start")
  //   const elementEnd = document.querySelector("#flatpickr-end")
  //   const startDate = document.querySelector(".choose-dates").dataset.start
  //   const endDate = document.querySelector(".choose-dates").dataset.end

  //   var href = document.querySelector(".link-to-booking").href.split("=")[0] + '='
  //   console.log("flatpickr")
  //   flatpickr(elementStart, {
  //     enable: [{from: startDate, to: endDate}],
  //     onChange: function(selectedDates, dateStr, instance) {
  //       console.log(dateStr)
  //       href = href + "|start:" + dateStr
  //       document.querySelector(".link-to-booking").href = href
  //       console.log(href)
  //     },
  //   });
  //   flatpickr(elementEnd, {
  //     enable: [{from: startDate, to: endDate}],
  //     onChange: function(selectedDates, dateStr, instance) {
  //       console.log(dateStr)
  //       href = href + "|end:" + dateStr
  //       document.querySelector(".link-to-booking").href = href
  //       console.log(href)
  //     },
  //   });
  // }

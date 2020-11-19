import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpicker = () => {
 
 const rentalForm = document.getElementById('rental-form-div');

 if (rentalForm) {
  const rentals = JSON.parse(rentalForm.dataset.rentals);
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end"})],
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    "disable": rentals,
  })
}
}

export { initFlatpicker };
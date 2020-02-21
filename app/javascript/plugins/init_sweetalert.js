import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector('#sweet-alert-demo');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal("Thank you for the review!", {
        buttons: false,
        timer: 2000,
      }).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };

/*
If click outsite a record modal, then close the modal
*/
const recordsModals = document.querySelectorAll('.discover-vinyl-card');
const recordsCards = document.querySelectorAll('.records-index-card');

function undisplay(record) {
  record.classList.toggle('records-undisplay');
}

function checkActive(record) {
  recordsModals.forEach(modal => {
    if (modal.querySelector(".discover-vinyl-card")) {
      undisplay(record);
    }
  })
}

// CLOSE MODAL IF CLICK OUTSIDE MODAL
/* document.addEventListener('click', closeActiveModal); 

function closeActiveModal(event) {
  recordsModals.forEach(modal => {
    if (!modal.contains(event.currentTarget)) {
      undisplay(modal);
      } else {

      }
  })
} */


recordsCards.forEach(recordCard => {
  const recordModal = document.getElementById('discover-record-modal-' + recordCard.dataset.recordId)
  const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)

  recordCard.addEventListener('click', () => {
    checkActive(recordModal)
    undisplay(recordModal);
  })

  close.addEventListener('click', () => {
    undisplay(recordModal);
  })

})

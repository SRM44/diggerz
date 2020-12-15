const recordsCards = document.querySelectorAll('.records-index-card');

function undisplay(record) {
  record.classList.toggle('records-undisplay');
}

/* function checkRecord(record) {
  record.querySelector("div:not(.records-undisplay)");
}
 */

recordsCards.forEach(recordCard => {
  const recordModal = document.getElementById('discover-record-modal-' + recordCard.dataset.recordId)
  const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)

  recordCard.addEventListener('click', (event) => {
    undisplay(recordModal);
  })

  close.addEventListener('click', () => {
    undisplay(recordModal);
  })
})

    /*

    Check THE record element that does not contain undisplay
  Toggle function close
  Then toggle undisplay on clicked element
  Else just toggle undisplay on clicked element
  */

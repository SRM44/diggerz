const recordsCards = document.querySelectorAll('.records-index-card');

function undisplay(record) {
  record.classList.toggle('records-undisplay');
}

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
  If a single record element does not contain undisplay 
  Toggle function close 
  Then toggle undisplay on clicked element 
  Else just toggle undisplay on clicked element 
  */
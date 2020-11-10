const recordsCards = document.querySelectorAll('.records-index-card');

recordsCards.forEach(recordCard => {
    const recordModal = document.getElementById('discover-record-modal-' + recordCard.dataset.recordId)
  
    recordCard.addEventListener('click', (event) => {
      recordModal.classList.toggle('records-undisplay')
    })
  
    const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)
    
    close.addEventListener('click', () => {
      recordModal.classList.toggle('records-undisplay')
    })
  
  })
  
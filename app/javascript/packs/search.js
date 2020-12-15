/* 
Put records in a nodeList 
For each click on one record
Check if one record elementSibling within the nodeList that does not contain undisplay class
Toggle function undisplay on the previous record to close it 
Then toggle undisplay on current clicked element 
*/
const recordsCards = document.querySelectorAll('.records-index-card');
const recordsModals = document.querySelectorAll('.discover-vinyl-card');


function undisplay(record) {
  record.classList.toggle('records-undisplay');
}



function checkActive(record) {

  recordsModals.forEach(modal => {
    if (modal.querySelector(".discover-vinyl-card")) {
      undisplay(record);
    } else {
      console.log("truc")
    }
  })
}

recordsCards.forEach(recordCard => {
  const recordModal = document.getElementById('discover-record-modal-' + recordCard.dataset.recordId)
  
  recordCard.addEventListener('click', (event) => {
    checkActive(recordModal)
    undisplay(recordModal);
  })
  
  const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)
  close.addEventListener('click', () => {
    undisplay(recordModal);
  })

})


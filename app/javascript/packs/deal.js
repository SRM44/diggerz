/* 
For my proposed record 
On click 
Check for previous record
Select a record within my collection
Remove previous record 
Add the new record to deal
Close my collection
*/

/* SELECT MY RECORD */
const records = document.querySelectorAll('.deal-myrecord')

records.forEach((record) => {
  record.addEventListener('click', () => {
    
    const requesterRecord = document.getElementById('deal_requester_record_id')
    requesterRecord.value = record.dataset.recordId
    
    if (addMyRecord.called) { 
      console.log('coucou');
    } else { 
      recordInput();
      addMyRecord(record);
      modifyBtn();
    }
  })
})

/* MODIFY SHOW INPUT */
function recordInput() {
  document.querySelector('.deal-input').classList.add('deal-input-show')
}

/* MODIFY COLLECTION BTN */
function modifyBtn() {
  document.getElementById("vinyl-card-proposition-button").innerHTML =" Modifier le disque";
}

/* ADD MY RECORD TO RESULTS */
function addMyRecord(record, presence) {
  const resultDiv = document.getElementById('deal-myrecord-swapped')

  
  const resultContent = `
    <div class="deal-myrecord-swapped-infos">
      <p><em>En échange de :</em></p>
      <h4>${record.dataset.recordTitle}</h4>
      <p>${record.dataset.recordArtist}</p>
    </div>
    <div class="deal-myrecord-swapped-image">
      <img class="avatar-square" src="${record.dataset.recordImage}">
    </div>
  `
  resultDiv.insertAdjacentHTML('afterbegin', resultContent)
  toggleCollection();
}


/* TOGGLE MYRECORDS COLLECTION */
const displayButtons = document.querySelectorAll('#vinyl-card-proposition-button')
displayButtons.forEach((button) => {
  button.addEventListener('click', toggleCollection);
})

function toggleCollection() {
  document.querySelector('.vinyl-card-collection').classList.toggle('records-undisplay');
}
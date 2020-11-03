/* 
On click on modify button
If button includes 'modifier' 
Select a record within my collection
Then remove previous record from input 
Add the new record to input AND replace old record to my collection 
Close my collection
*/

/* SELECT MY RECORD */
const records = document.querySelectorAll('.deal-myrecord')
const selectedRecord = document.getElementById("deal-myrecord-swapped")
const btn = document.getElementById("vinyl-card-proposition-button")

function getRecord(){ 
  records.forEach((record) => {
    record.addEventListener('click', () => {
      const requesterRecord = document.getElementById('deal_requester_record_id')
      requesterRecord.value = record.dataset.recordId

      if (selectedRecord.lastElementChild) {
        addMyRecord(record);
        removeRecord();
      } else {
        recordInput();
        addMyRecord(record);
        modifyBtn();
      }
    })
  })
}

/* SHOW INPUT */
function recordInput() {
  document.querySelector('.deal-input').classList.add('deal-input-show')
}

/* ADD MY RECORD TO RESULTS */
function addMyRecord(record) {
  const resultDiv = document.getElementById('deal-myrecord-swapped')
  
  const resultContent = 
  `<div class="deal-myrecord-swapped-infos">
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

/* MODIFY COLLECTION BTN */
function modifyBtn() {
  btn.innerHTML =" Modifier le disque";
}

function removeRecord() {
  selectedRecord.innerHTML = "";
  toggleCollection();
}

/* TOGGLE MYRECORDS COLLECTION */
const displayButtons = document.querySelectorAll('#vinyl-card-proposition-button')

displayButtons.forEach((button) => {
  button.addEventListener('click', () => {
   
      toggleCollection();
      getRecord();

  })
})

function toggleCollection() {
  document.querySelector('.vinyl-card-collection').classList.toggle('records-undisplay');
}
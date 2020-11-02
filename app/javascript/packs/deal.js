/* 
For each records of my collection 
On click
Add record to deal and close my collection

++

For my proposed record 
On click 
Add a different record to deal and close
*/

const records = document.querySelectorAll('.deal-myrecord')

records.forEach((record) => {
  record.addEventListener('click', () => {

    const requesterRecord = document.getElementById('deal_requester_record_id')
    requesterRecord.value = record.dataset.recordId

    const dealBtn = document.querySelector('.deal-input')
    dealBtn.classList.add('deal-input-show')
    dealBtn.classList.remove('deal-input')

    const resultDiv     = document.getElementById('deal-myrecord-swapped')

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
  })
})

/* OPEN MYRECORDS COLLECTION */
const displayButton = document.getElementById('vinyl-card-proposition-button')
const closeButton = document.getElementById('close_collection_button')

displayButton.addEventListener('click', toggleCollection);
closeButton.addEventListener('click', toggleCollection);

function toggleCollection() {
  const displayButton = document.querySelector('.vinyl-card-collection')
  
  displayButton.classList.toggle('records-undisplay');
}
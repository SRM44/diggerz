const records = document.querySelectorAll('.deal-myrecord')
  records.forEach((record) => {
    record.addEventListener('click', () => {
      const input = document.getElementById('deal_requester_record_id')
      input.value = record.dataset.recordId
      const collection = document.querySelector('.vinyl-card-collection')
      collection.classList.add('records-undisplay')
      const tracklist = document.querySelector('.vinyl-card-more')
      tracklist.classList.add('records-undisplay')
      const deal = document.querySelector('.deal-input')
      deal.classList.add('deal-input-show')
      deal.classList.remove('deal-input')

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
  const displayButton = document.getElementById('vinyl-card-proposition-button')
  displayButton.addEventListener('click', () => {
    const records = document.querySelector('.vinyl-card-collection')
    records.classList.remove('records-undisplay')
  })

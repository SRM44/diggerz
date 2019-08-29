const cards = $('#card-slider .slider-item').toArray();

initAnim(cards);

function initAnim(array) {
  if(array.length >= 4 ) {
    TweenMax.fromTo(array[0], 0, {x:0, y: 0, opacity:0.5}, {x:0, y: -120, opacity:0, zIndex: 0, delay:0.03, ease: Cubic.easeInOut });

    TweenMax.fromTo(array[1], 0, {x:0, y: 50, opacity:1, zIndex: 1}, {x:0, y: 0, opacity:0.5, zIndex: 0, ease: Cubic.easeInOut});

    TweenMax.to(array[2], 0, {bezier:[{x:0, y:125}, {x:65, y:100}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

    TweenMax.fromTo(array[3], 0, {x:0, y:400, opacity: 0, zIndex: 0}, {x:0, y:125, opacity: 0.5, zIndex: 0, ease: Cubic.easeInOut});
  }
}

function startAnim(array) {
  TweenMax.fromTo(array[0], 0.5, {x:0, y: 0, opacity:0.5}, {x:0, y: -120, opacity:0, zIndex: 0, delay:0.03, ease: Cubic.easeInOut });

  TweenMax.fromTo(array[1], 0.5, {x:0, y: 50, opacity:1, zIndex: 1}, {x:0, y: 0, opacity:0.5, zIndex: 0, ease: Cubic.easeInOut});

  TweenMax.to(array[2], 0.5, {bezier:[{x:0, y:125}, {x:65, y:85}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

  TweenMax.fromTo(array[3], 0.5, {x:0, y:400, opacity: 0, zIndex: 0}, {x:0, y:125, opacity: 0.5, zIndex: 0, ease: Cubic.easeInOut});
}

function reverseAnim(array) {
  TweenMax.fromTo(array[0], 0.5, {x:0, y: -120, opacity:0}, {x:0, y: 0, opacity:0.5, zIndex: 0, delay:0.03, ease: Cubic.easeInOut });

  TweenMax.to(array[1], 0.5, {bezier:[{x:0, y:0}, {x:65, y:25}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

  TweenMax.fromTo(array[2], 0.5, {x:0, y: 50, opacity:1, zIndex: 1}, {x:0, y: 125, opacity:0.5, zIndex: 0, ease: Cubic.easeInOut});

  TweenMax.fromTo(array[3], 0.5, {x:0, y:125, opacity: 0.5, zIndex: 0}, {x:0, y:400, opacity: 0, zIndex: 0, ease: Cubic.easeInOut});
}

function nextArray(array) {
  var firstElem = array.shift();
  array.push(firstElem);
}

function previousArray(array) {
  var firstElem = array.pop();
  array.unshift(firstElem);
}


const nextButton = document.getElementById('next')
if (nextButton) {
  nextButton.addEventListener('click', (event) => {
    nextArray(cards)
    startAnim(cards);
  });
}

const previousButton = document.getElementById('previous')
if (previousButton) {
  previousButton.addEventListener('click', (event) => {
    reverseAnim(cards);
    previousArray(cards)
  });
}

cards.forEach(recordCard => {
  const recordModal = document.getElementById('discover-record-modal-' + recordCard.dataset.recordId)
  const navbar      = document.querySelector('.nav-header')

  recordCard.addEventListener('click', (event) => {
    navbar.classList.add('undisplay')
    recordModal.classList.remove('undisplay')
  })
  const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)
  close.addEventListener('click', () => {
    navbar.classList.remove('undisplay')
    recordModal.classList.add('undisplay')
  })

})


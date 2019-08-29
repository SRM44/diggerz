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
    console.log(cards[2].dataset)
    dealButton.href = cards[2].dataset.newDealUrl
    startAnim(cards);
  });
}

const previousButton = document.getElementById('previous')
if (previousButton) {
  previousButton.addEventListener('click', (event) => {
    reverseAnim(cards);
    previousArray(cards)
    console.log(cards[2].dataset)
    dealButton.href = cards[2].dataset.newDealUrl
  });
}

const recordCover = cards[2]
  if (recordCover) {
    recordCover.addEventListener('click', (event) => {
    console.log('hello')
    const record = document.querySelector('.discover-vinyl-card')
    const navbar = document.querySelector('.nav-header')
    navbar.classList.add('undisplay')
    record.classList.remove('undisplay')
    })
  }

const recordDetails = document.querySelector('.vinyl-card-details-index-button')
  if (recordDetails) {
    recordDetails.addEventListener('click', (event) => {
    console.log('hello')
    const record = document.querySelector('.discover-vinyl-card')
    const navbar = document.querySelector('.nav-header')
    navbar.classList.remove('undisplay')
    record.classList.add('undisplay')
    })
  }

const dealButton = document.getElementById('create-deal-btn')
if (dealButton) {
  dealButton.href = cards[2].dataset.newDealUrl
}

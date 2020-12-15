import { gsap, Cubic, MotionPathPlugin } from "gsap/all";
gsap.registerPlugin(MotionPathPlugin);

const cards = $('#card-slider .slider-item').toArray();

initAnim(cards);

function initAnim(array) {
  // if(array.length >= 4 ) { // Commented out to fix bug where vinyls were not displayed from the start at page load
    gsap.fromTo(array[0], 0, {x:0, y: 0, opacity:0.5}, {x:0, y: -120, opacity:0, zIndex: 0, delay:0.01, ease: Cubic.easeInOut });

    gsap.fromTo(array[1], 0, {x:0, y: 50, opacity:1, zIndex: 1}, {x:0, y: 0, opacity:0.5, zIndex: 0, ease: Cubic.easeInOut});

    // Replaced bezier option with motionPath option following this: https://greensock.com/3-migration#motion-path
    gsap.to(array[2], 0, {motionPath:[{x:0, y:100}, {x:65, y:75}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

    gsap.fromTo(array[3], 0, {x:0, y:400, opacity: 0, zIndex: 0}, {x:0, y:80, opacity: 0.5, zIndex: 0, ease: Cubic.easeInOut});
  // }
}

function startAnim(array) {
  gsap.fromTo(array[0], 0.5, {x:0, y: 0, opacity:0.5}, {x:0, y: -120, opacity:0, zIndex: 0, delay:0.01, ease: Cubic.easeInOut });

  gsap.fromTo(array[1], 0.5, {x:0, y: 50, opacity:1, zIndex: 1}, {x:0, y: 0, opacity:0.5, zIndex: 0, ease: Cubic.easeInOut});

  // Replaced bezier option with motionPath option following this: https://greensock.com/3-migration#motion-path
  gsap.to(array[2], 0.5, {motionPath:[{x:0, y:100}, {x:65, y:75}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

}

function reverseAnim(array) {
  gsap.fromTo(array[0],
    {x:0, y: -120, opacity:0},
    {duration: 0.5, x:0, y: 0, opacity:0.5, zIndex: 0, delay:0.01, ease: Power3.easeInOut });

  gsap.to(array[1],
    {duration: 0.5, 
    motionPath:[{x:0, y:0}, {x:65, y:25}, {x:0, y:50}], 
    zIndex: 1, opacity: 1, ease: Power3.easeInOut});

  // Replaced bezier option with motionPath option following this: https://greensock.com/3-migration#motion-path
  gsap.to(array[1], 0.5, {motionPath:[{x:0, y:0}, {x:65, y:25}, {x:0, y:50}], zIndex: 1, opacity: 1, ease: Cubic.easeInOut});

  gsap.fromTo(array[3],
    {x:0, y:100, opacity: 0.5, zIndex: 0},
    {duration: 0.5, x:0, y:400, opacity: 0, zIndex: 0, ease: Power3.easeInOut });

}

function nextArray(array) {
  var firstElem = array.shift();
  array.push(firstElem);
}

function previousArray(array) {
  var firstElem = array.pop();
  array.unshift(firstElem);
}

document.onkeydown = function() {
  switch (window.event.keyCode) {
    case 37:
      reverseAnim(cards);
      previousArray(cards);
      break;
    case 39:
      nextArray(cards);
      startAnim(cards);
      break;
  }
};


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

  recordCard.addEventListener('click', (event) => {
    recordModal.classList.toggle('undisplay')
  })

  const close = recordModal.querySelector('#record-close-modal-' + recordCard.dataset.recordId)

  close.addEventListener('click', () => {
    recordModal.classList.toggle('undisplay')
  })

})

 */
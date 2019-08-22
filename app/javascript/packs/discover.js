const declineButtons = document.querySelectorAll(".swap-card .button-decline");
declineButtons.forEach((button) => {
  button.addEventListener("click", (event) => {
    let swapCard = button.closest('.swap-card')
    swapCard.classList.add('swap-card-undisplay')
  });
});

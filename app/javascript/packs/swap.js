const labels = document.querySelectorAll('.onoffswitch');

labels.forEach((label) => {
  label.addEventListener('change', () => {
    const id  = event.currentTarget.dataset.id;
    const btn = document.getElementById(`submit-record-${id}`)

    btn.click()
  });
})

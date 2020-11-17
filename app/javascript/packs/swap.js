const labels = document.querySelectorAll('.onoffswitch-checkbox');

labels.forEach((label) => {
  label.addEventListener('change', (event) => {
    const id = event.currentTarget.dataset.id;
    const btn = document.getElementById(`submit-record-${id}`)

    btn.click()
  });
})

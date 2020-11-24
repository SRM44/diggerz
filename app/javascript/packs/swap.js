const labels = document.querySelectorAll('.onoffswitch-checkbox');

labels.forEach((label) => {
  label.addEventListener('change', (event) => {
    console.log(label)
    const id  = event.currentTarget.dataset.id;
    const btn = document.getElementById(`submit-record-${id}`)

    console.log(id)
    console.log(btn)

    btn.click()
  });
})

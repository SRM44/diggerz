const input = document.getElementById('photo-input');

input.addEventListener('change', () => {
  displayPreview(input);
})


function displayPreview(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      const preview = document.getElementById('photo-preview')
      reader.onload = (event) => {
        preview.src = event.currentTarget.result;
        preview.style.padding = 0;
      }
      reader.readAsDataURL(input.files[0])
    }
}


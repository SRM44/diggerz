
  const labels = document.querySelectorAll('.onoffswitch');
  labels.forEach((label) => {
    label.addEventListener('change', () => {

      var swappable = label.dataset.swappable;
      var boolean = Boolean(swappable);
      console.log(boolean);

      if (swappable === 'true') {
        boolean = false;
      } else {
        boolean = true;
      }

      console.log(boolean);
    });
})





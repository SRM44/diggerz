const button = document.getElementById('more-options')
const container = document.getElementById("record-options");

function displayOptions () {
  if (container.style.display === "none") {
    container.style.display = "flex";
  } else {
    container.style.display = "none";
  }
};

button.addEventListener("click", displayOptions);

document.addEventListener('mouseup', function(e) {
  if (!container.contains(e.target)) {
    container.style.display = 'none';
  }
});

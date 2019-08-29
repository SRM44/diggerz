import "bootstrap";
import "./discover";
import "./deal";
import "./swap";


// listeners

document.querySelectorAll(".genre-card-label").forEach((label) => {
  label.addEventListener("click", (event) => {
    event.currentTarget.querySelector(".genre-img").classList.toggle("genre-img-active");
  });
});

$(".alert" ).fadeOut(3000);

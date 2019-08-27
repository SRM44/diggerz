import "bootstrap";
import "./discover";
import "./deal";
import "./myrecords";
import "./mydeals";


// listeners

document.querySelectorAll(".genre-card-label").forEach((label) => {
  label.addEventListener("click", (event) => {
    event.currentTarget.querySelector(".genre-img").classList.toggle("genre-img-active");
  });
});

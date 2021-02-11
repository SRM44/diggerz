import "bootstrap";
import "./deal";

// listeners

document.querySelectorAll(".genre-card-label").forEach((label) => {
  label.addEventListener("click", (event) => {
    event.currentTarget.querySelector(".genre-img").classList.toggle("genre-img-active");
  });
});

// $(".alert" ).fadeOut(5000);

// Dynamic nested track form when creating a record
$('form').on('click', '.remove_record', function(event) {
    console.log('Removing track sub form')
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('.track_fields').remove();
    return event.preventDefault();
  });

$('form').on('click', '.add_fields', function(event) {
  const time   = new Date().getTime();
  const regexp = new RegExp($(this).data('id'), 'g');
  $('.fields').append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});


document.getElementById('more-options').addEventListener("click", displayOptions) 

function displayOptions () {
const x = document.getElementById("record-options");
    if (x.style.display === "none") {
        x.style.display = "flex";
    } else {
        x.style.display = "none";
    }
}
const modal = document.createElement("div");
modal.classList.add("show");
modal.innerHTML = "<h2>Vuelve al trabjo</h2> <p>Termino tu tiempo</p>";

const time = 5200;

setTimeout(() => {
  document.body.appendChild(modal);
}, time);

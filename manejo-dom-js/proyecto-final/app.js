const hideElement = (ev) => {
  const element = ev.target;

  element.style.display = "none";
  document.body.style.overflow = "";

  document.body.removeEventListener("click", hideElement);
  document.body.removeEventListener("mouseover", addBorder);
  document.body.removeEventListener("mouseout", removeBorder);
};

const addBorder = (ev) => {
  const element = ev.target;
  element.style.border = "2px solid tomato";
};

const removeBorder = (ev) => {
  const element = ev.target;
  element.style.border = "";
};

document.body.addEventListener("click", hideElement);
document.body.addEventListener("mouseover", addBorder);
document.body.addEventListener("mouseout", removeBorder);

import { faker } from "https://esm.sh/@faker-js/faker";
const number = 100;

const generadorPersonas = () => {
  return {
    name: faker.person.fullName(),
    email: faker.internet.email(),
    phone: faker.phone.number(),
    address: {
      street: faker.location.streetAddress(),
      city: faker.location.city(),
      state: faker.location.state(),
      zipCode: faker.location.zipCode(),
    },
    dateOfBirth: faker.date.birthdate({ min: 18, max: 50, mode: "age" }),
    bio: faker.lorem.sentence({ min: 10, max: 25 }),
    image: faker.image.urlLoremFlickr({ category: "people" }),
    zodiac: faker.person.zodiacSign(),
  };
};

const encontrar = () => {
  const fakePeople = [];

  for (let i = 0; i < number; i++) {
    fakePeople.push(generadorPersonas());
  }

  const randomIndex = Math.floor(Math.random() * fakePeople.length);
  const randomPerson = fakePeople[randomIndex];

  let result = document.getElementById("result");
  let image = document.createElement("img");
  let img = document.getElementById("img");

  image.src = randomPerson.image;
  image.width = 250;
  image.height = 250;
  img.appendChild(image);

  let existeImagen = document.querySelector("img");

  if (existeImagen) {
    existeImagen.remove();
  } else {
    img.appendChild(image);
  }

  result.innerHTML = `Nombre: ${randomPerson.name} <br>
  Fecha de nacimiento: ${randomPerson.dateOfBirth} <br>
  Phone: ${randomPerson.phone} <br>
  Email: ${randomPerson.email} <br>
  Biografia: ${randomPerson.bio} <br>
  Signo: ${randomPerson.zodiac} <br>
  Ciudad: ${
    randomPerson.address.city +
    "<br>" +
    "  Estado: " +
    randomPerson.address.state +
    "<br>" +
    "  Nombre de la calle: " +
    randomPerson.address.street +
    "<br>" +
    "  Codigo postal: " +
    randomPerson.address.zipCode
  }`;
};

window.encontrar = encontrar;

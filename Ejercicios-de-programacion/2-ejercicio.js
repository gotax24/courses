const sorteo = (equipos) => {
  if (equipos.length % 2 > 0) {
    equipos.push("Descansa");
  }

  let enfretamiento = [];
  let rivales = equipos.length - 1;
  let partidos = equipos.length / 2;

  for (let i = 0; i < rivales; i++) {
    enfretamiento[i] = [];
    for (let j = 0; j < partidos; j++) {
      enfretamiento[i].push([equipos[j], equipos[rivales - j]]);
    }
    equipos.splice(1, 0, equipos.pop());
  }
  return enfretamiento;
};
const particpantes = [
  "Mi princesa",
  "Ernesto",
  "Pepi",
  "Martin",
  "Randy",
  "Diego",
];

console.log(sorteo(particpantes));

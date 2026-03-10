//creamos un tablero de ajedrez
// Blanco = B
// Negro = N

for(lin = 1; lin < 9; lin++){
    let linea = "";
for (let casilla = 0; casilla < 8; casilla++) {
  if (casilla % 2 == 0 && lin % 2 == 0){
    linea = linea + "N";
  } 
  else if (casilla % 2 == 0 && lin % 2 != 0){
    linea = linea + "B";
  } 
  else if (casilla % 2 != 0 && lin % 2 == 0){
    linea = linea + "B";
  } 
  else{
    linea = linea + "N";
  } 
}

console.log(linea)
}
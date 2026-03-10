/**Crea una función crearTemporizador que acepte un tiempo en segundos y devuelva una función que, cuando se ejecute, imprima un mensaje después de que haya transcurrido ese tiempo. */

const crearTemporizador = (numero) => {
  const contador = numero * 1000;

  return () => {
   setTimeout(()=>{
    console.log(`Este mensaje va a aparecer despues de ${numero}sg jajaja`)
   }, contador)
  };
};

const contador = crearTemporizador(5);
contador();

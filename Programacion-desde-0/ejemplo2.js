let year = 2023

if((year % 4 === 0 && year & 100 !== 0)|| year % 400 === 0){
    console.log("El año " + year + " es biciesto");
}else{
    console.log("El año " + year + " no es biciesto")
}

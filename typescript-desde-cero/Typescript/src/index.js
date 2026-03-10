var nombre = "Juan"; // Explícito
var edad = 25; // Inferido (TS sabe que es number)
function sumar(a, b) {
    return a + b;
}
console.log(sumar(10, 20));
function saludar(nombre) {
    return "Hola ".concat(nombre);
}
console.log(saludar("Ernesto"));
//se debe indicar que se espera ademas que va a entregar el return si no se entrega nada es void
var saludar2 = function (nombre) {
    return "Hola ".concat(nombre);
};
console.log(saludar2("chatgpt"));
var producto1 = {
    id: 1,
    name: "Vaso",
    price: 5,
    available: true,
};
var producto2 = {
    id: 1,
    name: "Vaso",
    price: 5,
};
console.log(producto1);
console.log(producto2);
var price;
var convertirNumero = function (price) {
    var numero = typeof price === "string" ? Number(price) : price;
    return numero;
};
console.log(convertirNumero("25"));
var usuario1 = {
    id: 1,
    name: "Ernesto",
    email: "ernestobracho@cevaz.com",
    role: "admin",
};
console.log(usuario1);
//enums de string perfecto para frontend/api
var OrderStatus;
(function (OrderStatus) {
    OrderStatus["PENDING"] = "PENDING";
    OrderStatus["PAID"] = "PAID";
    OrderStatus["CANCELLED"] = "CANCELLED";
})(OrderStatus || (OrderStatus = {}));
var order1 = OrderStatus.PAID;
console.log(order1);
var Role = {
    ADMIN: "admin",
    USER: "user",
    GUEST: "guest",
    YAL: "Yaldriani"
};
var user = Role.YAL; //usuario de serviodr 
if (user === Role.YAL) {
    console.log("Te amo");
}

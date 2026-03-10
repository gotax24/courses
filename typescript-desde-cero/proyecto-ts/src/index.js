/**
 * Sistema de inventario simple
Requisitos:

- Crear tipo Product

id (readonly)
name
price
stock

- Crear lista inventory: Product[]

Crear funciones:

addProduct
sellProduct
getInventoryValue
Usar union types para:

estado de venta "success" | "out_of_stock"
*/
var inventory = [];
var addProduct = function (data) {
    var existingId = inventory.find(function (item) { return item.id === data.id; });
    if (existingId) {
        console.error("Ya el id existe pendejo");
        return;
    }
    inventory.push(data);
};
var producto1 = {
    id: 1,
    name: "Papa",
    price: 5,
    stock: 10
};
addProduct(producto1);
console.log(inventory);

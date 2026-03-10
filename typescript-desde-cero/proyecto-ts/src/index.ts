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

-addProduct
-sellProduct
getInventoryValue
Usar union types para:
-estado de venta "success" | "out_of_stock"
*/

interface Product {
  readonly id: number;
  name: string;
  price: number;
  stock: number;
}

const inventory: Product[] = [];
const sell: [] = [];

const addProduct = (data: Product): void => {
  const existingId = inventory.find((item) => item.id === data.id);

  if (existingId) {
    console.error("Ya el id existe pendejo");
    return;
  }

  inventory.push(data);
};

type resultSell = "vendido" | "no hay stock"| "No existe el producto";

const sellProduct = (id: number, pedido: number): resultSell => {
  const existingId = inventory.find((item) => item.id === id);
  
  if(!existingId){
    console.error("No existe el producto");
    return "No existe el producto"
  }

  if (pedido > existingId.stock) {
    return "no hay stock";
  }

  existingId.stock = existingId.stock - pedido

  return "vendido";
};

const producto1: Product = {
  id: 1,
  name: "Papa",
  price: 5,
  stock: 10,
};

const producto2: Product = {
  id: 2,
  name: "zanahoria",
  price: 4,
  stock: 8,
};

addProduct(producto1);
addProduct(producto2);

console.log(inventory);

sellProduct(1, 3);

console.log(inventory);

const hola = "hola bebe con "
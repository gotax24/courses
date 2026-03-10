let nombre: string = "Juan"; // Explícito
let edad: number = 25; // Inferido (TS sabe que es number)

function sumar(a: number, b: number): number {
  return a + b;
}

console.log(sumar(10, 20));

function saludar(nombre: string): string {
  return `Hola ${nombre}`;
}

console.log(saludar("Ernesto"));

//se debe indicar que se espera ademas que va a entregar el return si no se entrega nada es void
const saludar2 = (nombre: string): string => {
  return `Hola ${nombre}`;
};

console.log(saludar2("chatgpt"));

//mejor para union types tipos simples  enums remplazable(no se todavia)
type Producto = {
  id: number;
  name: string;
  price: number;
  available?: boolean; //significa opcional
};

const producto1: Producto = {
  id: 1,
  name: "Vaso",
  price: 5,
  available: true,
};

const producto2: Producto = {
  id: 1,
  name: "Vaso",
  price: 5,
};

console.log(producto1);
console.log(producto2);

let price: number | string;
const convertirNumero = (price: number | string): number => {
  const numero: number = typeof price === "string" ? Number(price) : price;

  return numero;
};

console.log(convertirNumero("25"));

//mejor para objectos o props
interface User {
  id: number;
  name: string;
  email: string;
  role: "admin" | "user";
}

const usuario1: User = {
  id: 1,
  name: "Ernesto",
  email: "ernestobracho@cevaz.com",
  role: "admin",
};

console.log(usuario1);

//enums de string perfecto para frontend/api
enum OrderStatus {
  PENDING = "PENDING",
  PAID = "PAID",
  CANCELLED = "CANCELLED",
}

const order1: OrderStatus = OrderStatus.PAID;

console.log(order1);

//Son inmutables son literales no son string
const Role = {
  ADMIN: "admin",
  USER: "user",
  GUEST: "guest",
  YAL: "Yaldriani",
} as const;

//recorre los roles y crea una variable con varios tipos de opciones
type roleStatus = (typeof Role)[keyof typeof Role];

//se le asigna el rol
let user: roleStatus = Role.YAL; //usuario de serviodr

if (user === Role.YAL) {
  console.log("Te amo");
}

const users: readonly User[] = [{
  id:1,
  name: "yal",
  email:"Yal",
  role:"admin", 
},];

users[0]!.name = "Ernesto";


console.log(users[0])
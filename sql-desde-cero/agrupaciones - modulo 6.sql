-- agrupaciones
-- creamos unas tablas para el ejercicio de agrupaciones
create table products (
  id uuid default gen_random_uuid() not null,
  product_name varchar(30) not null,
  price numeric (10,2) not null,
  constraint products_id_pk primary key (id),
  constraint products_product_name_uk unique (product_name)
);

--encabezado de facturación
create table invoices (
  id uuid default gen_random_uuid() not null,
  invoice_date date default now() not null,
  persons_id uuid not null,
  constraint invoices_id_pk primary key (id),
  constraint invoices_persons_id_fk foreign key (persons_id)
                      references persons (id)
                      on update restrict
                      on delete restrict
);

--ya que es una factura el precio debe ser cuando se saca la factura por eso se repite precio aqui
create table invoices_items (
    id uuid default gen_random_uuid() not null,
    invoice_id uuid not null,
    product_id uuid not null,
    price numeric(10,2) not null,
    quantity int default 1 not null,
    constraint invoices_items_id_pk primary key (id),
    constraint invoices_items_invoices_id_fk foreign key (invoice_id)
                            references invoices(id)
                            on delete restrict
                            on update restrict ,
    constraint invoices_items_products_id_fk foreign key (product_id)
                            references products (id)
                            on delete restrict
                            on update restrict
);

insert into products values
                         (default, 'Arroz',12.31),
                         (default,'Papa',1.44),
                         (default, 'Carne',20);

--returning me devuelve el dato que yo quiera cuando se crea el registro solamente en prostgres
insert into invoices (persons_id) values ('7226c01a-f28d-4532-9a1a-0c0c03869e32') returning id;
insert into invoices_items
values (default, 'bbc6d4f8-03ae-4f79-bb20-31871848d58d',
        'd92276fa-9d8a-4a01-a3c3-6ccad596096e', 1.44,3),

       (default, 'bbc6d4f8-03ae-4f79-bb20-31871848d58d',
        'f7c57630-a5ba-4244-8e30-eb05d2c82b62', 21,12);

insert into invoices_items
values (default, '92ada10a-b656-4c88-8421-bcf093ed9127',
        'd92276fa-9d8a-4a01-a3c3-6ccad596096e', 1.44,12),

       (default, '92ada10a-b656-4c88-8421-bcf093ed9127',
        'f7c57630-a5ba-4244-8e30-eb05d2c82b62', 21,5);

insert into invoices (persons_id)
values ('e36f93c6-6f20-4136-b295-a4094b036a6a') returning id;
insert into invoices_items
values (default, '4a935d2f-30f8-4d53-92d6-1e81b0fcafb1',
        'd92276fa-9d8a-4a01-a3c3-6ccad596096e', 1.44, 1),

       (default, '4a935d2f-30f8-4d53-92d6-1e81b0fcafb1',
        'f7c57630-a5ba-4244-8e30-eb05d2c82b62', 21, 10),

       (default, '4a935d2f-30f8-4d53-92d6-1e81b0fcafb1',
        '65bcdb0d-de19-45a5-ae5f-b3c00e321baa', 14.11, 3);

insert into invoices (persons_id) values ('61566ee8-4d94-4973-a1d6-1376a487d760') returning id;
insert into invoices_items
values (default, '5b3bb0dc-eaf5-42a2-bce4-908b291d573b',
        '65bcdb0d-de19-45a5-ae5f-b3c00e321baa',14.11,1),

       (default, '5b3bb0dc-eaf5-42a2-bce4-908b291d573b',
        'd92276fa-9d8a-4a01-a3c3-6ccad596096e',1.44,5);

--consulta de agrupaciones
--distinct nos consulta la informacion distiguiendo la proyeccion
--esta consulta solo me trae los nombre diferentes
select distinct first_name from persons;
select distinct last_name from persons;

--group by
--debe contener los campos proyectados a execpcion de las funciones
select last_name from persons group by last_name; --asi se hace igual que distinct
--debe tener los mismos campos que estan solicitados como en este ejemplo debe tener first y last
select persons.first_name, persons.last_name from persons group by last_name, first_name;

--funciones
--count para contar cuantos nombre se repiten
select persons.first_name, count(*) as cantidad from persons group by first_name;
--para contar cuantos registros hay
select count(*) from persons;
--funciona bien pero cabe desctacar que count omite los campos nulos no lo cuentas
select persons.first_name, count(last_name) as cantidad from persons group by first_name;

--preguntas a resolver con sql

--cuanto es el total de venta de la primera factura? R= 256.32
select * from invoices;

select * from invoices_items where invoice_id = 'bbc6d4f8-03ae-4f79-bb20-31871848d58d';

select sum(invoices_items.price * invoices_items.quantity)
from invoices_items
where invoice_id= 'bbc6d4f8-03ae-4f79-bb20-31871848d58d';

--cuanto es el total de venta de todas las facturas, agrupadas por facturas R= 256.32 | 21.31 | 253.77
select invoice_id ,sum(price * quantity) from invoices_items group by invoice_id ;

--cuanto ha comprado en total el cliente Ernesto Bracho? 253.77
select * from persons;
select sum(invoices_items.price * invoices_items.quantity)
from invoices_items where invoice_id in (select id from invoices where persons_id = 'e36f93c6-6f20-4136-b295-a4094b036a6a');
--cuanto ha comprado en total el cliente Rosanna Ragno? 21.31
select * from persons;
select sum(invoices_items.price * invoices_items.quantity)
from invoices_items where invoice_id in (select id from invoices where persons_id = '61566ee8-4d94-4973-a1d6-1376a487d760');
--Cual producto se ha vendido mas o menos en cantidad?
--Cual producto se ha vendido mas/menos en valor?
select * from invoices_items;
select invoices_items.product_id , count(*) as registros,
       sum(price*invoices_items.quantity) valor_venta, sum(quantity) cantidad_vendida
from invoices_items group by product_id order by 4;

--Having
--Es como la clausula where pero por grupos de registros

--cual cliente ha hecho mas compra? teniendo en cuenta que contamos una factura como una compra
select * from invoices;
--trae todo y lo ordena
select invoices.persons_id, count(*) as cantidad from invoices group by persons_id order by 2 desc;
--solo trae los que hayan comprados mas de 2
select invoices.persons_id,count(*) as cantidad from invoices group by persons_id having count(*) = 1;

--limit y offset
--permite limitar la cantidad de registros devueltos. Sirve para paginar la consulta
select * from invoices_items order by id;

--mostrar los primeros 3 productos
select * from invoices_items order by id limit 3 offset 0;-- pagina 1

--para mostrar los siguientes 3
select * from invoices_items order by id limit 3 offset 3; --pagina 2 ...

--registros a limitar, pagina ?
--paginacion
-- offset := pagina * limite - limite
-- offset := 1 * 5 - 5 = 0 ejemplo
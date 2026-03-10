--conteo de registros de nuestras tablas
select count(*) from invoices;
select count(*) from invoices_items;

--cross join sin usar la clasula join
--el cross join crea una relacion por cada item de la tabla en este caso es 11 * 4 = 44 registros
select * from invoices_items, invoices

--cross join utilizando la clasula join
select * from invoices cross join invoices_items;

--natural join utilizando la clasula join
--filtra la relacion de la tabla a con la tabla b con el nombre del campo identico
create table alpha (
    id int not null,
    description varchar(100) not null,
    constraint alpha_id_pk primary key (id)
);

create table beta (
    id int not null,
    title varchar(50) not null,
    constraint beta_id_fk foreign key (id)
                  references alpha(id)
                  on update restrict
                  on delete restrict
);

insert into alpha values (1, 'UNO'),
                         (2, 'DOS'),
                         (3, 'TRES'),
                         (4, 'CUATRO');

insert into beta values (1, 'ONE'),
                        (2, 'TWO'),
                        (3, 'THREE');

select * from alpha cross join beta;
--natural join busca los campos de la tabla a que se llaman igual que la tabla b
--en este caso es él, id que es el mismo campo
select * from alpha natural join beta;

--inner join muestra los registros que coincidan en ambos cojuntos tanto en la a como en la b
select * from persons;
select * from invoices;

--inner join todos los registros que coincidas en la tabla a y la tabla b comparando persons.id con invoices.person.id
select persons.id,persons.first_name, persons.last_name, persons.birthday, invoices.invoice_date
from persons inner join invoices on persons.id = invoices.persons_id;

--detalles facturas
select persons.id,persons.first_name, persons.last_name, persons.birthday, invoices.invoice_date,
       products.product_name,invoices_items.price, invoices_items.quantity,
       (invoices_items.price * invoices_items.quantity) as total_pagado
from persons
    inner join invoices on persons.id = invoices.persons_id
    inner join invoices_items on invoices.id = invoices_items.invoice_id
    inner join products on product_id = invoices_items.product_id;

--left join muestra todos los registros que coincidan de la tabla de a asi no existan en la tabla b
-- pero muestra informacion si coincide de la tabla b

--mostrar todos nuestros usuarios asi no hayan comprados left join
insert into persons (first_name, last_name, birthday)
values ('Pedro', 'Pinedo', '1993-05-13');

select persons.first_name, persons.last_name, invoices.invoice_date
from persons left join invoices on persons.id = invoices.persons_id;

--rigth join es lo mismo pero con la tabla b es lo mismo pero invertido
select persons.first_name, persons.last_name, invoices.invoice_date
from invoices right join persons on persons.id = invoices.persons_id;

--full join muestra todos los registros de ambas tablas y muestra los que tienen relacion entre ellas
create table gamma (
     id int not null,
    description varchar(50) not null,
    constraint gamma_id_pk primary key (id)
);

insert into gamma values (1, 'ONE'),
                        (2, 'TWO'),
                        (3, 'THREE'),
                        (4, 'FOUR'),
                        (5, 'FIVE');

insert into gamma values (6, 'SIX');

select * from alpha full join gamma on alpha.id = gamma.id;
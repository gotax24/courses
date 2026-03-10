--select con constantes no cambia
select 'Hola mundo';
select 8;

--expresiones solamente te lo agarra entero si no pone 0
select 2*2+2/2;

--casting válido resuelve si el resultado no es entero y te muestra el número decimal en postgres es con (::)
select 8::numeric/23::numeric;

select '2021-06-14'::date;

--casting no valido de string a int
--select 'Hola'::int

--funciones
select now();
select upper('Hola mundo');
select lower('HOLA MUNDO');

--campo de tablas
select * from persons;
select id,first_name from persons;

--uniendo  lo anterior
select id, upper(first_name), 2+4/3, 2::numeric/20::numeric, 'Persona' from persons;

--alias podemos poner un nombre o cambiar el nombre existente de las columnas
select id, upper(first_name) as first_name,
       2+4/3 as expresion,
       2::numeric/20::numeric as casting,
       'Persona' as tabla
from persons;

--Llamamos proyeccion a todos los campos que queremos que devuelva una consulta sql

--FILTROS
--where campo operador valor ejemplo: where first_name = 'Alexys';
select * from persons where first_name = 'Yaldriani';

--funciones
select * from persons where upper(first_name) = 'YALDRIANI';--ya que es case sensitive

--operadores de comparacion
-- =, >, < , >=, <=, el diferente <> algunos motores aceptan (!=) como diferente
select * from persons where upper(first_name) > 'YALDRIANI';
select * from persons where upper(first_name) < 'YALDRIANI';
select * from persons where upper(first_name) >= 'YALDRIANI';
select * from persons where upper(first_name) <= 'YALDRIANI';
select * from persons where upper(first_name) <> 'YALDRIANI';

--and & or
select * from persons where first_name = 'Ernesto' and last_name <> '';
select * from persons where first_name = 'Ernesto' or first_name = 'Rosanna';

--like normal nos permite traer o filtrar caracteres cuando se desconoce todo el valor del caracter
--es como hacer una consulta que no te cuerdas de todos y por eso puede funcionar el like
select * from persons where first_name like 'Ernesto';

--like de un solo caracter o varios
select * from persons where first_name like 'Ern_st_';
select * from persons where first_name like 'Ernest_';

--cuando no conoces la cantidad exacta de caracteres se usa % te trae todos lo que conincida con 'Ern'
--puede ir al principio a la mitad o al final depende de lo que se quiere
select * from persons where first_name like 'Ern%';

--ilike se puede usar cuando no te acuerdas con mayúsculas o minisculas
select * from persons where first_name ilike 'erne%';

--between nos permite aquellos registros que se encuentre en un rango de
select *from persons where birthday between '1980-01-01' and '2005-12-31';

--in nos permite buscar aquellos registros que coincida con un grupo específico de datos
--en el ejemplo puedo poner varios, id y asi buscar un grupo específico de datos si no existe un valor
--solo trae lo que si existe no lanza un error
select * from jobs where persons_id in ('da7d75f9-c8f0-468d-8dfc-ec7f12a0d949', 'da7d75f9-c8f0-468d-5dfc-ec7f12a0d949');

--in select cuando no sabes los valores y se le pude agregar un where
select * from jobs where persons_id in (select id from persons);

--cuales personas tienen trabajo
select * from persons where id in (select persons_id from jobs);

--is null es para hacer consultas con null para hacer comparaciones como este ejemplo de update
--update persons set email = 'ernestobracho@cevaz.com' where email is null;

--not cuando quiero traer por ejemplo los registros que no sean nulos
select * from persons where update_at is not null;

--los que no tienen relacion con la tabla jobs
select * from persons where id not in (select persons_id from jobs);

--ordenar resultados en las consultas con order by

--order by número de campo es decir las columnas internamente tienen un número que siempre empieza por 1
--en este ejemplo te lo ordena alfabéticamente por nombre (ascendente), ya que 2 es first_name a
select * from persons order by 2;
select * from persons order by 2 desc;
--para traer el registro mas antiguo cuando hay dos con el nombre igual
select * from persons order by 2 desc , 5;
--para traer el registro más reciente cuando hay dos con el nombre igual
select * from persons order by 2 desc, 5 desc;

--order by por nombre de campo
select * from persons order by last_name desc ;

select * from products;
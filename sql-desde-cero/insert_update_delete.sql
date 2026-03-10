--Insert into tabla example
INSERT INTO persons (
                     id,
                     name,
                     last_name,
                     birthdate,
                     available
) VALUES (
          gen_random_uuid(),
          'Ernesto',
          'Bracho',
          '1999/09/30',
          true
         );

--si no () antes del value hay que insertar
--todo igual que esta en la tabla
INSERT INTO persons values (
    gen_random_uuid(),
    'Pedro',
    'Pinedo',
    '11/05/1993',
    false
);

--insertando default a lo correspondiente
INSERT INTO students
values (
        default,
        'Jesus',
        default,
        default
        );

--Insert a los componentes que no son default
INSERT INTO students (first_name)
values (
        'Juan'
       );

--insertando varias rows
INSERT INTO students
VALUES
    (default, 'Jose', default, default),
    (default, 'David', default, default),
    (default, 'Ernesto', default, default);

--insertando solamente afectando unas columnas especificas
INSERT INTO students (first_name, created_at)
values
    ('Rosa', default),
    ('Yal', '1994/08/25');

--insertando los datos de una tabla en otra
insert into students (first_name, is_active)
select (jobs.job_name, jobs.currently) from jobs;

--datos nulos borrando para volver crear y hacer not null
drop table students;

--update especifico en postgres no actualiza ya que los registros son inmutable
--lo borra y lo vuelve a crear y lo pone en ultimo

UPDATE persons set
                   name = 'Jesus',
                   last_name='Alarcon',
                   birthdate='1980/04/25',
                   available= true
                   where id = '63a667f6-cc96-4cba-bf30-5bf00c1534c9';

--sin el where se cambia todos los registro de la tabla ejemplo
--aqui cambio todo por false
UPDATE persons set available=false;

--para borrar una row que tenga id null y todo null es asi
DELETE FROM persons where id is null;

DELETE FROM persons where id = '63a667f6-cc96-4cba-bf30-5bf00c1534c9';

--truncate te reinicia la tabla los id y te borra toda la tabla
truncate table persons;

SELECT * FROM persons;
select * from students;

--borrar persona y jobs para aplicar restriciones y conexiones
drop table if exists jobs;
drop table if exists persons;

--contraint para retricciones en la tabla
create table persons (
    id uuid default gen_random_uuid() not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birthday date not null,
    created_at timestamp default now() not null,
    updated_at timestamp default null,
    constraint persons_id_pk primary key (id),
    constraint persons_first_name_last_name_uk unique (first_name, last_name)
);

insert into persons
values (
    default,
    'Ernesto',
    'Bracho',
    '1999/09/30',
    default,
    default
   );

--cascade es para que actualice cuando se actualiza el id y el restrict no deja realizar la opcion
create table jobs (
    id uuid default gen_random_uuid() not null,
    persons_id uuid not null,
    job_name varchar(50) not null,
    created_at timestamp default now() not null,
    updated_at timestamp default null,
    constraint jobs_id_pk primary key (id),
    constraint jobs_persons_id_fk foreign key (persons_id)
        references persons (id)
        on update restrict
        on delete restrict
);

insert into jobs (persons_id, job_name)
values (
        'e36f93c6-6f20-4136-b295-a4094b036a6a',
        'Analista IT'
        );

--intentamos borrar de persona
delete from persons where id = 'e36f93c6-6f20-4136-b295-a4094b036a6a';
-- Crear tabla de personas
-- ID, nombre, apellido, edad, fecha de nacimiento, disponible
CREATE TABLE persons (
    id uuid,
    name varchar(50),
    last_name varchar(50),
    age smallint,
    birthdate date,
    available boolean
);

--Crear tabla de trabajo
--ID, cedula, fecha inicial, fecha final, actual trabajo
CREATE TABLE work (
    id uuid,
    persons_id int,
    begins_at date,
    ends_at date,
    currently boolean
);

--cambio work por jobs
ALTER TABLE work RENAME TO jobs;

--modificar la tabla persona para borrar age
ALTER TABLE persons DROP COLUMN age;

--modificar la tabla jobs para agregar una columna
ALTER TABLE jobs ADD COLUMN job_name varchar(50);

--Crear tabla para borrar
CREATE TABLE borrador (
    id uuid,
    how varchar(50)
);

CREATE TABLE students (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY ,
  first_name varchar(50) NOT NULL ,
  is_active bool default true not null ,
  created_at timestamp default now() not null
);

ALTER TABLE students add column update_at timestamp default null;

--borrar la tabla borrador
DROP TABLE borrador;

create table persons (
    id uuid default gen_random_uuid() not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birthday date not null,
    created_at timestamp default now() not null,
    update_at timestamp default null
);

alter table persons add constraint id_persons_pk primary key (id);

alter table persons add column email varchar(80) constraint persons_email_uk unique;

alter table persons alter column email set not null;

create table jobs (
    id uuid default gen_random_uuid() not null,
    persons_id uuid not null,
    job_name varchar(50) not null,
    created_at timestamp default now() not null,
    updated_at timestamp default null,
    constraint jobs_id_pk primary key (id),
    constraint persons_jobs_fk foreign key (persons_id) references persons (id)
                  on update cascade
                  on delete restrict
);
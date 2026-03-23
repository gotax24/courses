CREATE DATABASE prueba;
GO

USE prueba;

CREATE TABLE dbo.task
(
    id    UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    title VARCHAR(70)      NOT NULL,
    color VARCHAR(20)               DEFAULT NULL
);

ALTER TABLE dbo.task
    ADD completed BIT DEFAULT 0 NOT NULL;

INSERT
  INTO dbo.task (title, color, completed)
VALUES ('Estudiar PHP', '#5203fc', 0),
       ('Ir al supermercado', '#d91e41', 0),
       ('Hacer ejercicio', '31ed9b2', 1);

INSERT
  INTO dbo.task (title, color, completed)
VALUES ('Ir al gym', '#d91e41', 1);

UPDATE dbo.task
   SET completed = ''
 WHERE id = '';

CREATE TABLE dbo.users
(
    id       UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    name     VARCHAR(50)      NOT NULL,
    email    VARCHAR(100)     NOT NULL UNIQUE,
    password VARCHAR(255)     NOT NULL
);

INSERT
  INTO dbo.users (name, email, password)
VALUES ('Ernesto', 'ernestobracho@cevaz.com', '$2y$10$.qHDfyC4R22QaikUGxzQ6.43J.neIe6gRxl4iCMKagnpzo3LSMIwq')
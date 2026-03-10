-- Crear un reporte de la tabla doctors(name, lastname and age).

SELECT doc.doctor_name,
       doc.doctor_lastname,
       doc.doctor_age
  FROM doctors AS doc;

DECLARE cur_doctors CURSOR
    FOR SELECT doc.doctor_name,
               doc.doctor_lastname,
               doc.doctor_age
          FROM doctors AS doc -- Declarar el cursor
OPEN cur_doctors -- Abrir cursor
FETCH NEXT FROM cur_doctors -- Accediendo a la informacion
CLOSE cur_doctors -- Cerrar cursor
DEALLOCATE cur_doctors;
-- Eliminar cursor

-- Agregar un campo a la tabla doctors de nombre password.
-- El campo password debe generarse de la concatenación de los dos primeros caracteres del nombre y lastname.
-- Ejm:
-- name: William,
-- lastname: Barra,
-- resultado: wiba

-- Solucion 1
-- Modificando la tabla doctors
ALTER TABLE doctors
    ADD password2 VARCHAR(10);

-- Como modificamos una tabla?

-- update doctors set password = 'wiba' where staff_id = 1;

-- Como obtenemos los dos primeros caracteres de un texo
SELECT LOWER(SUBSTRING('William', 1, 2));

SELECT *
  FROM doctors;

-- empezando a resolver con cursores
DECLARE
    @id INT,
    @name VARCHAR(25),
    @lastname VARCHAR(25);

DECLARE cur_doctors CURSOR
    FOR SELECT doc.staff_id,
               doc.doctor_name,
               doc.doctor_lastname
          FROM doctors AS doc
OPEN cur_doctors
FETCH cur_doctors INTO @id, @name, @lastname
WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @name_text VARCHAR(2), @lastname_text VARCHAR(2);

        SET @name_text = LOWER(SUBSTRING(@name, 1, 2));
        SET @lastname_text = LOWER(SUBSTRING(@lastname, 1, 2));

        UPDATE doctors
           SET password = CONCAT(@name_text, @lastname_text)
         WHERE staff_id = @id;

        FETCH cur_doctors INTO @id, @name, @lastname
    END
CLOSE cur_doctors
DEALLOCATE cur_doctors;

-- solucion 2 (refactoring)
-- Agregar un campo a la tabla doctors de nombre password2.
-- El campo password debe generarse de la concatenación de los dos primeros caracteres del nombre y lastname.
-- Ejm:
-- name: William,
-- lastname: Barra,
-- resultado: wiba

-- Creando el SP
-- paso 1
CREATE PROCEDURE sp_cursor_for_doctors @cursor_doctors CURSOR VARYING OUTPUT
AS
BEGIN
    SET @cursor_doctors = CURSOR
        FOR
        SELECT doc.staff_id,
               doc.doctor_name,
               doc.doctor_lastname
          FROM doctors AS doc;

    OPEN @cursor_doctors;
END;

--   paso 2
DECLARE
    @id       INT,
    @name     VARCHAR(25),
    @lastname VARCHAR(25);

DECLARE @cur_doctors CURSOR;
    EXECUTE sp_cursor_for_doctors @cursor_doctors = @cur_doctors OUTPUT;
    FETCH @cur_doctors INTO @id, @name, @lastname
    WHILE @@FETCH_STATUS = 0
        BEGIN

            UPDATE doctors
               SET password2 = LOWER(CONCAT(
                   'abc-',
                   SUBSTRING(@name, 1, 2),
                   SUBSTRING(@lastname, 1, 2)
                                     ))
             WHERE staff_id = @id;

            FETCH @cur_doctors INTO @id, @name, @lastname;
        END;
    CLOSE @cur_doctors;
    DEALLOCATE @cur_doctors;

    -- cursores static
--son los cursores que no se modifican quedan almacenados en memoria
DECLARE
    @id       INT,
    @name     VARCHAR(25),
    @lastname VARCHAR(25);

DECLARE
    static_cursor_for_doctors CURSOR STATIC
        FOR
        SELECT doc.staff_id,
               doc.doctor_name,
               doc.doctor_lastname
          FROM doctors AS doc
    OPEN static_cursor_for_doctors
BEGIN
    FETCH NEXT FROM static_cursor_for_doctors INTO @id, @name, @lastname
    WHILE @@FETCH_STATUS = 0
        BEGIN

            PRINT '-> Name : ' + @name + ', Lastname : ' + @lastname
            FETCH NEXT FROM static_cursor_for_doctors INTO @id, @name, @lastname

        END
END
    CLOSE static_cursor_for_doctors
    DEALLOCATE static_cursor_for_doctors

    --cursores dinamicos
--lo contrario de los static se actualiza si hay cambios
DECLARE
    @id       INT,
    @name     VARCHAR(25),
    @lastname VARCHAR(25);

DECLARE
    dynamic_cursor_for_doctors CURSOR DYNAMIC
        FOR
        SELECT doc.staff_id,
               doc.doctor_name,
               doc.doctor_lastname
          FROM doctors AS doc
    OPEN dynamic_cursor_for_doctors
BEGIN
    FETCH NEXT FROM dynamic_cursor_for_doctors INTO @id, @name, @lastname
    WHILE @@FETCH_STATUS = 0
        BEGIN
            UPDATE doctors
               SET password2 = LOWER(CONCAT(
                   'dy-',
                   SUBSTRING(@name, 1, 2),
                   SUBSTRING(@lastname, 1, 2)
                                     ))
             WHERE staff_id = @id;

            FETCH NEXT FROM dynamic_cursor_for_doctors INTO @id, @name, @lastname
        END
END
    CLOSE dynamic_cursor_for_doctors
    DEALLOCATE dynamic_cursor_for_doctors


    --cursores fast_forward
--este cursor no regresa hacia atras todos los demas si se puede para atras para alante o para atras
DECLARE
    @id       INT,
    @name     VARCHAR(25),
    @lastname VARCHAR(25);

DECLARE
    forward_cursor_for_doctors CURSOR FORWARD_ONLY
        FOR
        SELECT doc.staff_id,
               doc.doctor_name,
               doc.doctor_lastname
          FROM doctors AS doc
    OPEN forward_cursor_for_doctors
BEGIN
    FETCH NEXT FROM forward_cursor_for_doctors INTO @id, @name, @lastname
    WHILE @@FETCH_STATUS = 0
        BEGIN
            UPDATE doctors
               SET password2 = LOWER(CONCAT(
                   'fw-',
                   SUBSTRING(@name, 1, 2),
                   SUBSTRING(@lastname, 1, 2)
                                     ))
             WHERE staff_id = @id;

            FETCH NEXT FROM forward_cursor_for_doctors INTO @id, @name, @lastname
        END
END
    CLOSE forward_cursor_for_doctors
    DEALLOCATE forward_cursor_for_doctors;

SELECT *
  FROM doctors;
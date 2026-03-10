-- crear una funcion que permite saber el año actual
SELECT SYSDATETIME();

SELECT YEAR(SYSDATETIME());

CREATE FUNCTION dbo.current_year()
  RETURNS INT AS
BEGIN
  DECLARE @response INT;
  SET @response = YEAR(SYSDATETIME());

  RETURN @response;
END;

SELECT dbo.current_year();

--crear una funcion que permita sumar dos numeros
CREATE FUNCTION dbo.suma(
  @num1 INT,
  @num2 INT
)
  RETURNS INT AS
BEGIN
  DECLARE @respuesta INT = 0;
  SET @respuesta = @num1 + @num2;

  RETURN @respuesta;
END;

SELECT dbo.suma(5, 5);

-- modificacion de funciones

CREATE OR ALTER FUNCTION dbo.suma(
  @num1 INT,
  @num2 INT,
  @if BIT
)
  RETURNS INT AS
BEGIN
  DECLARE @respuesta INT;
  IF @if = 1
    SET @respuesta = @num1 + @num2;
  ELSE
    SET @respuesta = @num1 - @num2;
  RETURN @respuesta;
END;

SELECT dbo.suma(5, 10, 1);

SELECT dbo.suma(5, 10, 0);

--eliminacion de funcion
DROP FUNCTION dbo.suma;

--verificar si la edad a insertarse es correcto. Par poder determinar si es correcto usar la fecha de nacimiento

--obteniendo la cantidad de dias desde la fecha de nacimiento
SELECT DATEDIFF(DAY, '1999-09-10', GETDATE());

-- obteniendo la edad correcta
SELECT FLOOR(DATEDIFF(DAY, '1999-09-10', GETDATE()) / 365.25);

CREATE FUNCTION dbo.validate_age(@birthday DATE,@age INT)
  RETURNS INT AS
BEGIN
  DECLARE @response BIT,
    @cantday INT,
    @ageresponse INT

  SET @cantday = DATEDIFF(DAY, '1999-09-10', GETDATE());
  SET @ageresponse = FLOOR(@cantday / 365.25);

  IF @ageresponse = @age
    SET @response = 1;
  ELSE
    SET @response = 0;

  RETURN @response
END;

SELECT dbo.validate_age('1999-09-30', 26);

--generar un report en donde se muestre que doctores estan asignados a los pacientes
-- El reporte dene mostar nombre y apellidos de los doctores y pacientes

--inserando registro a la tabla

INSERT INTO dbo.doctors_assigned_to_patients(patient_id,staff_id,date_from,date_to)
VALUES (1,1,'2022-06-15','2024-05-12'),
       (2,2,'2024-12-31','2026-03-01');

SELECT *
FROM dbo.doctors_assigned_to_patients

DELETE
FROM dbo.doctors_assigned_to_patients
WHERE da_to_patients_id IN (3,4);

CREATE FUNCTION dbo.report_doctors_patients()
  RETURNS @report_doc_pat TABLE
                          (
                          doctors_name     VARCHAR(25),
                          doctors_lastname VARCHAR(25),
                          patient_name     VARCHAR(25),
                          patient_lastname VARCHAR(25)
                          ) AS
BEGIN
  INSERT INTO @report_doc_pat
  SELECT doctors.doctor_name,
         doctors.doctor_lastname,
         patients.patient_name,
         patients.patient_lastname
  FROM dbo.doctors_assigned_to_patients
         INNER JOIN dbo.doctors ON
      dbo.doctors_assigned_to_patients.staff_id = dbo.doctors.staff_id
         INNER JOIN patients ON
      doctors_assigned_to_patients.patient_id = patients.patient_id;
  RETURN
END;

SELECT *
FROM dbo.report_doctors_patients()

--crea una funcion que permita valiadar la cantidad de carteres sea mayor a cierto numero

CREATE OR ALTER FUNCTION dbo.validate_length(@cadena VARCHAR(200),@num INT)
  RETURNS BIT AS
BEGIN
  DECLARE @response BIT = 0;
  IF @num > LEN(@cadena)
    SET @response = 1

  RETURN @response
END;

SELECT dbo.validate_length('Ernesto24.', 8);
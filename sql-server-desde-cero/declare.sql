-- Manejo de DECLARE
-- Mostrar todos los doctores(nombres, apellidos y edad)
-- en donde la edad sea mayor de 30
USE hospital;
GO

DECLARE @age INTEGER = 30,
  @name VARCHAR(25) = 'Joel';
--set permite cambiar el valor
SET @age = 40;

SET @name = 'Ana';

SELECT doctor_name, doctor_lastname, doctor_age
FROM dbo.doctors
WHERE doctor_age > @age
  AND doctor_name = @name;

-- Manejo de into
-- Mostrar todos los pacientes (nombres, aplellidos, genero y el peso)

--into genera una nueva tabla a partir de otra
SELECT patient_name, patient_lastname, patient_gender, patient_weight
INTO patients_report
FROM patients;

SELECT *
FROM patients_report

--creamos un pk a la tabla recien creada y con la info de la tabla a crear no la crea vacia
DROP TABLE IF EXISTS patients_report
SELECT IDENTITY(INTEGER, 1, 1) AS patient_id,
       patient_name,
       patient_lastname,
       patient_gender,
       patient_weight
INTO patients_report
FROM dbo.patients

--Guardamos la respuesta en una variable
--determinar cuantos registro tiene la tabla patients_report

DECLARE @response INTEGER = 0;

SELECT @response = COUNT(patient_id)
FROM patients_report;

SELECT @response

-- manejo if/else
-- determinar si estamos en un dia laborable o estamos en fin de semana

DECLARE @diadelasemana VARCHAR(12) = '';

SELECT DATENAME(WEEKDAY, GETDATE());

IF @diadelasemana IN ('Sabado','Domingo')
  SELECT 'Fin de la semana';
ELSE
  SELECT 'Dia laboral';

--si el promedio de las edades es par
--por verdad mostrar todos los doctores
--caso contrario mostrar un mensaje igual a 'Se require contratar mas doctores'

DECLARE @promedioedades INTEGER = 0;

SELECT @promedioedades = AVG(doctor_age)
FROM doctors

IF @promedioedades % 2 = 2
  SELECT * FROM doctors
ELSE
  SELECT 'Se requiere contratar mas doctores' AS resultado;

--manejo when/case es como un switch

SELECT patient_name,
       patient_lastname,
       patient_gender =
         CASE
           WHEN patients.patient_gender = 'm' THEN 'Masculino'
           WHEN patients.patient_gender = 'f' THEN 'FemDECLARE @age INTEGER = 30',
        @name VARCHAR(25) = 'Joel';
--set permite cambiar el valor
SET @age = 40;

SET @name = 'Ana';

SELECT doctor_name, doctor_lastname, doctor_age
FROM dbo.doctors
WHERE doctor_age > @age
  AND doctor_name = @name;

-- Manejo de into
-- Mostrar todos los pacientes (nombres, aplellidos, genero y el peso)

--into genera una nueva tabla a partir de otra
SELECT patient_name, patient_lastname, patient_gender, patient_weight
INTO patients_report
FROM patients;

SELECT *
FROM patients_report

--creamos un pk a la tabla recien creada y con la info de la tabla a crear no la crea vacia
DROP TABLE IF EXISTS patients_report
SELECT IDENTITY(INTEGER, 1, 1) AS patient_id,
       patient_name,
       patient_lastname,
       patient_gender,
       patient_weight
INTO patients_report
FROM dbo.patients

--Guardamos la respuesta en una variable
--determinar cuantos registro tiene la tabla patients_report

DECLARE @response INTEGER = 0;

SELECT @response = COUNT(patient_id)
FROM patients_report;

SELECT @response

-- manejo if/else
-- determinar si estamos en un dia laborable o estamos en fin de semana

DECLARE @diadelasemana VARCHAR(12) = '';

SELECT DATENAME(WEEKDAY, GETDATE());

IF @diadelasemana IN ('Sabado','Domingo')
  SELECT 'Fin de la semana';
ELSE
  SELECT 'Dia laboral';

--si el promedio de las edades es par
--por verdad mostrar todos los doctores
--caso contrario mostrar un mensaje igual a 'Se require contratar mas doctores'

DECLARE @promedioedades INTEGER = 0;

SELECT @promedioedades = AVG(doctor_age)
FROM doctors

IF @promedioedades % 2 = 2
  SELECT * FROM doctors
ELSE
  SELECT 'Se requiere contratar mas doctores' AS resultado;

-- Manejo WHEN/CASE

SELECT pa.patient_name,
       pa.patient_lastname,
       patient_gender_c =
         CASE
           WHEN pa.patient_gender = 'm' THEN 'Masculino'
           WHEN pa.patient_gender = 'f' THEN 'Femenino'
           ELSE 'Otro'
           END
FROM patients AS pa;
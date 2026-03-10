CREATE TABLE pedro
(
id         UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL
  CONSTRAINT pedro_pk PRIMARY KEY,
pedro_name VARCHAR(50)
);

INSERT INTO pedro (pedro_name)
VALUES ('Ernesto');

SELECT *
FROM pedro;

-- -----------------------------------------
--Procedimientos almaceados
--crea un spque permita sumar dos numeros
CREATE OR ALTER PROCEDURE sp_suma @num1 INT,
                                  @num2 INT,
                                  @response INT OUTPUT
AS
DECLARE @response INT = 0;
  SET @response = @num2 + @num1;

SELECT @response AS respuesta;

  EXECUTE sp_suma @num1 = 5, @num2 = 5;
  EXECUTE sp_suma 10, 20;

  DROP PROCEDURE sp_suma

  --se requiere determinar cuantos pacientes son mayores de32 años
  CREATE OR ALTER FUNCTION fn_calculate_age(
    @birthday DATE
  )
    RETURNS INT
  AS
  BEGIN

    DECLARE @cant_day INT = DATEDIFF(DAY, @birthday, GETDATE()),
      @respuesta INT = 0;
    SET @respuesta = FLOOR(@cant_day / 365.25)

    RETURN @respuesta;
  END
  EXECUTE sp_calculate_age '1988-12-10';

SELECT *
FROM patients
WHERE dbo.fn_calculate_age(patient_date_of_birth) > 32;

  CREATE OR ALTER PROCEDURE count_patients_32
  AS
  BEGIN
    SELECT COUNT(patient_id) AS cantidades_pacientes
    FROM dbo.patients
    WHERE dbo.fn_calculate_age(patient_date_of_birth) > 32
  END;
    EXECUTE count_patients_32

--determinar cuantos pacientes y doctores estan dentro del rango 21 - 30
    CREATE OR ALTER PROCEDURE count_doctors_patients @age1 INT,
                                                     @age2 INT,
                                                     @doctors INT OUTPUT,
                                                     @patients INT OUTPUT
    AS
    BEGIN
      SET NOCOUNT ON; -- ✅ Buena práctica: evita mensajes de "X filas afectadas"

      SELECT @patients = COUNT(patient_id)
      FROM patients
      WHERE dbo.fn_calculate_age(patient_date_of_birth) BETWEEN @age1 AND @age2;

      SELECT @doctors = COUNT(staff_id)
      FROM dbo.doctors
      WHERE doctor_age BETWEEN @age1 AND @age2;
    END;

    DECLARE
      @doctor_count  INT = 0,
      @patient_count INT = 0;

-- 2. Ejecutar el SP pasando las variables con OUTPUT
      EXECUTE count_doctors_patients
              21,
              30,
              @doctor_count OUTPUT,
              @patient_count OUTPUT;

-- 3. Ver los resultados
    SELECT @doctor_count  AS doctorscount,
           @patient_count AS patientscount;

--Crea un sp que permita insertar datos a la tabla beds
      CREATE PROCEDURE sp_insert_to_beds @number INT,
                                         @location VARCHAR(20),
                                         @ward INT
      AS
      BEGIN
        INSERT INTO beds(bed_number,bed_location,ward_number)
        VALUES (@number,@location,@ward);

        SELECT bed_number, bed_location, ward_number FROM beds;
      END;

-- un sp que llame al sp que inserta datos
        CREATE PROCEDURE sp_call_insert @number INT,
                                        @location VARCHAR(20),
                                        @ward INT
        AS
        BEGIN
          --validaciones
          PRINT 'Gestion actual: ' + CAST(dbo.current_year() AS VARCHAR);
          EXECUTE sp_insert_to_beds @number, @location, @ward
        END;
          --verificando el correcto comportamiento
          EXECUTE sp_call_insert 10, 'cama 10', 1;
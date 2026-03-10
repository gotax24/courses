--crear un trigger que permita mostrar un mensaje cada vez que se inserte un registro en la tabla beds
INSERT INTO dbo.beds(bed_number,bed_location,ward_number)
VALUES (25,'Cama 150',1);

--creando el trigger
CREATE OR ALTER TRIGGER show_message
  ON beds
  AFTER INSERT AS
BEGIN
  DECLARE
    @number INT,
    @location VARCHAR(20)
  SELECT @number = bed_number,
         @location = bed_location
  FROM inserted;

  PRINT 'Data inserte en table BEDS ' + ' numero de cama: ' + CAST(@number AS VARCHAR) + ' ubicacion: ' + @location
END;

  DROP TRIGGER show_message;

  --crear un trigger que valida la edad en base a la fecha de nacimiento
--si la edad es incorrecta generar una exepcion
--caso contrario insertar a la tabla doctors

  INSERT INTO doctors (doctor_name,
                       doctor_lastname,
                       doctor_date_of_birth,
                       doctor_age)
  VALUES ('Pedro',
          'Alarcon',
          '1999-09-30',
          26);

  CREATE OR ALTER TRIGGER tr_validate_correct_age
    ON doctors
    INSTEAD OF INSERT AS
  BEGIN
    DECLARE @validate_age BIT,
      @birthday DATE,
      @age INT;

    SELECT @birthday = doctor_date_of_birth,
           @age = doctor_age
    FROM inserted;

    SET @validate_age = dbo.validate_age(@birthday, @age)

    IF @validate_age = 0
      BEGIN
        RAISERROR (15600, -1, -1, 'La edad a insertada es incorrecta');
      END;
    ELSE
      BEGIN
        INSERT INTO doctors(doctor_name,
                            doctor_lastname,
                            doctor_date_of_birth,
                            doctor_age)
        SELECT ins.doctor_name,
               ins.doctor_lastname,
               ins.doctor_date_of_birth,
               ins.doctor_age
        FROM inserted AS ins;
      END;
  END;

    -- triggre de auditoria
--crea un trigger de auditoria para la tabla beds

--crea la tabla auditoria
    CREATE TABLE audit_beds
    (
    date_action  DATE,
    user_action  VARCHAR(30),
    action       VARCHAR(20),
    bed_number   INT,
    bed_location VARCHAR(20)
    );

    --crea el trigger de auditoria
    CREATE TRIGGER tr_audit_beds
      ON beds
      AFTER DELETE AS
    BEGIN
      DECLARE @action VARCHAR(15) = 'DELETE',
        @number INT,
        @location VARCHAR(20);

      SELECT @number = bed_number,
             @location = bed_location
      FROM beds;

      INSERT INTO audit_beds (date_action,
                              user_action,
                              action,
                              bed_number,
                              bed_location)
      VALUES (GETDATE(),
              SYSTEM_USER,
              @action,
              @number,
              @location);
    END;
GO

-- crea un trigger que no permita adicionales y/o
-- modificaciones de la tabla beds en fines de semana

SELECT DATENAME(WEEKDAY, CURRENT_TIMESTAMP);

CREATE TRIGGER tr_the_weekend
  ON beds
  FOR INSERT, UPDATE, DELETE AS --esto es un after pero tambien puede ser un before
BEGIN
  DECLARE @day VARCHAR(12) = DATENAME(WEEKDAY, CURRENT_TIMESTAMP);

  IF @day IN ('Friday','Saturday','Sunday')
    BEGIN
      RAISERROR ('No se permite inserciones, modificaciones y eliminicaciones en fines de semana', 16, 1)
    END;
  RETURN;
END;
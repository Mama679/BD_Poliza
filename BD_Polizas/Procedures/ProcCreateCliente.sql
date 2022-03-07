CREATE PROCEDURE [dbo].[ProcInsertarCliente]
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60)

AS
	IF LTRIM(@identificacion) <> '' AND LTRIM(@nombre_cliente) <> '' AND LTRIM(@apellido_cliente) <> '' AND LTRIM(@direccion) <> '' AND LTRIM(@ciudad) <> ''  
	BEGIN
		BEGIN TRANSACTION
			BEGIN TRY
				DECLARE @clientId INT;

				INSERT INTO Clientes
					(identificacion,nombres_cliente,apellidos_cliente,fecha_nacimiento,telefono,direccion,ciudad)
				VALUES
					(@identificacion,@nombre_cliente,@apellido_cliente,@fecha_nacimiento,@telefono,@direccion,@ciudad);

				COMMIT TRANSACTION

				SET @clientId = SCOPE_IDENTITY();

				SELECT CAST(1 AS BIT) AS 'state', @clientId AS 'response';
			END TRY
			BEGIN CATCH
				ROLLBACK TRANSACTION
				SELECT CAST(0 AS BIT) AS 'state', ERROR_MESSAGE() AS 'response';
			END CATCH
	END
	ELSE
		SELECT CAST(0 AS BIT) AS 'state', 'Missing data' AS 'response';
		



CREATE PROCEDURE [dbo].[ProcActualizarClient]
	@id_cliente INT,
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60)

AS
	IF @id_cliente > 0
	BEGIN
		BEGIN TRANSACTION
		BEGIN TRY
			UPDATE Clientes
			SET
				identificacion = @identificacion,nombres_cliente = @nombre_cliente, apellidos_cliente = @apellido_cliente,fecha_nacimiento = @fecha_nacimiento,
				telefono = @telefono, direccion = @direccion, ciudad = @ciudad
			WHERE Id_cliente = @id_cliente;

			COMMIT TRANSACTION
			SELECT CAST(1 AS BIT) AS 'state', 'Client update' AS 'response';
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT CAST(0 AS BIT) AS 'state', ERROR_MESSAGE() AS 'response';
		END CATCH
	END
	ELSE
		SELECT CAST(0 AS BIT) AS 'state', 'Missing data' AS 'response';
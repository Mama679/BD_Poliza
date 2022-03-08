CREATE PROCEDURE [dbo].[ProcActualizarClient]
	@id_cliente INT,
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60),
	@rows int output

AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Clientes
			SET
				identificacion = @identificacion,nombres_cliente = @nombre_cliente, apellidos_cliente = @apellido_cliente,fecha_nacimiento = @fecha_nacimiento,
				telefono = @telefono, direccion = @direccion, ciudad = @ciudad
			WHERE Id_cliente = @id_cliente;

			SELECT @rows = @@ROWCOUNT;
	END
	
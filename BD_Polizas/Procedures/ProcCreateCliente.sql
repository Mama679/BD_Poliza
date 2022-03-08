CREATE PROCEDURE [dbo].[ProcInsertarCliente]
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60),
	@id int output

AS
	
	BEGIN
		SET NOCOUNT ON;

		INSERT INTO Clientes
					(identificacion,nombres_cliente,apellidos_cliente,fecha_nacimiento,telefono,direccion,ciudad)
				VALUES
					(@identificacion,@nombre_cliente,@apellido_cliente,@fecha_nacimiento,@telefono,@direccion,@ciudad);
			SELECT @id = SCOPE_IDENTITY();
		END
	
		



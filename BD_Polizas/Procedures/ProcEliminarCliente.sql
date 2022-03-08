CREATE PROCEDURE [dbo].[ProcEliminarCliente]
	@id_cliente INT,
	@rows int output

AS
	BEGIN
		SET NOCOUNT ON;
		
			DELETE FROM  Clientes			
			WHERE Id_cliente = @id_cliente;

			SELECT @rows = @@ROWCOUNT;
	END
	

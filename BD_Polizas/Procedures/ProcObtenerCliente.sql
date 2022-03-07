CREATE PROCEDURE [dbo].[ProcObtenerCliente]
	@clientId INT
AS
	SELECT
		*
	FROM
		Clientes
	WHERE
		Id_cliente = @clientId;
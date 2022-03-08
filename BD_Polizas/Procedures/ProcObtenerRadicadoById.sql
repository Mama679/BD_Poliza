CREATE PROCEDURE [dbo].[ProcObtenerRadicadoById]
	@radId int
AS
SELECT
		*
	FROM
		Radicados
	WHERE
		Id_Radicado = @radId;
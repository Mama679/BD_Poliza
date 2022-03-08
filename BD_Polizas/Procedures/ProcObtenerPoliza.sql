CREATE PROCEDURE [dbo].[ProcObtenerPoliza]
	@polizaId INT
AS
	SELECT
		*
	FROM
		Polizas
	WHERE
		Id_poliza = @polizaId;

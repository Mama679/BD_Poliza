CREATE PROCEDURE [dbo].[ProcObtenerXNum]
	@numPoliza nvarchar(10)
AS
SELECT
		*
	FROM
		Radicados
	WHERE
		num_poliza = @numPoliza;
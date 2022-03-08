CREATE PROCEDURE [dbo].[ProcObtenerAuto]
	@autoId INT
AS
	SELECT
		*
	FROM
		Autos
	WHERE
		Id_auto = @autoId;
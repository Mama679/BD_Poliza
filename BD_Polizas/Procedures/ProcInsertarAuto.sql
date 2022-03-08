CREATE PROCEDURE [dbo].[ProcInsertarAuto]
	@placa nvarchar(20),
	@modelo nvarchar(50),
	@ciudad_placa nvarchar(50),
	@inspeccion bit,
	@cliente_id int,
	@id int output
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Autos
		(placa,modelo,ciudad_placa,inspeccion,cliente_id)
	VALUES
		(@placa,@modelo,@ciudad_placa,@inspeccion,@cliente_id);
	SELECT @id = SCOPE_IDENTITY();
END
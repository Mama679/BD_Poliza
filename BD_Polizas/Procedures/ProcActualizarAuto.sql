CREATE PROCEDURE [dbo].[ProcActualizarAuto]
	@placa nvarchar(20),
	@modelo nvarchar(50),
	@ciudad_placa nvarchar(50),
	@inspeccion bit,
	@cliente_id int,
	@id_auto int,
	@rows int output
AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Autos
			SET
				placa = @placa,modelo = @modelo, ciudad_placa = @ciudad_placa,inspeccion= @inspeccion,cliente_id = @cliente_id
			WHERE Id_auto = @id_auto;

			SELECT @rows = @@ROWCOUNT;
	END
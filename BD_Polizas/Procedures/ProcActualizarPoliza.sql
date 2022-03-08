CREATE PROCEDURE [dbo].[ProcActualizarPoliza]
	@nombre_poliza nvarchar(50),
	@cobertura nvarchar(10),
	@valo_maximo decimal(10,2),
	@activa bit,
	@id_poliza int,
	@rows int output
AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Polizas
			SET
				nombre_poliza = @nombre_poliza, cobertura = @cobertura, @valo_maximo =@valo_maximo, activa = @activa 
			WHERE Id_poliza = @id_poliza;

			SELECT @rows = @@ROWCOUNT;
	END
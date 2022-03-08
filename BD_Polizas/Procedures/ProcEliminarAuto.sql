CREATE PROCEDURE [dbo].[ProcEliminarAuto]
	@idauto INT,
	@rows int output

AS
	BEGIN
		SET NOCOUNT ON;
		
			DELETE FROM  Autos			
			WHERE Id_auto = @idauto;

			SELECT @rows = @@ROWCOUNT;
	END
	
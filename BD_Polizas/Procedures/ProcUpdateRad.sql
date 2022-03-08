CREATE PROCEDURE [dbo].[ProcUpdateRad]
	@num_poliza nvarchar(10),
	@poliza_id int,
	@fecha_inicio date,
	@fecha_fin date,
	@fecha_rad date,
	@auto_id int,
	@id_rad int,
	@rows int output
AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Radicados
			SET 
				num_poliza = @num_poliza,poliza_id = @poliza_id, fecha_rad = @fecha_rad,fecha_inicio = @fecha_inicio,fecha_fin=@fecha_fin,auto_id=@auto_id
			WHERE Id_Radicado = @id_rad;

			SELECT @rows = @@ROWCOUNT;
	END
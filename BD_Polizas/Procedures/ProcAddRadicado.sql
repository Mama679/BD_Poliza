CREATE PROCEDURE [dbo].[ProcAddRadicado]
	@num_poliza nvarchar(10),
	@poliza_id int,
	@fecha_inicio date,
	@fecha_fin date,
	@auto_id int,
	@id int output
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Radicados
		(num_poliza,poliza_id,fecha_rad,fecha_inicio,fecha_fin,auto_id)
	VALUES
		(@num_poliza,@poliza_id,GETDATE(),@fecha_inicio,@fecha_fin,@auto_id);

	SELECT @id = SCOPE_IDENTITY();
END

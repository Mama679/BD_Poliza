CREATE PROCEDURE [dbo].[ProcInsertarPoliza]
	@nombre_poliza nvarchar(50),
	@cobertura nvarchar(10),
	@valo_maximo decimal(10,2),
	@activa bit,
	@id int output
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Polizas
		(nombre_poliza,cobertura,valor_maximo,activa)
	VALUES
		(@nombre_poliza,@cobertura,@valo_maximo,@activa);
	SELECT @id = SCOPE_IDENTITY();
END

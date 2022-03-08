/*
Script de implementación para BD_Polizas

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BD_Polizas"
:setvar DefaultFilePrefix "BD_Polizas"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creando Procedimiento [dbo].[ProcAddRadicado]...';


GO
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcInsertarPoliza]...';


GO
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerRadicadoById]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerRadicadoById]
	@radId int
AS
SELECT
		*
	FROM
		Radicados
	WHERE
		Id_Radicado = @radId;
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerRadicados]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerRadicados]
As
	SELECT
		*
	FROM
		Radicados;
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerXNum]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerXNum]
	@numPoliza nvarchar(10)
AS
SELECT
		*
	FROM
		Radicados
	WHERE
		num_poliza = @numPoliza;
GO
PRINT N'Creando Procedimiento [dbo].[ProcUpdateRad]...';


GO
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
GO
PRINT N'Actualización completada.';


GO

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
PRINT N'Modificando Procedimiento [dbo].[ProcActualizarAuto]...';


GO
ALTER PROCEDURE [dbo].[ProcActualizarAuto]
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcActualizarPoliza]...';


GO
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcGetPolizas]...';


GO
CREATE PROCEDURE [dbo].[ProcGetPolizas]
AS
	SELECT
		*
	FROM
		Polizas;
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerPoliza]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerPoliza]
	@polizaId INT
AS
	SELECT
		*
	FROM
		Polizas
	WHERE
		Id_poliza = @polizaId;
GO
PRINT N'Actualización completada.';


GO

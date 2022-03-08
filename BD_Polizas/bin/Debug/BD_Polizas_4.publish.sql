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
PRINT N'Creando Procedimiento [dbo].[ProcActualizarAuto]...';


GO
CREATE PROCEDURE [dbo].[ProcActualizarAuto]
	@placa nvarchar(20),
	@modelo nvarchar(50),
	@ciudad_placa nvarchar(50),
	@inspeccion bit,
	@cliente_id int,
	@id_cliente int,
	@rows int output
AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Autos
			SET
				@placa = @placa,modelo = @modelo, ciudad_placa = @ciudad_placa,inspeccion= @inspeccion
			WHERE @cliente_id = @id_cliente;

			SELECT @rows = @@ROWCOUNT;
	END
GO
PRINT N'Creando Procedimiento [dbo].[ProcEliminarAuto]...';


GO
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcInsertarAuto]...';


GO
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
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerAuto]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerAuto]
	@autoId INT
AS
	SELECT
		*
	FROM
		Autos
	WHERE
		Id_auto = @autoId;
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerAutos]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerAutos]
AS
	SELECT
		*
	FROM
		Autos;
GO
PRINT N'Actualización completada.';


GO

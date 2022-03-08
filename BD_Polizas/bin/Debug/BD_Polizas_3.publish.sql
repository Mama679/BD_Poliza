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
PRINT N'Modificando Procedimiento [dbo].[ProcActualizarClient]...';


GO
ALTER PROCEDURE [dbo].[ProcActualizarClient]
	@id_cliente INT,
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60),
	@rows int output

AS
	BEGIN
		SET NOCOUNT ON;
		
			UPDATE Clientes
			SET
				identificacion = @identificacion,nombres_cliente = @nombre_cliente, apellidos_cliente = @apellido_cliente,fecha_nacimiento = @fecha_nacimiento,
				telefono = @telefono, direccion = @direccion, ciudad = @ciudad
			WHERE Id_cliente = @id_cliente;

			SELECT @rows = @@ROWCOUNT;
	END
GO
PRINT N'Actualización completada.';


GO

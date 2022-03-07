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
/*
Se está quitando la columna [dbo].[Radicados].[clienteId]; puede que se pierdan datos.
*/

IF EXISTS (select top 1 1 from [dbo].[Radicados])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'Quitando Clave externa [dbo].[FK_Radicados_RCliente]...';


GO
ALTER TABLE [dbo].[Radicados] DROP CONSTRAINT [FK_Radicados_RCliente];


GO
PRINT N'Modificando Tabla [dbo].[Autos]...';


GO
ALTER TABLE [dbo].[Autos]
    ADD [cliente_id] INT NULL;


GO
PRINT N'Modificando Tabla [dbo].[Radicados]...';


GO
ALTER TABLE [dbo].[Radicados] DROP COLUMN [clienteId];


GO
PRINT N'Creando Clave externa [dbo].[FK_Autos_ToCliente]...';


GO
ALTER TABLE [dbo].[Autos] WITH NOCHECK
    ADD CONSTRAINT [FK_Autos_ToCliente] FOREIGN KEY ([cliente_id]) REFERENCES [dbo].[Clientes] ([Id_cliente]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Autos] WITH CHECK CHECK CONSTRAINT [FK_Autos_ToCliente];


GO
PRINT N'Actualización completada.';


GO

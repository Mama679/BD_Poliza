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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave d071df30-06ba-4de2-8e53-5351c3b98053 se ha omitido; no se cambiará el nombre del elemento [dbo].[Clientes].[Id] (SqlSimpleColumn) a Id_cliente';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 136dcf1a-eb60-4ddb-a64f-f98c8c3e0c2a se ha omitido; no se cambiará el nombre del elemento [dbo].[Clientes].[nombre_cliente] (SqlSimpleColumn) a nombres_cliente';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave b889e437-78db-4a3c-a052-323bb39ca758 se ha omitido; no se cambiará el nombre del elemento [dbo].[Clientes].[apellido_cliente] (SqlSimpleColumn) a apellidos_cliente';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 1a0bb104-a6c4-4587-8795-8d8ae170c683 se ha omitido; no se cambiará el nombre del elemento [dbo].[Auto].[Id] (SqlSimpleColumn) a Id_auto';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave f4201dbd-88a0-4a9c-9f25-9a50e8ab0cb3 se ha omitido; no se cambiará el nombre del elemento [dbo].[Polizas].[Id] (SqlSimpleColumn) a Id_poliza';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 25a4ec0d-d835-4fb5-b623-1ec5183c8249 se ha omitido; no se cambiará el nombre del elemento [dbo].[PropietariosAutos].[Id] (SqlSimpleColumn) a Id_rel';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 253093e2-7a08-4dee-b999-8a6733d62fc3 se ha omitido; no se cambiará el nombre del elemento [dbo].[FK_PropietariosAutos_ToTable] (SqlForeignKeyConstraint) a [FK_PropietariosAutos_Clientes]';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave b645ee9d-0c0a-4a2a-95cd-9db07993a2da se ha omitido; no se cambiará el nombre del elemento [dbo].[PropietariosAutos].[id_auto] (SqlSimpleColumn) a auto_id';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 601df743-7678-4c9c-a890-32ba8e0e1e21 se ha omitido; no se cambiará el nombre del elemento [dbo].[Radicados].[Id] (SqlSimpleColumn) a Id_Radicado';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 0da4cfc3-0553-473b-9c9d-604178669843 se ha omitido; no se cambiará el nombre del elemento [dbo].[Radicados].[fecha_poliza] (SqlSimpleColumn) a fecha_rad';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 99a67e36-f229-4ae8-8683-2ddac019781f se ha omitido; no se cambiará el nombre del elemento [dbo].[Radicados].[fecha] (SqlSimpleColumn) a fecha_inicio';


GO
PRINT N'Creando Tabla [dbo].[Autos]...';


GO
CREATE TABLE [dbo].[Autos] (
    [Id_auto]      INT           IDENTITY (1, 1) NOT NULL,
    [placa]        NVARCHAR (10) NOT NULL,
    [modelo]       NVARCHAR (6)  NOT NULL,
    [ciudad_placa] NVARCHAR (50) NULL,
    [inspeccion]   BIT           NULL,
    PRIMARY KEY CLUSTERED ([Id_auto] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Clientes]...';


GO
CREATE TABLE [dbo].[Clientes] (
    [Id_cliente]        INT           IDENTITY (1, 1) NOT NULL,
    [identificacion]    VARCHAR (20)  NOT NULL,
    [nombres_cliente]   VARCHAR (50)  NOT NULL,
    [apellidos_cliente] VARCHAR (50)  NOT NULL,
    [fecha_nacimiento]  DATE          NULL,
    [telefono]          VARCHAR (20)  NULL,
    [direccion]         VARCHAR (150) NOT NULL,
    [ciudad]            VARCHAR (60)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_cliente] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Polizas]...';


GO
CREATE TABLE [dbo].[Polizas] (
    [Id_poliza]     INT             IDENTITY (1, 1) NOT NULL,
    [nombre_poliza] NVARCHAR (50)   NOT NULL,
    [cobertura]     NVARCHAR (10)   NOT NULL,
    [valor_maximo]  DECIMAL (10, 2) NOT NULL,
    [activa]        BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_poliza] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PropietariosAutos]...';


GO
CREATE TABLE [dbo].[PropietariosAutos] (
    [Id_rel]     INT IDENTITY (1, 1) NOT NULL,
    [cliente_id] INT NOT NULL,
    [autoId]     INT NULL,
    PRIMARY KEY CLUSTERED ([Id_rel] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Radicados]...';


GO
CREATE TABLE [dbo].[Radicados] (
    [Id_Radicado]  INT           IDENTITY (1, 1) NOT NULL,
    [num_poliza]   NVARCHAR (10) NOT NULL,
    [clienteId]    INT           NULL,
    [poliza_id]    INT           NULL,
    [fecha_rad]    DATE          NULL,
    [fecha_inicio] DATE          NULL,
    [fecha_fin]    DATE          NULL,
    [auto_id]      INT           NULL,
    PRIMARY KEY CLUSTERED ([Id_Radicado] ASC)
);


GO
PRINT N'Creando Clave externa [dbo].[FK_Clientes]...';


GO
ALTER TABLE [dbo].[PropietariosAutos] WITH NOCHECK
    ADD CONSTRAINT [FK_Clientes] FOREIGN KEY ([cliente_id]) REFERENCES [dbo].[Clientes] ([Id_cliente]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Autos]...';


GO
ALTER TABLE [dbo].[PropietariosAutos] WITH NOCHECK
    ADD CONSTRAINT [FK_Autos] FOREIGN KEY ([autoId]) REFERENCES [dbo].[Autos] ([Id_auto]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Radicados_RPoliza]...';


GO
ALTER TABLE [dbo].[Radicados] WITH NOCHECK
    ADD CONSTRAINT [FK_Radicados_RPoliza] FOREIGN KEY ([poliza_id]) REFERENCES [dbo].[Polizas] ([Id_poliza]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Radicados_RCliente]...';


GO
ALTER TABLE [dbo].[Radicados] WITH NOCHECK
    ADD CONSTRAINT [FK_Radicados_RCliente] FOREIGN KEY ([clienteId]) REFERENCES [dbo].[Clientes] ([Id_cliente]);


GO
PRINT N'Creando Clave externa [dbo].[FK_Radicados_RAuto]...';


GO
ALTER TABLE [dbo].[Radicados] WITH NOCHECK
    ADD CONSTRAINT [FK_Radicados_RAuto] FOREIGN KEY ([auto_id]) REFERENCES [dbo].[Autos] ([Id_auto]);


GO
PRINT N'Creando Procedimiento [dbo].[ProcActualizarClient]...';


GO
CREATE PROCEDURE [dbo].[ProcActualizarClient]
	@id_cliente INT,
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60)

AS
	IF @id_cliente > 0
	BEGIN
		BEGIN TRANSACTION
		BEGIN TRY
			UPDATE Clientes
			SET
				identificacion = @identificacion,nombres_cliente = @nombre_cliente, apellidos_cliente = @apellido_cliente,fecha_nacimiento = @fecha_nacimiento,
				telefono = @telefono, direccion = @direccion, ciudad = @ciudad
			WHERE Id_cliente = @id_cliente;

			COMMIT TRANSACTION
			SELECT CAST(1 AS BIT) AS 'state', 'Client update' AS 'response';
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT CAST(0 AS BIT) AS 'state', ERROR_MESSAGE() AS 'response';
		END CATCH
	END
	ELSE
		SELECT CAST(0 AS BIT) AS 'state', 'Missing data' AS 'response';
GO
PRINT N'Creando Procedimiento [dbo].[ProcInsertarCliente]...';


GO
CREATE PROCEDURE [dbo].[ProcInsertarCliente]
	@identificacion varchar(20),
	@nombre_cliente varchar(50),
	@apellido_cliente varchar(50),
	@fecha_nacimiento date,
	@telefono varchar(20),
	@direccion varchar(150),
	@ciudad varchar(60)

AS
	IF LTRIM(@identificacion) <> '' AND LTRIM(@nombre_cliente) <> '' AND LTRIM(@apellido_cliente) <> '' AND LTRIM(@direccion) <> '' AND LTRIM(@ciudad) <> ''  
	BEGIN
		BEGIN TRANSACTION
			BEGIN TRY
				DECLARE @clientId INT;

				INSERT INTO Clientes
					(identificacion,nombres_cliente,apellidos_cliente,fecha_nacimiento,telefono,direccion,ciudad)
				VALUES
					(@identificacion,@nombre_cliente,@apellido_cliente,@fecha_nacimiento,@telefono,@direccion,@ciudad);

				COMMIT TRANSACTION

				SET @clientId = SCOPE_IDENTITY();

				SELECT CAST(1 AS BIT) AS 'state', @clientId AS 'response';
			END TRY
			BEGIN CATCH
				ROLLBACK TRANSACTION
				SELECT CAST(0 AS BIT) AS 'state', ERROR_MESSAGE() AS 'response';
			END CATCH
	END
	ELSE
		SELECT CAST(0 AS BIT) AS 'state', 'Missing data' AS 'response';
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerCliente]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerCliente]
	@clientId INT
AS
	SELECT
		*
	FROM
		Clientes
	WHERE
		Id_cliente = @clientId;
GO
PRINT N'Creando Procedimiento [dbo].[ProcObtenerClientes]...';


GO
CREATE PROCEDURE [dbo].[ProcObtenerClientes]
AS
	SELECT
		*
	FROM
		Clientes;
GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd071df30-06ba-4de2-8e53-5351c3b98053')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d071df30-06ba-4de2-8e53-5351c3b98053')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '136dcf1a-eb60-4ddb-a64f-f98c8c3e0c2a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('136dcf1a-eb60-4ddb-a64f-f98c8c3e0c2a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b889e437-78db-4a3c-a052-323bb39ca758')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b889e437-78db-4a3c-a052-323bb39ca758')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1a0bb104-a6c4-4587-8795-8d8ae170c683')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1a0bb104-a6c4-4587-8795-8d8ae170c683')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f4201dbd-88a0-4a9c-9f25-9a50e8ab0cb3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f4201dbd-88a0-4a9c-9f25-9a50e8ab0cb3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '25a4ec0d-d835-4fb5-b623-1ec5183c8249')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('25a4ec0d-d835-4fb5-b623-1ec5183c8249')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '253093e2-7a08-4dee-b999-8a6733d62fc3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('253093e2-7a08-4dee-b999-8a6733d62fc3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b645ee9d-0c0a-4a2a-95cd-9db07993a2da')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b645ee9d-0c0a-4a2a-95cd-9db07993a2da')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '601df743-7678-4c9c-a890-32ba8e0e1e21')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('601df743-7678-4c9c-a890-32ba8e0e1e21')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0da4cfc3-0553-473b-9c9d-604178669843')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0da4cfc3-0553-473b-9c9d-604178669843')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '99a67e36-f229-4ae8-8683-2ddac019781f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('99a67e36-f229-4ae8-8683-2ddac019781f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c8ec71d3-c810-471b-87f0-e1f705948e4a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c8ec71d3-c810-471b-87f0-e1f705948e4a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '07f9d0a9-2f95-4b38-9f28-6c5f4adb2e4a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('07f9d0a9-2f95-4b38-9f28-6c5f4adb2e4a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '36aee4fc-175c-4607-af61-8343bf396598')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('36aee4fc-175c-4607-af61-8343bf396598')

GO

GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[PropietariosAutos] WITH CHECK CHECK CONSTRAINT [FK_Clientes];

ALTER TABLE [dbo].[PropietariosAutos] WITH CHECK CHECK CONSTRAINT [FK_Autos];

ALTER TABLE [dbo].[Radicados] WITH CHECK CHECK CONSTRAINT [FK_Radicados_RPoliza];

ALTER TABLE [dbo].[Radicados] WITH CHECK CHECK CONSTRAINT [FK_Radicados_RCliente];

ALTER TABLE [dbo].[Radicados] WITH CHECK CHECK CONSTRAINT [FK_Radicados_RAuto];


GO
PRINT N'Actualización completada.';


GO

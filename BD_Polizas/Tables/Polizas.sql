CREATE TABLE [dbo].[Polizas]
(
	[Id_poliza] INT NOT NULL PRIMARY KEY IDENTITY, 
    [nombre_poliza] NVARCHAR(50) NOT NULL, 
    [cobertura] NVARCHAR(10) NOT NULL, 
    [valor_maximo] DECIMAL(10, 2) NOT NULL, 
    [activa] BIT NOT NULL
)

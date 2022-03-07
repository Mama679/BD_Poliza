CREATE TABLE [dbo].[Autos]
(
	[Id_auto] INT NOT NULL PRIMARY KEY IDENTITY, 
    [placa] NVARCHAR(10) NOT NULL, 
    [modelo] NVARCHAR(6) NOT NULL, 
    [ciudad_placa] NVARCHAR(50) NULL, 
    [inspeccion] BIT NULL, 
    [cliente_id] INT NULL, 
    CONSTRAINT FK_Autos_ToCliente FOREIGN KEY (cliente_id) REFERENCES Clientes(Id_cliente)
)

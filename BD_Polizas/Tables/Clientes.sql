CREATE TABLE [dbo].[Clientes]
(
	[Id_cliente] INT NOT NULL PRIMARY KEY IDENTITY, 
    [identificacion] VARCHAR(20) NOT NULL, 
    [nombres_cliente] VARCHAR(50) NOT NULL, 
    [apellidos_cliente] VARCHAR(50) NOT NULL, 
    [fecha_nacimiento] DATE NULL, 
    [telefono] VARCHAR(20) NULL, 
    [direccion] VARCHAR(150) NOT NULL, 
    [ciudad] VARCHAR(60) NOT NULL
)

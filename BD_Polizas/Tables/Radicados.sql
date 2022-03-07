CREATE TABLE [dbo].[Radicados]
(
	[Id_Radicado] INT NOT NULL PRIMARY KEY IDENTITY, 
    [num_poliza] NVARCHAR(10) NOT NULL, 
    [poliza_id] INT NULL, 
    [fecha_rad] DATE NULL, 
    [fecha_inicio] DATE NULL, 
    [fecha_fin] DATE NULL, 
    [auto_id] INT NULL, 
    CONSTRAINT [FK_Radicados_RPoliza] FOREIGN KEY (poliza_id) REFERENCES Polizas(Id_poliza), 
    CONSTRAINT [FK_Radicados_RAuto] FOREIGN KEY (auto_id) REFERENCES Autos(Id_auto)
)

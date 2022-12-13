-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Property]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Property' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Property]
(
 [propertyID] int IDENTITY(1,1) PRIMARY KEY ,
 [nrUnits]    int NOT NULL ,
 [adressID]   int NOT NULL ,
 [ownerID]    int NOT NULL ,
 [managerID]  int NOT NULL ,


 CONSTRAINT [FK_1] FOREIGN KEY ([managerID])  REFERENCES [group7].[Manager]([managerID]),
 CONSTRAINT [FK_2] FOREIGN KEY ([ownerID])  REFERENCES [group7].[Owner]([ownerID]),
 CONSTRAINT [FK_3] FOREIGN KEY ([adressID])  REFERENCES [group7].[Adress]([adressID])
);
GO
-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Unit]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Unit' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Unit]
(
 [unitID]       int IDENTITY(1,1) PRIMARY KEY ,
 [squareMeters] int NOT NULL ,
 [propertyID]   int NOT NULL ,
 [nrRooms]      int NOT NULL ,


 CONSTRAINT [FK_8] FOREIGN KEY ([propertyID])  REFERENCES [group7].[Property]([propertyID])
);
GO
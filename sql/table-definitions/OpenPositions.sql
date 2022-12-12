-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v23 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO
-- ************************************** [OpenPosition]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='OpenPosition' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[OpenPosition]
(
 [openPositionID] int IDENTITY(1,1) PRIMARY KEY ,
 [propertyID]     int NOT NULL ,
 [tenantID]       int NOT NULL ,
 [amount]         money NOT NULL ,
 [description]    varchar(255) NOT NULL,
 [date]           date NOT NULL,


 CONSTRAINT [FK_17] FOREIGN KEY ([tenantID])  REFERENCES [group7].[Tenant]([tenantID]),
 CONSTRAINT [FK_17_1] FOREIGN KEY ([propertyID])  REFERENCES [group7].[Property]([propertyID])

);
GO


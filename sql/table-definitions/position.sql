-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Position]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Position' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Position]
(
 [positionID]       int IDENTITY(1,1) PRIMARY KEY ,
 [positionName]     varchar(255) NOT NULL ,
 [allocationTypeID] int NOT NULL ,


 CONSTRAINT [FK_12] FOREIGN KEY ([allocationTypeID])  REFERENCES [group7].[allocationType]([allocationTypeID])
);
GO
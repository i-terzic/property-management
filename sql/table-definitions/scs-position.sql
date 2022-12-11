-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [scsPosition]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='scsPosition' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[scsPosition]
(
 [scsPositionID] int IDENTITY(1,1) PRIMARY KEY ,
 [amount]        int NOT NULL ,
 [scsID]         int NOT NULL ,
 [positionID]    int NOT NULL ,


 CONSTRAINT [FK_11] FOREIGN KEY ([positionID])  REFERENCES [group7].[Position]([positionID]),
 CONSTRAINT [FK_14_1] FOREIGN KEY ([scsID])  REFERENCES [group7].[SCS]([scsID])
);
GO
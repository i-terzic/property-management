-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [SCS]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='SCS' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[SCS]
(
 [scsID]         int NOT NULL ,
 [startInterval] datetime NOT NULL ,
 [tenantID]      int NOT NULL ,
 [endInterval]   datetime NOT NULL ,


 CONSTRAINT [PK_11] PRIMARY KEY CLUSTERED ([scsID] ASC),
 CONSTRAINT [FK_9] FOREIGN KEY ([tenantID])  REFERENCES [group7].[Tenant]([tenantID])
);
GO
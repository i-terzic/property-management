-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v11 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Stage]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Stage' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Stage]
(
 [stageId]   int NOT NULL ,
 [line]      text NOT NULL ,
 [timestamp] datetime NOT NULL ,


 CONSTRAINT [PK_12] PRIMARY KEY CLUSTERED ([stageId] ASC)
);
GO
-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Manager]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Manager' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Manager]
(
 [managerID] int IDENTITY(1,1) PRIMARY KEY ,
 [firstName] varchar(64) NOT NULL ,
 [lastName]  varchar(64) NOT NULL ,


);
GO
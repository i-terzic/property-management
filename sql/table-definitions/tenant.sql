-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Tenant]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Tenant' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Tenant]
(
 [tenantID]    int IDENTITY(1,1) PRIMARY KEY ,
 [firstName]   varchar(64) NOT NULL ,
 [lastName]    varchar(64) NOT NULL ,
 [bankAccount] varchar(255) NOT NULL ,
);
GO
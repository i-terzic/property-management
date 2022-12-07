-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Adress]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Adress' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Adress]
(
 [adressID]   int NOT NULL ,
 [country]    varchar(64) NOT NULL ,
 [city]       varchar(64) NOT NULL ,
 [postalCode] int NOT NULL ,
 [street]     varchar(64) NOT NULL ,
 [houseNr]    int NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([adressID] ASC)
);
GO
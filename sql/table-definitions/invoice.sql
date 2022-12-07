-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Invoice]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Invoice' AND t.schema_id IN ( SELECT schema_id  FROM sys.schemas s WHERE s.name='group7'))
CREATE TABLE [group7].[Invoice]
(
 [invoiceID]   int NOT NULL ,
 [creditor]    varchar(64) NOT NULL ,
 [propertyID]  int NOT NULL ,
 [amount]      int NOT NULL ,
 [invoiceType] varchar(64) NOT NULL ,
 [comment]     varchar(255) NOT NULL ,


 CONSTRAINT [PK_4] PRIMARY KEY CLUSTERED ([invoiceID] ASC),
 CONSTRAINT [FK_4] FOREIGN KEY ([propertyID])  REFERENCES [group7].[Property]([propertyID])
);
GO
-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


IF NOT EXISTS (SELECT * FROM sys.schemas s WHERE s.name='group7')
EXEC ('CREATE SCHEMA [group7]');
GO

-- ************************************** [Position]
IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Position')
CREATE TABLE [Position]
(
 [positionID]       int NOT NULL ,
 [positionName]     varchar(255) NOT NULL ,
 [allocationTypeID] int NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([positionID] ASC),
 CONSTRAINT [FK_12] FOREIGN KEY ([allocationTypeID])  REFERENCES [allocationType]([allocationTypeID])
);
GO


CREATE NONCLUSTERED INDEX [FK_2] ON [Position] 
 (
  [allocationTypeID] ASC
 )

GO

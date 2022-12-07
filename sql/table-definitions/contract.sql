-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


-- ************************************** [Contract]
CREATE TABLE [Contract]
(
 [contractID]  int NOT NULL ,
 [nrResidents] int NOT NULL ,
 [tenantID]    int NOT NULL ,
 [unitID]      int NOT NULL ,
 [ownerID]     int NOT NULL ,
 [warmRent]    int NOT NULL ,
 [startDate]   datetime NOT NULL ,
 [endDate]     datetime NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([contractID] ASC),
 CONSTRAINT [FK_5] FOREIGN KEY ([ownerID])  REFERENCES [Owner]([ownerID]),
 CONSTRAINT [FK_6] FOREIGN KEY ([unitID])  REFERENCES [Unit]([unitID]),
 CONSTRAINT [FK_7] FOREIGN KEY ([tenantID])  REFERENCES [Tenant]([tenantID])
);
GO


CREATE NONCLUSTERED INDEX [FK_2] ON [Contract] 
 (
  [ownerID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [FK_3] ON [Contract] 
 (
  [unitID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [FK_4] ON [Contract] 
 (
  [tenantID] ASC
 )

GO

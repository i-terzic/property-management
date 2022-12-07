-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


-- ************************************** [scsPosition]
CREATE TABLE [scsPosition]
(
 [scsPositionID] int NOT NULL ,
 [amount]        int NOT NULL ,
 [scsID]         int NOT NULL ,
 [positionID]    int NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([scsPositionID] ASC),
 CONSTRAINT [FK_11] FOREIGN KEY ([positionID])  REFERENCES [Position]([positionID]),
 CONSTRAINT [FK_14_1] FOREIGN KEY ([scsID])  REFERENCES [SCS]([scsID])
);
GO


CREATE NONCLUSTERED INDEX [FK_2] ON [scsPosition] 
 (
  [positionID] ASC
 )

GO

CREATE NONCLUSTERED INDEX [FK_3] ON [scsPosition] 
 (
  [scsID] ASC
 )

GO

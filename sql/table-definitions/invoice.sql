-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


-- ************************************** [Invoice]
CREATE TABLE [Invoice]
(
 [invoiceID]   int NOT NULL ,
 [creditor]    varchar(64) NOT NULL ,
 [propertyID]  int NOT NULL ,
 [amount]      int NOT NULL ,
 [invoiceType] varchar(64) NOT NULL ,
 [comment]     varchar(255) NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([invoiceID] ASC),
 CONSTRAINT [FK_4] FOREIGN KEY ([propertyID])  REFERENCES [Property]([propertyID])
);
GO


CREATE NONCLUSTERED INDEX [FK_2] ON [Invoice] 
 (
  [propertyID] ASC
 )

GO

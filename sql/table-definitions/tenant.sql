-- ******************** SqlDBM: Microsoft SQL Server ********************
-- ******* Generated by SqlDBM: model, v10 by b11shem06@gmail.com *******


-- ************************************** [Tenant]
CREATE TABLE [Tenant]
(
 [tenantID]    int NOT NULL ,
 [firstName]   int NOT NULL ,
 [lastName]    int NOT NULL ,
 [bankAccount] varchar(255) NOT NULL ,


 CONSTRAINT [PK_1] PRIMARY KEY CLUSTERED ([tenantID] ASC)
);
GO

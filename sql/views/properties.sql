CREATE VIEW [group7].[properties_view]
AS
SELECT
	p.nrUnits ,
	a.country,
	a.city ,
	a.postalCode, 
	a.street ,
	a.houseNr ,
	o.firstName, 
	o.lastName ,
	o.bankAccount, 
	p.managerID
FROM
	[group7].[Property] p
INNER JOIN [group7].[Adress] AS a 
	ON
	p.adressID = a.adressID
INNER JOIN [group7].[Manager] AS m
	ON
	p.managerID = m.managerID
INNER JOIN [group7].[Owner] AS o
	ON
	p.ownerID = o.ownerID;
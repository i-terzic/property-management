CREATE PROCEDURE [group7].[update_property] (
	@propertyID int,
    @nrUnits int,
    @country varchar(64),
    @city varchar(64),
    @postalCode int,
    @street varchar(64),
    @houseNr int,
    @firstName varchar(64),
    @lastName varchar(64),
    @bankAccount varchar(255),
    @managerID int
)
AS
BEGIN
BEGIN
		TRANSACTION

UPDATE
	a
SET 
	a.country = @country,
	a.city = @city,
	a.postalCode = @postalCode,
	a.street = @street,
	a.houseNr = @houseNr
FROM
	[group7].[Adress] a
INNER JOIN [group7].[Property] p
ON
	a.adressID = p.adressID
WHERE
	p.propertyID = @propertyID;

UPDATE 
	p
SET
	p.nrUnits = @nrUnits,
	p.managerID = @managerID
FROM
	[group7].[Property] p
WHERE
	p.propertyID = @propertyID;

UPDATE 
	o
SET 
	o.firstName = @firstName,
	o.lastName = @lastName,
	o.bankAccount = @bankAccount
FROM 
	[group7].[Owner] o
INNER JOIN
	[group7].[Property] p 
ON
	o.ownerID = p.ownerID
WHERE
	p.propertyID = @propertyID;

COMMIT
END
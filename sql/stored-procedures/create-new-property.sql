CREATE PROCEDURE [group7].[create_new_property] (
    @nrUnits int,
    @country varchar(64),
    @city varchar(64),
    @postalCode int,
    @street varchar(64),
    @houseNr int,
    @firstName varchar(64),
    @lastName varchar(64),
    @bankAccount varchar(255),
    @managerID int,
    @propertyID int output
) 
AS
BEGIN
	DECLARE @LASTID int;

DECLARE @adressID int;

DECLARE @ownerID int;

EXEC PROC [group7].[create_new_adress]
        @country = @country,
        @city = @city,
        @postalCode = @postalCode,
        @street = @street,
        @houseNr = @houseNr,
        @adressID = @adressID output;

EXEC PROC [group7].[create_new_ower]
        @firstName = @firstName,
        @lastName = @lastName,
        @bankAccount = @bankAccount,
        @ownerID = @ownerID output;

INSERT
	INTO
	[group7].[Property] (nrUnits,
	adressID,
	ownerID,
	managerID)
VALUES (@nrUnits,
@adressID,
@ownerID,
@managerID);

SET
@LASTID = @@IDENTITY;

SELECT
	@propertyID = @LASTID;
END;
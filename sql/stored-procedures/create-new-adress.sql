
CREATE PROCEDURE [group7].[create_new_adress] (@country varchar(64), @city varchar(64), @postalCode int, @street varchar(64), @houseNr int)
AS 
BEGIN
	DECLARE @LASTID int;
	
	INSERT INTO [group7].[Adress] (country, city, postalCode, street, houseNr) 
	VALUES (@country, @city, @postalCode, @street, @houseNr)
	SET @LASTID = @@IDENTITY;
	
	SELECT 'adressID' = @LASTID;
	
END;
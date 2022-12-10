CREATE PROCEDURE [group7].[create_new_owner] (@firstName varchar(64), @lastName varchar(64), @bankAccount varchar(255))
AS 
BEGIN
	DECLARE @LASTID int;
	
	INSERT INTO [group7].[Owner] (firstName, lastName, bankAccount) 
	VALUES (@firstName, @lastName, @bankAccount)
	SET @LASTID = @@IDENTITY;
	
	SELECT 'ownerID' = @LASTID;
	
END;

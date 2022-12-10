CREATE PROCEDURE [group7].[create_new_manager] (
    @firstName varchar(64),
    @lastName varchar(64),
    @managerID int output
)
AS 
BEGIN
	DECLARE @LASTID int;
	
	INSERT INTO [group7].[Manager] (firstName, lastName) 
	VALUES (@firstName, @lastName)
	SET @LASTID = @@IDENTITY;
	
    SELECT @managerID = @LASTID;
	
END;
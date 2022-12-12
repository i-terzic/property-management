CREATE PROCEDURE [group7].[create_new_unit] (
    @propertyID int,
    @squareMeters int,
    @nrRooms int
) 
AS
BEGIN
	DECLARE @LASTID int;

INSERT
	INTO
	[group7].[Unit] (
	squareMeters,
	propertyID,
	nrRooms)
VALUES (
    @squareMeters,
    @propertyID,
    @nrRooms
);

SET
@LASTID = @@IDENTITY;

SELECT
	
'unitID' = @LASTID;
END;
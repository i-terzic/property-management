CREATE PROCEDURE [group7].[add_monthly_rents]
AS
BEGIN
	
	
	DECLARE @contractID int;

DECLARE @nrResidents int;

DECLARE @tenantID int;

DECLARE @unitID int;

DECLARE @ownerID int;

DECLARE @warmRent int;

DECLARE @startDate datetime;

DECLARE @endDate datetime;

DECLARE @propertyID int;

DECLARE @ownerLastName varchar(64);

DECLARE @Cursor AS CURSOR;

SET
@Cursor = CURSOR FAST_FORWARD READ_ONLY FOR
SELECT
	contractID,
	nrResidents,
	tenantID,
	unitID,
	ownerID,
	warmRent,
	startDate,
	endDate
FROM 
		[group7].[Contract];

OPEN @Cursor
FETCH NEXT
FROM
@Cursor
INTO
	@contractID,
	@nrResidents,
	@tenantID,
	@unitID,
	@ownerID,
	@warmRent,
	@startDate,
	@endDate


WHILE @@FETCH_STATUS = 0
BEGIN
	
	SELECT
	TOP 1 @propertyID = propertyID
FROM
	[group7].[Unit] u
WHERE
	u.unitID = @unitID;

SELECT
	TOP 1 @ownerLastName = lastName
FROM
	[group7].[Owner] o
WHERE
	o.ownerID = @ownerID;

INSERT
	INTO
	[group7].[OpenPositions]
		(propertyID,
	tenantID,
	amount,
	description
	)
VALUES (@propertyID,
@tenantID,
(@warmRent * -1),
CONCAT('MIETE ', @ownerLastName)
);
-- Insert Rent as negative open position

FETCH NEXT
FROM
@Cursor
INTO
	@contractID,
	@nrResidents,
	@tenantID,
	@unitID,
	@ownerID,
	@warmRent,
	@startDate,
	@endDate
END

CLOSE @Cursor;

DEALLOCATE @Cursor;
END

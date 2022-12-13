CREATE PROCEDURE [group7].[add_monthly_rents]
AS
BEGIN
	
	
	DECLARE @contractID int;

DECLARE @nrResidents int;

DECLARE @tenantID int;

DECLARE @unitID int;

DECLARE @ownerID int;

DECLARE @coldRent money;

DECLARE @prepayment money;

DECLARE @startDate datetime;

DECLARE @endDate datetime;

DECLARE @propertyID int;

DECLARE @tenantLastName varchar(64);

DECLARE @date date = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)

DECLARE @Cursor AS CURSOR;

SET
@Cursor = CURSOR FAST_FORWARD READ_ONLY FOR
SELECT
	contractID,
	nrResidents,
	tenantID,
	unitID,
	ownerID,
	coldRent,
	prepayment,
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
	@coldRent,
	@prepayment,
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
	TOP 1 @tenantLastName = lastName
FROM
	[group7].[Tenant] t
WHERE
	t.tenantId = @tenantID;

INSERT
	INTO
	[group7].[OpenPosition]
		(propertyID,
	tenantID,
	amount,
	description,
	date
	)
VALUES (@propertyID,
@tenantID,
((@coldRent + @prepayment ) * -1),
CONCAT('MIETE ', @tenantLastName),
@date
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
	@coldRent,
	@prepayment,
	@startDate,
	@endDate
END

CLOSE @Cursor;

DEALLOCATE @Cursor;
END

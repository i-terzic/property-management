CREATE VIEW [group7].[open_position_view]
AS
SELECT
    op.openPositionID, 
	op.description,
    op.amount,
    op.tenantID,
    op.date,
    t.firstName as tenantFirstName,
    t.lastName as tenantLastName,
    p.street,
    p.houseNr,
    p.postalCode,
    p.city,
    p.country
FROM
	[group7].[OpenPosition] op
INNER JOIN [group7].[properties_view] AS p 
	ON
	p.propertyID = op.propertyID
INNER JOIN [group7].[Tenant] t 
	ON 
	t.tenantID = op.tenantID;
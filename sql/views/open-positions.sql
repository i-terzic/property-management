CREATE VIEW [group7].[open_position_view]
AS 
SELECT
	op.tenantID,
	op.date,
	op.amount,
	t.firstName,
	t.lastName
FROM
	(
	SELECT
		op.tenantID,
		date,
		SUM (amount) as amount
	FROM
		group7.OpenPosition op
	GROUP BY
		op.tenantID,
		date) AS op
LEFT JOIN group7.Tenant t 
ON
	op.tenantID = t.tenantID;

CREATE VIEW [group7].[open_position_view]
AS 
SELECT
	op.tenantID,
	op.amount,
	t.firstName,
	t.lastName
FROM
	(
	SELECT
		op.tenantID,
		SUM (amount) as amount
	FROM
		group7.OpenPosition op
	GROUP BY
		op.tenantID) AS op
LEFT JOIN group7.Tenant t 
ON
	op.tenantID = t.tenantID;

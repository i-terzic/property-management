CREATE VIEW [group7].[scs_position_view]
AS
SELECT
	sp.scsPositionID,
    sp.amount,
    sp.positionID,
    sp.date,
    sp.tenantID,
    p.positionName
FROM
	[group7].[scsPosition] sp
INNER JOIN 
    [group7].[Position] p
ON p.positionID = sp.positionID;
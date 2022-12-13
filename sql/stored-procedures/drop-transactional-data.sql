CREATE PROCEDURE [group7].[delete_transactional_data]
AS
BEGIN
DELETE FROM [group7].[Transaction]
DELETE FROM [group7].[ScsPosition]
DELETE FROM [group7].[OpenPosition] WHERE amount>0
DELETE FROM [group7].[Prepayment]
END

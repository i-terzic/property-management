CREATE TRIGGER [group7].[stage_trigger] ON [group7].[Transaction]
AFTER INSERT
AS
BEGIN
    DECLARE @postingDate  date;
    DECLARE @valutaDate date;
    DECLARE @postingText VARCHAR(64);
    DECLARE @usage VARCHAR(64);
    DECLARE @payer VARCHAR(64);
    DECLARE @amount money;

    DECLARE @tenantId int;
    DECLARE @tenantln VARCHAR(64);
    DECLARE @propertyId int;
    DECLARE @contractId int;

    DECLARE @prepayAmount money;

    SELECT
        @postingDate = i.postingDate,
        @valutaDate = i.valutaDate,
        @postingText = i.postingText,
        @usage = i.usage,
        @payer = i.payer,
        @amount = i.amount
    FROM inserted as i
    IF @usage LIKE '%MIETE%'
    BEGIN
        select
            @tenantId=t.tenantId,
            @tenantln = t.lastName,
            @propertyId = u.propertyID,
            @contractId = c.contractId
        from [group7].[Tenant] as t
            INNER JOIN [group7].[Contract] as c
            INNER JOIN [group7].[Unit] as u
            ON u.unitId = c.unitID
            On c.tenantId = t.tenantId
        WHERE @payer LIKE '%'+UPPER(t.lastName)+'%' AND u.propertyID=1
        If @contractId is not null
        BEGIN
            INSERT INTO [group7].[OpenPosition]
                (propertyId,tenantId,amount,"description","date")
            values(@propertyId, @tenantId, @amount, 'MIETE '+@tenantln, @valutaDate)
            
            select  @prepayAmount = c.prepayment from [group7].[Contract] as c where c.tenantID = @tenantId;
            INSERT INTO [group7].[Prepayment] (tenantId,amount,"date")
            values (@tenantId,@prepayAmount,@valutaDate)
        END
    END
    ELSE 
        BEGIN
        select
            @propertyId = u.propertyID
        from [group7].[Tenant] as t
            INNER JOIN [group7].[Contract] as c
            INNER JOIN [group7].[Unit] as u
            ON u.unitId = c.unitID
            On c.tenantId = t.tenantId
        WHERE @payer LIKE '%'+UPPER(t.lastName)+'%'
        DECLARE @positionId int;
        DECLARE @allocationTypeId int;
        DECLARE @totalNrRes  int;
        SELECT
            @positionId = mp.positionId,
            @allocationTypeId = p.allocationTypeId
        FROM [group7].[TransactionMapping] as mp
            INNER JOIN [group7].[Position] as p
            ON p.positionId = mp.positionId
        WHERE Upper(@usage) LIKE mp.transactionPattern

        if @allocationTypeId is not NULL
BEGIN
            IF @allocationTypeId =1 
        PRINT(@allocationTypeId)

        ELSE IF @allocationTypeId = 2
        BEGIN
                select
                    @totalNrRes=sum(c.nrResidents)
                from [group7].[contract] as c
                    INNER JOIN [group7].[unit] as u
                    ON u.unitId = c.unitID
                where u.propertyID=1 
                Group by u.propertyId

                DECLARE @Cursor1 as Cursor;
                DECLARE @CTenantID as int;
                DECLARE @CNrResidents as int;
                SET @Cursor1 = Cursor for 
                select c.tenantId, c.nrResidents
                From [group7].[contract] as C
                INNER JOIN [group7].[Unit] as u
                On u.unitID = c.unitID
                where u.propertyID=1;

                OPEN @Cursor1;
                Fetch next from @Cursor1 into @CTenantID,@CNrResidents
                WHILE @@FETCH_STATUS = 0
                  BEGIN
                    DECLARE @prcOfTotRes decimal(19,19);
                    DECLARE @amountToPay money;
                    set @prcOfTotRes = cast(@CNrResidents as decimal)/@totalNrRes;
                    set @amountToPay = @amount*@prcOfTotRes;
                    INSERT INTO [group7].[scsPosition]
                        (amount,tenantId,positionID,"date")
                    values
                        (@amountToPay*(-1), @CTenantID, @positionId, @valutaDate
                    )

                    FETCH NEXT FROM @Cursor1 INTO @CTenantID,@CNrResidents

                END

            END
     ELSE IF @allocationTypeId = 3
        BEGIN
                select
                    @totalNrRes=sum(c.nrResidents)
                from [group7].[contract] as c
                    INNER JOIN [group7].[unit] as u
                    ON u.unitId = c.unitID
                where u.propertyID=1 
                Group by u.propertyId

                DECLARE @Cursor2 as Cursor;
                DECLARE @CTenantID2 as int;
                DECLARE @CSquareM as int;
                DECLARE @TotalSquareM as int;
                SET @Cursor2 = Cursor for 
                select c.tenantId, u.squareMeters
                From [group7].[contract] as C
                INNER JOIN [group7].[Unit] as u
                On u.unitID = c.unitID
                where u.propertyID=1;

                select 
                @TotalSquareM = sum(u.squareMeters)
                from [group7].[Unit] as u
                GROUP BY u.propertyID

                OPEN @Cursor2;
                Fetch next from @Cursor2 into @CTenantID2,@CSquareM
                WHILE @@FETCH_STATUS = 0
                  BEGIN
                    DECLARE @prcOfTotSquareM decimal(19,19);
                    DECLARE @amountToPay2 money;
                    set @prcOfTotSquareM = cast(@CSquareM as decimal)/@TotalSquareM;
                    set @amountToPay2 = @amount*@prcOfTotSquareM;
                    INSERT INTO [group7].[scsPosition]
                        (amount,tenantId,positionID,"date")
                    values
                        (@amountToPay2*(-1), @CTenantID2, @positionId, @valutaDate
                    )

                    FETCH NEXT FROM @Cursor2 INTO @CTenantID2,@CSquareM

                END

            END    
        END
    end
END;
CREATE PROCEDURE [group7].[stage_sp](
    @data VARCHAR(8000)
)
AS
BEGIN
    declare @rowCount int;
    set @rowCount =0;
    declare @localTable1 table(
        csv_line text
    );
    INSERT INTO @localTable1
        (csv_line)
    select
        value
    from
        STRING_SPLIT ( @data , '~'
    );

    DECLARE @Cursor as CURSOR;
    DECLARE @Line as VARCHAR(max);
    DECLARE @pointer INT;
    SET @Cursor = CURSOR FOR 
    SELECT csv_line
    from @localTable1;

    DECLARE @postingDate VARCHAR(64);
    DECLARE @valutaDate VARCHAR(64);
    DECLARE @postingText VARCHAR(64);
    DECLARE @usage VARCHAR(64);
    DECLARE @payer VARCHAR(64);
    DECLARE @amount VARCHAR(64);


    OPEN @Cursor;
    FETCH NEXT FROM @Cursor into @Line
    WHILE @@FETCH_STATUS = 0
    BEGIN

        set @pointer = 1;
        DECLARE @Cursor2 as CURSOR;
        DECLARE @singleVal as VARCHAR(max);


        SET @Cursor2 = CURSOR FOR 

        SELECT VALUE
        FROM
            STRING_SPLIT
        ( @Line , ';'
    );

        BEGIN

            OPEN @Cursor2;
            FETCH NEXT FROM @Cursor2 into @singleVal
            WHILE @@FETCH_STATUS = 0
    BEGIN
                if @singleVal !=' '
    BEGIN
    set @singleVal= TRIM(@singleVal)
                    IF @pointer=1
    
                set @postingDate =cast(@singleVal as date)

                    IF @pointer=2
    
                set @valutaDate = cast(@singleVal as date)

                    IF @pointer=3
    
                set @postingText = @singleVal

                    IF @pointer=4
    
                set @usage = @singleVal

                    IF @pointer=5
    
                set @payer = @singleVal

                    IF @pointer=6
 
                set @amount = REPLACE(REPLACE(@singleVal, '.', ''), ',', '.')


                    set @pointer = @pointer +1;
                    print
                    (@singleval)
                end

                FETCH NEXT FROM @Cursor2 INTO @singleVal
            END
            IF NOT EXISTS (SELECT 1
            FROM [group7].[Transaction]
            WHERE postingDate = @postingDate and valutaDate=@valutaDate and postingText=@postingText and usage=@usage and payer=@payer and amount=@amount)
            BEGIN
                INSERT into [group7].[Transaction]
                    (postingDate,valutaDate,postingText,usage,payer,amount)
                values
                    (@postingDate, @valutaDate, @postingText, @usage, @payer, @amount)
                    set @rowCount = @rowCount+1;

            END
            SET @pointer = 1

            FETCH NEXT FROM @Cursor INTO @Line
        END

    END
    select 'affectedRows' = @rowCount;

END;

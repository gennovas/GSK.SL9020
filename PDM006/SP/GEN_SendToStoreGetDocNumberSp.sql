 

/*
    History
    16 Nov 2026 - Exclude prefix01
*/
CREATE   PROCEDURE [dbo].[GEN_SendToStoreGetDocNumberSp]
(
    @FromWhse WhseType,
    @ToBU nvarchar(10),
    @DocumentDate DateTimeType,
    @DocumentNum DocumentNumType OUTPUT,
    @Infobar InfobarType OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    DECLARE
        @MM CHAR(2) = FORMAT(@DocumentDate, 'MM'),
        @yy CHAR(2) = FORMAT(@DocumentDate, 'yy'),
        @Prefix01 VARCHAR(50),
        @Prefix02 VARCHAR(50),
        @Prefix03 VARCHAR(50),
        @NextNN INT,
        @NewNN VARCHAR(4);
         
        SELECT
            @Prefix01 = prefix_01,
            @Prefix02 = prefix_02,
            @Prefix03 = prefix_03,
            @yy = yy,
            @MM = MM,
            @NextNN = TRY_CONVERT(INT, ISNULL(nn, '0000')) + 1
        FROM GEN_SendToStoreDocNumber WITH (UPDLOCK, HOLDLOCK)
        WHERE from_whse = @FromWhse
          AND to_bu = @ToBU
          AND MM = @MM
          AND yy = @yy;

        IF @NextNN IS NULL
            THROW 50001, 'Document number record not found or invalid.', 1;

        IF @NextNN > 9999
            THROW 50002, 'Document number has exceeded 9999.', 1;

        SET @NewNN = RIGHT('0000' + CONVERT(VARCHAR(10), @NextNN), 4);

        -- Update running number
        UPDATE GEN_SendToStoreDocNumber
        SET nn = @NewNN
        WHERE from_whse = @FromWhse
          AND to_bu = @ToBU
          AND MM = @MM
          AND yy = @yy;
           
        SET @DocumentNum = CONCAT(
            --@Prefix01, 
            @Prefix02, @Prefix03, @yy, @MM, @NewNN
        );
         
END;
GO



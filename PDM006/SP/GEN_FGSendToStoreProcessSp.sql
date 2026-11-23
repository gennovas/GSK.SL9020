 
/*
	History
	16 Nov 2026 - Add serial sequence
*/

CREATE PROCEDURE [dbo].[GEN_FGSendToStoreProcessSp](
	@TransNum HugeTransNumType,
	@Sequence SequenceType,
	@DocumentDate DateTimeType,
	@Job JobType,
	@Suffix SuffixType,
	@OperNum OperNumType,
	@PostedQty QtyUnitType,
	@SentQty QtyUnitType,
	@ReceivedQty QtyUnitType,
	@CurSendQty QtyUnitType,
	@CurReceivedQty QtyUnitType,
	@PrintFlag ListYesNoType,
	@DocumentNum DocumentNumType OUTPUT,
	@Infobar InfobarType OUTPUT,
	@ProcessId uniqueidentifier
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DECLARE @FromWhse WhseType,
	@ToBU nvarchar(10),
	@Severity INT
	 
SELECT TOP 1 @DocumentNum = document_num
FROM GEN_FGSendToStore 
WHERE process_id = @ProcessId

IF @DocumentNum IS NULL
BEGIN

	SELECT @FromWhse = whse,
		@ToBU = Uf_BU
	FROM job WHERE job = @Job AND Suffix = @Suffix

	EXEC	@Severity = [dbo].[GEN_SendToStoreGetDocNumberSp]
			@FromWhse = @FromWhse,
			@ToBU = @ToBU,
			@DocumentDate = @DocumentDate,
			@DocumentNum = @DocumentNum OUTPUT,
			@Infobar = @Infobar OUTPUT

	IF @Severity <> 0
		RETURN @Severity
END

SELECT @Sequence = MAX ( sequence )
FROM GEN_FGSendToStore
WHERE process_id = @ProcessId

SET @Sequence = ISNULL(@Sequence, 0) + 1;

INSERT INTO GEN_FGSendToStore (trans_num, sequence, document_date, job, suffix, oper_num, posted_qty, sent_qty, received_qty, cur_send_qty, cur_received_qty, print_flag, document_num, [process_id])
VALUES (@TransNum, @Sequence, @DocumentDate, @Job, @Suffix, @OperNum, @PostedQty, @CurSendQty, @ReceivedQty, @CurSendQty, @CurReceivedQty, @PrintFlag, @DocumentNum, @ProcessId)

DECLARE @SerialSeq NVARCHAR(3),
        @MaxSeq NVARCHAR(3),
        @Serial NVARCHAR(50);
		 
SELECT TOP 1
    @SerialSeq = s.sequence
FROM GEN_Serial s
INNER JOIN GEN_FGSendToStore f
    ON f.document_num = s.document_num
   AND f.job = s.job
   AND f.suffix = s.suffix
WHERE f.process_id = @ProcessId
  AND s.job = @Job
  AND s.suffix = @Suffix;
   
IF @SerialSeq IS NULL
BEGIN
    SELECT @MaxSeq = MAX(TRY_CONVERT(INT, s.sequence))
    FROM GEN_Serial s
    WHERE s.document_num = @DocumentNum;

    SET @SerialSeq =
        RIGHT('000' + CAST(ISNULL(TRY_CONVERT(INT, @MaxSeq), 0) + 1 AS NVARCHAR(3)), 3);
END;
 
SET @Serial = CONCAT(@DocumentNum, '-', @SerialSeq);
 
IF NOT EXISTS
(
    SELECT 1
    FROM GEN_Serial
    WHERE document_num = @DocumentNum
      AND job = @Job
      AND suffix = @Suffix
)
BEGIN
    INSERT INTO GEN_Serial
    (
        document_num, job, suffix, oper_num,
        qty, doc_date, sequence, serial
    )
    VALUES
    (
        @DocumentNum, @Job, @Suffix, @OperNum,
        @CurSendQty, @DocumentDate, @SerialSeq, @Serial
    );
END
ELSE
BEGIN
    UPDATE GEN_Serial
    SET qty = ISNULL(qty, 0) + @CurSendQty
    WHERE document_num = @DocumentNum
      AND job = @Job
      AND suffix = @Suffix;
END;
GO



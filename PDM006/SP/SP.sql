/****** Object:  StoredProcedure [dbo].[GEN_DeleteSendToStoreDocSp]    Script Date: 26/10/2026 3:18:57 PM ******/
DROP PROCEDURE [dbo].[GEN_DeleteSendToStoreDocSp]
GO

/****** Object:  StoredProcedure [dbo].[GEN_CLM_FGSendToStoreLoadSp]    Script Date: 26/10/2026 3:18:57 PM ******/
DROP PROCEDURE [dbo].[GEN_CLM_FGSendToStoreLoadSp]
GO

/****** Object:  StoredProcedure [dbo].[GEN_FGSendToStoreProcessSp]    Script Date: 26/10/2026 3:18:57 PM ******/
DROP PROCEDURE [dbo].[GEN_FGSendToStoreProcessSp]
GO

/****** Object:  StoredProcedure [dbo].[GEN_FGSendToStoreProcessSp]    Script Date: 26/10/2026 3:18:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


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
	@Severity INT,
	@AddDocument INT = 0

--Get Old Document (not print)
SELECT TOP 1 @DocumentNum = document_num
FROM GEN_FGSendToStore 
WHERE job = @Job AND suffix = @Suffix AND process_id = @ProcessId

IF @DocumentNum IS NULL
BEGIN
	
	SET @AddDocument = 1

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
WHERE job = @Job AND suffix = @Suffix

SET @Sequence = ISNULL(@Sequence, 0) + 1;

INSERT INTO GEN_FGSendToStore (trans_num, sequence, document_date, job, suffix, oper_num, posted_qty, sent_qty, received_qty, cur_send_qty, cur_received_qty, print_flag, document_num, [process_id])
VALUES (@TransNum, @Sequence, @DocumentDate, @Job, @Suffix, @OperNum, @PostedQty, @CurSendQty, @ReceivedQty, @CurSendQty, @CurReceivedQty, @PrintFlag, @DocumentNum, @ProcessId)

IF @AddDocument = 1
	INSERT INTO [dbo].[GEN_Serial] ([document_num]
		  ,[job]
		  ,[suffix]
		  ,[oper_num]
		  ,[qty]
		  ,[doc_date] )

	VALUES (@DocumentNum, @Job, @Suffix, @OperNum, @CurSendQty, @DocumentDate)

IF @AddDocument = 0
	UPDATE [dbo].[GEN_Serial] SET qty = ISNULL(qty, 0) + @CurSendQty
	WHERE document_num = @DocumentNum
GO

/****** Object:  StoredProcedure [dbo].[GEN_CLM_FGSendToStoreLoadSp]    Script Date: 26/10/2026 3:18:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GEN_CLM_FGSendToStoreLoadSp] (
	@StartJob		JobType,
	@EndJob			JobType,
	@StartSuffix	SuffixType,
	@EndSuffix		SuffixType,
	@StartItem		ItemType,
	@EndItem		ItemType,
	@StartJobDate	DateTimeType,
	@EndJobDate		DateTimeType,
	@StartDocumentNum	DocumentNumType,
	@EndDocumentNum		DocumentNumType,
	@StartDocDate		DateTimeType,
	@EndDocDate			DateTimeType,
	@RefreshOption		nvarchar(1) = 'G' --Generate Document, = 'P' Preview Print
)
AS

DECLARE
  @LowCharacter  HighLowCharType
, @HighCharacter HighLowCharType
, @LowDate       CurrentDateType
, @HighDate CurrentDateType

SET @LowCharacter  = dbo.LowCharacter()
SET @HighCharacter = dbo.HighCharacter()
SET @LowDate = dbo.LowDate()
SET @HighDate = dbo.HighDate()

SET @StartJob = ISNULL(dbo.ExpandKyByType('JobType', @StartJob), @LowCharacter)
SET @EndJob = ISNULL(dbo.ExpandKyByType('JobType', @EndJob), @HighCharacter)
SET @StartSuffix = ISNULL(@StartSuffix, dbo.LowAnyInt('SuffixType'))
SET @EndSuffix = ISNULL(@EndSuffix, dbo.HighAnyInt('SuffixType'))
SET @StartItem = ISNULL(@StartItem, @LowCharacter)
SET @EndItem = ISNULL(@EndItem, @HighCharacter)
SET @StartJobDate = ISNULL(@StartJobDate, @LowDate)
SET @EndJobDate = ISNULL(@EndJobDate, @HighDate)
SET @StartDocumentNum = ISNULL(@StartDocumentNum, @LowCharacter)
SET @EndDocumentNum = ISNULL(@EndDocumentNum, @HighCharacter)
SET @StartDocDate = ISNULL(@StartDocDate, @LowDate)
SET @EndDocDate = ISNULL(@EndDocDate, @HighDate)

DECLARE @JobTransDataset Table 
(
	TransDate	DateTimeType,
	TransNum	HugeTransNumType,
	Sequence	SequenceType,
	Job			JobType,
	Suffix		SuffixType,
	OperNum		OperNumType,
	Item		ItemType,
	Description	DescriptionType,
	QtyComplete	QtyUnitType,
	SentQty		QtyUnitType,
	ReceivedQty	QtyUnitType,
	DocumentNum	DocumentNumType,
	QtyToSend	QtyUnitType
)

DECLARE @SerialDataset Table
(
	Job			JobType,
	Suffix		SuffixType,
	TotalQty	QtyUnitType
)

IF @RefreshOption = 'G'
BEGIN
	INSERT INTO @JobTransDataset (TransDate, TransNum, Sequence, Job, Suffix, OperNum, Item, Description, QtyComplete, SentQty, ReceivedQty, DocumentNum, QtyToSend)
	SELECT jtr.trans_date,
		jtr.trans_num,
		0 sequence,
		jr.job,
		jr.suffix,
		MAX(jr.oper_num) oper_num,
		item,
		description,
		jtr.qty_complete,
		0 sent_qty,
		0 received_qty,
		NULL document_num,
		0 qty_to_send
	FROM jobtran jtr
		INNER JOIN job j ON jtr.job = j.job and jtr.suffix = j.suffix
		INNER JOIN job_sch js ON jtr.job = js.job and jtr.suffix = js.suffix
		INNER JOIN jobroute jr ON jtr.job = jr.job AND jtr.suffix = jr.suffix AND jtr.oper_num= jr.oper_num
	WHERE jtr.posted = 1
	   AND j.job BETWEEN @StartJob AND @EndJob
	   AND (j.suffix >= CASE WHEN j.job = @StartJob THEN @StartSuffix ELSE -1000 END)
	   AND (j.suffix <= CASE WHEN j.job = @EndJob THEN @EndSuffix ELSE 1000 END)
	   AND j.item BETWEEN @StartItem AND @EndItem
	   AND js.start_date BETWEEN @StartJobDate AND @EndJobDate
	   AND j.type = 'J'
	   AND j.stat = 'R'
	   AND jtr.qty_complete > 0
	   AND j.Uf_BU IS NOT NULL
	GROUP BY jtr.trans_date,
		jtr.trans_num,
		jr.job,
		jr.suffix,
		item,
		description,
		jtr.qty_complete
	ORDER BY jr.job,
		jr.suffix,
		jtr.trans_date
	
	INSERT INTO @SerialDataset (Job, Suffix, TotalQty)
	SELECT job, suffix, SUM(qty) FROM GEN_Serial
	WHERE job BETWEEN @StartJob AND @EndJob
	   AND (suffix >= CASE WHEN job = @StartJob THEN @StartSuffix ELSE -1000 END)
	   AND (suffix <= CASE WHEN job = @EndJob THEN @EndSuffix ELSE 1000 END)
	GROUP BY job, suffix


	;WITH JobTransCTE AS
	(
		SELECT
			d.Job,
			d.Suffix,
			d.TransNum,
			d.TransDate,
			d.QtyComplete,
			ISNULL(s.TotalQty, 0) AS TotalQty,
			ISNULL(
				SUM(d.QtyComplete) OVER (
					PARTITION BY d.Job, d.Suffix
					ORDER BY d.TransDate, d.TransNum
					ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
				), 0
			) AS PreviousQty
		FROM @JobTransDataset d
		LEFT JOIN @SerialDataset s
			ON s.Job = d.Job
		   AND s.Suffix = d.Suffix
	)
	
	/* Quantity Allocation */
	UPDATE d
	SET QtyToSend =
		CASE
			-- Serial quantity has already been exhausted
			WHEN c.PreviousQty >= c.TotalQty
				THEN c.QtyComplete

			-- Current record exceeds the remaining serial quantity
			WHEN c.PreviousQty + c.QtyComplete > c.TotalQty
				THEN c.PreviousQty + c.QtyComplete - c.TotalQty

			-- Serial quantity is not exhausted yet
			ELSE 0
		END
	FROM @JobTransDataset d
	INNER JOIN JobTransCTE c
		ON c.Job = d.Job
	   AND c.Suffix = d.Suffix
	   AND c.TransNum = d.TransNum;


	SELECT * FROM @JobTransDataset WHERE QtyToSend > 0 ORDER BY Job, Suffix, TransDate
END
ELSE IF @RefreshOption = 'P'
	SELECT NULL, --trans_date
			NULL, --trans_num 
			NULL, --sequence
			s.job, 
			s.suffix,
			s.oper_num,
			item,
			description,
			null , --qty_complete
			NULL sent_qty,
			NULL received_qty,
			s.document_num,
			s.qty 
		FROM GEN_Serial s
			INNER JOIN job ON s.job = job.job AND s.suffix = job.suffix
			INNER JOIN job_sch js ON s.job = js.job and s.suffix = js.suffix
		WHERE s.job BETWEEN @StartJob AND @EndJob
			AND (s.suffix >= CASE WHEN s.job = @StartJob THEN @StartSuffix ELSE -1000 END)
			AND (s.suffix <= CASE WHEN s.job = @EndJob THEN @EndSuffix ELSE 1000 END)
			AND job.item BETWEEN @StartItem AND @EndItem
			AND js.start_date BETWEEN @StartJobDate AND @EndJobDate
			AND s.doc_date BETWEEN @StartDocDate AND @EndDocDate
			AND s.document_num BETWEEN @StartDocumentNum AND @EndDocumentNum
		ORDER BY s.job, s.suffix
GO

/****** Object:  StoredProcedure [dbo].[GEN_DeleteSendToStoreDocSp]    Script Date: 26/10/2026 3:18:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GEN_DeleteSendToStoreDocSp]
(
	@DocumentNum DocumentNumType,
	@InfoBar InfobarType OUTPUT
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Validation need?

INSERT INTO GEN_SerialDel (document_num, job, suffix, oper_num, qty, print_flag, received_qty, doc_date)
SELECT document_num, job, suffix, oper_num, qty, print_flag, received_qty, doc_date
FROM GEN_Serial WHERE document_num = @DocumentNum
 
DELETE GEN_Serial WHERE document_num = @DocumentNum
GO



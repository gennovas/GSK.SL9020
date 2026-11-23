

/*
	History
	16 Nov 2026 - Add parameters @FromBU, @ToBU, @FromTransDate, @ToTransDate
*/

ALTER PROCEDURE [dbo].[GEN_CLM_FGSendToStoreLoadSp] (
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
	@RefreshOption		nvarchar(1) = 'G', --Generate Document, = 'P' Preview Print
	@FromBU				WhseType,
	@ToBU				nvarchar(10),
	@FromTransDate		DateTimeType = NULL,
	@ToTransDate		DateTimeType = NULL
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
SET @FromTransDate = ISNULL(@FromTransDate, @LowDate)
SET @ToTransDate = ISNULL(@ToTransDate+ 1, @HighDate) 

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
	QtyToSend	QtyUnitType,
	AccmQty		QtyUnitType
)

DECLARE @SerialDataset Table
(
	Job			JobType,
	Suffix		SuffixType,
	TotalQty	QtyUnitType
)

IF @RefreshOption = 'G'
BEGIN
	INSERT INTO @JobTransDataset (TransDate, TransNum, Sequence, Job, Suffix, OperNum, Item, Description, QtyComplete, SentQty, ReceivedQty, DocumentNum, QtyToSend, AccmQty)

		SELECT jtr.trans_date,
		jtr.trans_num,
		0 sequence,
		jr.job,
		jr.suffix,
		jr.oper_num oper_num,
		item,
		description,
		jtr.qty_complete,
		isnull(st.Sent_qty,0) sent_qty,
		0 received_qty,
		NULL document_num,
		(jtr.qty_complete - isnull(st.Sent_qty,0))  qty_to_send,
		jtr.qty_complete - 	isnull(st.Sent_qty,0) AccmQty
	FROM jobtran jtr
		INNER JOIN job j ON jtr.job = j.job and jtr.suffix = j.suffix
		INNER JOIN job_sch js ON jtr.job = js.job and jtr.suffix = js.suffix
		INNER JOIN (select job, suffix, max(oper_num) oper_num from jobroute group by job, suffix)
		 jr ON jtr.job = jr.job AND jtr.suffix = jr.suffix AND jtr.oper_num= jr.oper_num
		left join (
		  select job, suffix, oper_num, trans_num,  sum(sent_qty) Sent_qty from   GEN_FGSendToStore group by job, suffix, oper_num, trans_num
		  )  st on jtr.job = st.job and jtr.suffix = st.suffix and jtr.oper_num = st.oper_num  and st.trans_num = jtr.trans_num
		
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
	   AND j.whse= @FromBU
	   AND j.Uf_BU= @ToBU
	   AND jtr.trans_date BETWEEN @FromTransDate AND @ToTransDate

	ORDER BY jr.job,
		jr.suffix,
		jtr.trans_date
	
	INSERT INTO @SerialDataset (Job, Suffix, TotalQty)
	SELECT job, suffix, SUM(qty) FROM GEN_Serial
	WHERE job BETWEEN @StartJob AND @EndJob
	   AND (suffix >= CASE WHEN job = @StartJob THEN @StartSuffix ELSE -1000 END)
	   AND (suffix <= CASE WHEN job = @EndJob THEN @EndSuffix ELSE 1000 END)
	GROUP BY job, suffix


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



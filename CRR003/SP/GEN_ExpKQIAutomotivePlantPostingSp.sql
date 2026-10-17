 
CREATE PROCEDURE [dbo].[GEN_ExpKQIAutomotivePlantPostingSp] (
	@pSessionID				RowPointerType
	, @pYear				INT
	, @pSlsManStarting		SlsManType = NULL
	, @pSlsManEnding		SlsManType = NULL
	, @pCustNumStarting		CustNumType = NULL
	, @pCustNumEnding		CustNumType = NULL
	, @pCustTypeStarting	CustTypeType = NULL
	, @pCustTypeEnding		CustTypeType = NULL
	, @pCustLocalOverseas	NVARCHAR(2) = 'A' -- A:All,L:Local,O:Overseas
	, @pCustNewCurrRegis	NVARCHAR(2) = 'A' -- A:All,N:New,C:Current
	, @Infobar				InfobarType OUTPUT
	, @BU					nvarchar(15)
)
AS

DECLARE @Severity		INT
   , @LowChar           HighLowCharType
   , @HighChar          HighLowCharType

SET @Severity = 0
SET @Infobar = NULL
SET @pYear = ISNULL(@pYear,YEAR(GETDATE()))

SET @LowChar = dbo.LowCharacter()
SET @HighChar =  dbo.HighCharacter()

SET @pSlsManStarting = ISNULL(@pSlsManStarting, @LowChar)
SET @pSlsManEnding = ISNULL(@pSlsManEnding, @HighChar)
SET @pCustNumStarting = ISNULL(@pCustNumStarting, dbo.LowString('CustNumType'))    
SET @pCustNumEnding = ISNULL(@pCustNumEnding, dbo.HighString('CustNumType'))  
SET @pCustTypeStarting = ISNULL(@pCustTypeStarting, @LowChar)
SET @pCustTypeEnding = ISNULL(@pCustTypeEnding, @HighChar)
SET @pCustLocalOverseas = ISNULL(@pCustLocalOverseas,'A')
SET @pCustNewCurrRegis = ISNULL(@pCustNewCurrRegis,'A')

DECLARE @x_col001 [nvarchar](250)
	, @x_col002 [nvarchar](250)
	, @x_col003 [nvarchar](250)
	, @x_col004 [nvarchar](250)
	, @x_col005 [nvarchar](250)
	, @x_col006 [nvarchar](250)
	, @x_col007 [nvarchar](250)
	, @x_col008 [nvarchar](250)
	, @x_col009 [nvarchar](250)
	, @x_col010 [nvarchar](250)
	, @x_col011 [nvarchar](250)
	, @x_col012 [nvarchar](250)
	, @x_col013 [nvarchar](250)
	, @x_col014 [nvarchar](250)
	, @x_col015 [nvarchar](250)
	, @x_col016 [nvarchar](250)
	, @x_col017 [nvarchar](250)
	, @x_col018 [nvarchar](250)
	, @x_col019 [nvarchar](250)
	, @x_col020 [nvarchar](250)
	, @x_col021 [nvarchar](250)
	, @x_col022 [nvarchar](250)
	, @x_col023 [nvarchar](250)
	, @x_col024 [nvarchar](250)
	, @x_col025 [nvarchar](250)
	, @x_col026 [nvarchar](250)
	, @x_col027 [nvarchar](250)
	, @x_col028 [nvarchar](250)
	, @x_col029 [nvarchar](250)
	, @x_col030 [nvarchar](250)
	, @x_col031 [nvarchar](250)
	, @x_col032 [nvarchar](250)
	, @x_col033 [nvarchar](250)
	, @x_col034 [nvarchar](250)
	, @x_col035 [nvarchar](250)
	, @x_col036 [nvarchar](250)
	, @x_col037 [nvarchar](250)
	, @x_col038 [nvarchar](250)
	, @x_col039 [nvarchar](250)
	, @x_col040 [nvarchar](250)
	, @x_col041 [nvarchar](250)
	, @x_col042 [nvarchar](250)
	, @x_col043 [nvarchar](250)
	, @x_col044 [nvarchar](250)
	, @x_col045 [nvarchar](250)
	, @x_col046 [nvarchar](250)
	, @x_col047 [nvarchar](250)
	, @x_col048 [nvarchar](250)
	, @x_col049 [nvarchar](250)
	, @x_col050 [nvarchar](250)
	, @x_col051 [nvarchar](250)
	, @x_col052 [nvarchar](250)
	, @x_col053 [nvarchar](250)
	, @x_col054 [nvarchar](250)
	, @x_col055 [nvarchar](250)
	, @x_col056 [nvarchar](250)
	, @x_col057 [nvarchar](250)
	, @x_col058 [nvarchar](250)
	, @x_col059 [nvarchar](250)
	, @x_col060 [nvarchar](250)
	, @x_col061 [nvarchar](250)
	, @x_col062 [nvarchar](250)
	, @x_col063 [nvarchar](250)
	, @x_col064 [nvarchar](250)
	, @x_col065 [nvarchar](250)
	, @x_col066 [nvarchar](250)
	, @x_col067 [nvarchar](250)
	, @x_col068 [nvarchar](250)
	, @x_col069 [nvarchar](250)
	, @x_col070 [nvarchar](250)
	, @x_col071 [nvarchar](250)
	, @x_col072 [nvarchar](250)
	, @x_col073 [nvarchar](250)
	, @x_col074 [nvarchar](250)
	, @x_col075 [nvarchar](250)
	, @x_col076 [nvarchar](250)
	, @x_col077 [nvarchar](250)
	, @x_col078 [nvarchar](250)
	, @x_col079 [nvarchar](250)
	, @x_col080 [nvarchar](250)
	, @x_col081 [nvarchar](250)
	, @x_col082 [nvarchar](250)
	, @x_col083 [nvarchar](250)
	, @x_col084 [nvarchar](250)
	, @x_col085 [nvarchar](250)
	, @x_col086 [nvarchar](250)
	, @x_col087 [nvarchar](250)
	, @x_col088 [nvarchar](250)
	, @x_col089 [nvarchar](250)
	, @x_col090 [nvarchar](250)
	, @x_col091 [nvarchar](250)
	, @x_col092 [nvarchar](250)
	, @x_col093 [nvarchar](250)
	, @x_col094 [nvarchar](250)
	, @x_col095 [nvarchar](250)
	, @x_col096 [nvarchar](250)
	, @x_col097 [nvarchar](250)
	, @x_col098 [nvarchar](250)
	, @x_col099 [nvarchar](250)
	, @x_col100 [nvarchar](250)
	, @x_col101 [nvarchar](250)
	, @x_col102 [nvarchar](250)
	, @x_col103 [nvarchar](250)
	, @x_col104 [nvarchar](250)
	, @x_col105 [nvarchar](250)
	, @x_col106 [nvarchar](250)
	, @x_col107 [nvarchar](250)
	, @x_col108 [nvarchar](250)
	, @x_col109 [nvarchar](250)
	, @x_col110 [nvarchar](250)
	, @x_col111 [nvarchar](250)
	, @x_col112 [nvarchar](250)
	, @x_col113 [nvarchar](250)
	, @x_col114 [nvarchar](250)
	, @x_col115 [nvarchar](250)
	, @x_col116 [nvarchar](250)
	, @x_col117 [nvarchar](250)
	, @x_col118 [nvarchar](250)
	, @x_col119 [nvarchar](250)
	, @x_col120 [nvarchar](250)
	, @x_col121 [nvarchar](250)
	, @x_col122 [nvarchar](250)
	, @x_col123 [nvarchar](250)
	, @x_col124 [nvarchar](250)
	, @x_col125 [nvarchar](250)
	, @x_col126 [nvarchar](250)
	, @x_col127 [nvarchar](250)
	, @x_col128 [nvarchar](250)
	, @x_col129 [nvarchar](250)
	, @x_col130 [nvarchar](250)
	, @x_col131 [nvarchar](250)
	, @x_col132 [nvarchar](250)
	, @x_col133 [nvarchar](250)
	, @x_col134 [nvarchar](250)
	, @x_col135 [nvarchar](250)
	, @x_col136 [nvarchar](250)
	, @x_col137 [nvarchar](250)
	, @x_col138 [nvarchar](250)
	, @x_col139 [nvarchar](250)
	, @x_col140 [nvarchar](250)
	, @x_col141 [nvarchar](250)
	, @x_col142 [nvarchar](250)
	, @x_col143 [nvarchar](250)
	, @x_col144 [nvarchar](250)
	, @x_col145 [nvarchar](250)
	, @x_col146 [nvarchar](250)
	, @x_col147 [nvarchar](250)
	, @x_col148 [nvarchar](250)
	, @x_col149 [nvarchar](250)
	, @x_col150 [nvarchar](250)
	
	, @x_grp001 [nvarchar](250)
	, @x_grp002 [nvarchar](250)
	, @x_grp003 [nvarchar](250)
	, @x_grp004 [nvarchar](250)
	, @x_grp005 [nvarchar](250)

DECLARE @lSeq	INT
	, @H_Col01	[nvarchar](10)
	, @H_Col02	[nvarchar](30)
	, @H_Col03	[nvarchar](30)
	, @H_Col04	[nvarchar](150)
	, @H_Col05	[nvarchar](30)
	, @H_Col06	[nvarchar](30)
	, @H_Col07	[nvarchar](30)
	, @H_Col08	[nvarchar](30)
	, @H_Col09	[nvarchar](30)
	, @H_Col10	[nvarchar](150)
	, @H_Col11	[nvarchar](30)
	, @H_Col12	[nvarchar](30)
	, @H_Col13	[nvarchar](30)
	, @H_Col14	[nvarchar](30)
	, @H_Col15	[nvarchar](30)
	, @H_Col16	[nvarchar](30)
	, @H_Col17	[nvarchar](30)
	, @H_Col18	[nvarchar](30)
	, @H_Col19	[nvarchar](30)
	, @H_Col20	[nvarchar](30)
	, @H_Col21	[nvarchar](30)
	, @H_Col22	[nvarchar](30)
	, @H_Col23	[nvarchar](30)
	, @H_Col24	[nvarchar](30)
	, @H_Col25	[nvarchar](30)
	, @H_Col26	[nvarchar](30)
	, @H_Col27	[nvarchar](30)
	, @H_Col28	[nvarchar](30)
	, @H_Col29	[nvarchar](30)
	, @H_Col30	[nvarchar](30)
	, @H_Col31	[nvarchar](30)
	, @H_Col32	[nvarchar](30)
	, @H_Col33	[nvarchar](30)
	, @H_Col34	[nvarchar](30)
	, @H_Col35	[nvarchar](30)
	, @H_Col36	[nvarchar](30)
	, @H_Col37	[nvarchar](30)
	, @H_Col38	[nvarchar](30)
	, @H_Col39	[nvarchar](30)
	, @H_Col40	[nvarchar](30)
	, @H_Col41	[nvarchar](30)
	, @H_Col42	[nvarchar](30)
	, @H_Col43	[nvarchar](30)
	, @H_Col44	[nvarchar](30)
	, @H_Col45	[nvarchar](30)
	, @H_Col46	[nvarchar](30)
	, @H_Col47	[nvarchar](30)
	, @H_Col48	[nvarchar](30)
	, @H_Col49	[nvarchar](30)
	, @H_Col50	[nvarchar](30)
	, @H_Col51	[nvarchar](30)
	, @H_Col52	[nvarchar](30)
	, @H_Col53	[nvarchar](30)
	, @H_Col54	[nvarchar](30)
	, @H_Col55	[nvarchar](30)
	, @H_Col56	[nvarchar](30)
	, @H_Col57	[nvarchar](30)
	, @H_Col58	[nvarchar](30)
	, @H_Col59	[nvarchar](30)
	, @H_Col60	[nvarchar](30)

BEGIN TRANSACTION

DELETE FROM erpp_export_line WHERE SessionId = @PSessionId

SET @lSeq = 0


-- IV
SET @x_col001 = 'B'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT @x_col001
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView
WHERE DocType = 'I'
	and YEAR(InvDate) = @pYear
	and ISNULL(CustSlsman,@LowChar) BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)

-- DO
SET @x_col001 = 'A'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT @x_col001
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView e
LEFT JOIN co ON co.co_num = e.CoNum
WHERE DocType = 'D'
	and YEAR(InvDate) = @pYear
	and ISNULL(CustSlsman,@LowChar) BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
	AND (@BU IS NULL OR co.Uf_BU = @BU)
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)

-- New Item / Local
SET @x_col001 = 'C'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT 'C'
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView
WHERE DocType in ('I')
	and YEAR(InvDate) = @pYear
	and ISNULL(YEAR(ItemRegisterDate),@pYear) = @pYear --and NewItem = 1
	and ISNULL(CustOverseas,0) = 0
	and ISNULL(CustSlsman,@LowChar) BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)

-- New Item / Overseas
SET @x_col001 = 'D'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT 'D'
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView
WHERE DocType in ('I')
	and YEAR(InvDate) = @pYear
	and ISNULL(YEAR(ItemRegisterDate),@pYear) = @pYear --and NewItem = 1
	and ISNULL(CustOverseas,0) = 1
	and ISNULL(CustSlsman,@LowChar) BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)


-- Quotation / Local
SET @x_col001 = 'E'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT 'E'
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView e
LEFT JOIN ERPP_SK_Quotation q ON e.InvNum = q.qt_num AND q.rfq_revision = 0
WHERE DocType = 'Q'
	and YEAR(InvDate) = @pYear
	and ISNULL(CustOverseas,0) = 0
	and ISNULL(CustSlsman,@LowChar) BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
	AND (@BU IS NULL OR q.Uf_UnitCode3 = @BU)
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)

-- Quotation / Overseas
SET @x_col001 = 'F'
SET @x_col002 = '0.00'
SET @x_col003 = '0.00'
SET @x_col004 = '0.00'
SET @x_col005 = '0.00'
SET @x_col006 = '0.00'
SET @x_col007 = '0.00'
SET @x_col008 = '0.00'
SET @x_col009 = '0.00'
SET @x_col010 = '0.00'
SET @x_col011 = '0.00'
SET @x_col012 = '0.00'
SET @x_col013 = '0.00'
SET @x_col014 = '0.00'
SET @x_col015 = '0.00'
SET @x_col016 = '0.00'
SET @x_col017 = '0.00'
SET @x_col018 = '0.00'
SET @x_col019 = ''
SET @x_col020 = ''
SET @x_col021 = ''
SET @x_col022 = ''
SET @x_col023 = ''
SET @x_col024 = ''
SET @x_col025 = ''
SET @x_col026 = ''
SET @x_col027 = ''
SET @x_col028 = ''
SET @x_col029 = ''
SET @x_col030 = ''
SET @x_col031 = ''
SET @x_col032 = ''
SET @x_col033 = ''
SET @x_col034 = ''
SET @x_col035 = ''
SET @x_col036 = ''
SET @x_col037 = ''
SET @x_col038 = ''
SET @x_col039 = ''
SET @x_col040 = ''
SET @x_col041 = ''
SET @x_col042 = ''
SET @x_col043 = ''
SET @x_col044 = ''
SET @x_col045 = ''
SET @x_col046 = ''
SET @x_col047 = ''
SET @x_col048 = ''
SET @x_col049 = ''
SET @x_col050 = ''
SET @x_col051 = ''
SET @x_col052 = ''
SET @x_col053 = ''
SET @x_col054 = ''
SET @x_col055 = ''
SET @x_col056 = ''
SET @x_col057 = ''
SET @x_col058 = ''
SET @x_col059 = ''
SET @x_col060 = ''

SET @x_grp001 = ''
SET @x_grp002 = ''
SET @x_grp003 = ''
SET @x_grp004 = ''
SET @x_grp005 = ''

DECLARE data_cursor CURSOR LOCAL STATIC FOR
SELECT 'F'
	,CAST(YEAR(InvDate) AS NVARCHAR(5))
	,CAST(MONTH(InvDate) AS NVARCHAR(5))
	,CAST(CAST(SUM(ISNULL(NetAmount,0)) AS DECIMAL(18,2)) AS NVARCHAR(20))
FROM ERPP_ExpKQIAutomotivePlantDetailView e
LEFT JOIN ERPP_SK_Quotation q ON e.InvNum = q.qt_num AND q.rfq_revision = 0
WHERE DocType = 'Q'
	and YEAR(InvDate) = @pYear
	and ISNULL(CustOverseas,0) = 1
	and CustSlsman BETWEEN @pSlsManStarting and @pSlsManEnding
	and CustNum BETWEEN @pCustNumStarting and @pCustNumEnding
	and ISNULL(CustOverseas,0) = CASE WHEN @pCustLocalOverseas = 'L' THEN 0 ELSE CASE WHEN @pCustLocalOverseas = 'O' THEN 1 ELSE ISNULL(CustOverseas,0) END END
	and ((@pCustNewCurrRegis = 'A') Or (@pCustNewCurrRegis = 'N' and ISNULL(YEAR(CustRegisterDate),@pYear) = @pYear) Or (@pCustNewCurrRegis = 'C' and ISNULL(YEAR(CustRegisterDate),@pYear) < @pYear))
	AND (@BU IS NULL OR q.Uf_UnitCode3 = @BU)
GROUP BY YEAR(InvDate),MONTH(InvDate)

OPEN data_cursor
WHILE 1 = 1
BEGIN
	FETCH data_cursor INTO @H_Col01
					, @H_Col02
					, @H_Col03
					, @H_Col04

	IF @@FETCH_STATUS != 0 BREAK

	IF @H_Col03 = '1'
		SET @x_col002 = @H_Col04
	ELSE IF @H_Col03 = '2'
		SET @x_col003 = @H_Col04
	ELSE IF @H_Col03 = '3'
		SET @x_col004 = @H_Col04
	ELSE IF @H_Col03 = '4'
		SET @x_col006 = @H_Col04
	ELSE IF @H_Col03 = '5'
		SET @x_col007 = @H_Col04
	ELSE IF @H_Col03 = '6'
		SET @x_col008 = @H_Col04
	ELSE IF @H_Col03 = '7'
		SET @x_col010 = @H_Col04
	ELSE IF @H_Col03 = '8'
		SET @x_col011 = @H_Col04
	ELSE IF @H_Col03 = '9'
		SET @x_col012 = @H_Col04
	ELSE IF @H_Col03 = '10'
		SET @x_col014 = @H_Col04
	ELSE IF @H_Col03 = '11'
		SET @x_col015 = @H_Col04
	ELSE IF @H_Col03 = '12'
		SET @x_col016 = @H_Col04

END
CLOSE data_cursor
DEALLOCATE data_cursor

SET @x_col005 = CAST(@x_col002 AS DECIMAL(18,2)) + CAST(@x_col003 AS DECIMAL(18,2)) + CAST(@x_col004 AS DECIMAL(18,2))
SET @x_col009 = CAST(@x_col006 AS DECIMAL(18,2)) + CAST(@x_col007 AS DECIMAL(18,2)) + CAST(@x_col008 AS DECIMAL(18,2))
SET @x_col013 = CAST(@x_col010 AS DECIMAL(18,2)) + CAST(@x_col011 AS DECIMAL(18,2)) + CAST(@x_col012 AS DECIMAL(18,2))
SET @x_col017 = CAST(@x_col014 AS DECIMAL(18,2)) + CAST(@x_col015 AS DECIMAL(18,2)) + CAST(@x_col016 AS DECIMAL(18,2))
SET @x_col018 = CAST(@x_col005 AS DECIMAL(18,2)) + CAST(@x_col009 AS DECIMAL(18,2)) + CAST(@x_col013 AS DECIMAL(18,2)) + CAST(@x_col017 AS DECIMAL(18,2))

SET @lSeq = @lSeq + 1
INSERT INTO [dbo].[erpp_export_line](
	[SessionId]
	,[line_type]
	,[seq]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
) VALUES (
	@PSessionId
	, 'L'
	, @lSeq
	, @x_col001
	, @x_col002
	, @x_col003
	, @x_col004
	, @x_col005
	, @x_col006
	, @x_col007
	, @x_col008
	, @x_col009
	, @x_col010
	, @x_col011
	, @x_col012
	, @x_col013
	, @x_col014
	, @x_col015
	, @x_col016
	, @x_col017
	, @x_col018
)

DELETE FROM [erpp_exp_kqi_for_sales] where SessionId = @PSessionId
INSERT INTO [erpp_exp_kqi_for_sales](
	[SessionId]
	,[title]
	,[col001]
	,[col002]
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
)
SELECT [SessionId]
	,CASE WHEN [col001] = 'A' THEN 'รวมมูลค่ายอดขาย DO'
		  WHEN [col001] = 'B' THEN 'รวมมูลค่ายอดขาย IV'
		  WHEN [col001] = 'C' THEN 'มูลค่ารายการใหม่ที่ขายได้ในประเทศ'
		  WHEN [col001] = 'D' THEN 'มูลค่ารายการใหม่ที่ขายได้ต่างประเทศ'
		  WHEN [col001] = 'E' THEN 'มูลค่า Quotation ที่เสนอราคาต่อเดือนในประเทศ'
		  WHEN [col001] = 'F' THEN 'มูลค่า Quotation ที่เสนอราคาต่อเดือนต่างประเทศ'
		  END as [title]
	,[col001]
	,[col002] -- CAST([col002] AS DECIMAL(18,2))
	,[col003]
	,[col004]
	,[col005]
	,[col006]
	,[col007]
	,[col008]
	,[col009]
	,[col010]
	,[col011]
	,[col012]
	,[col013]
	,[col014]
	,[col015]
	,[col016]
	,[col017]
	,[col018]
FROM [erpp_export_line]
WHERE SessionId = @PSessionId


SET @Infobar = 'Export Complete.'


select * from [erpp_export_line] where SessionId = @PSessionId

EOF:

IF @Severity <> 0
    ROLLBACK TRANSACTION
ELSE
    COMMIT TRANSACTION
  
EOF2:

RETURN @Severity




GO



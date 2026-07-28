/****** Object:  StoredProcedure [dbo].[GEN_Rpt_QuotationReportSp]    Script Date: 24/07/2026 2:01:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[GEN_Rpt_QuotationReportSp](
  @qtNumS NVARCHAR(15) = NULL
, @qtNumE NVARCHAR(15) = NULL
, @qtdateS  DateType   = NULL
, @qtdateE  DateType   = NULL
, @Revision int        = NULL
, @Decimal  int        = NULL
)AS

--DECLARE
--  @qtNumS   NVARCHAR(15) = 'SKQA22-016'
--, @qtNumE   NVARCHAR(15) = 'SKQA22-016'
--, @qtdateS  DateType   = NULL--'2019-03-04 18:32:55.717'
--, @qtdateE  DateType   = NULL--'2019-03-04 00:00:00.000'
--, @Revision int        = 0
--, @Decimal  int        = 2

SET @qtNumS  = ISNULL(@qtNumS, dbo.LowCharacter())
SET @qtNumE  = ISNULL(@qtNumE, dbo.HighCharacter())

--SET @customerS  = ISNULL(@customerS, dbo.LowString('CustNumType'))
--SET @customerE  = ISNULL(@customerE, dbo.HighString('CustNumType'))

EXEC dbo.ApplyDateTimeOffsetSp @qtdateS OUTPUT ,NULL , 0
EXEC dbo.ApplyDateTimeOffsetSp @qtdateE OUTPUT ,NULL , 1



SELECT 
	------------- Head Report ---------
	ROW_NUMBER() OVER(ORDER BY qt.qt_num,qt.rfq_revision ASC) AS RowNo
	,qt.qt_num
	,qt.rfq_revision
	,qt.qt_date
	,qt.cust_num
	,qt.cust_seq
	,qt.cust_type
	,qt.qt_from
	,emp.fname + ' ' + emp.lname as qtFromName
	,qt.qt_cc
	
	------------- Item ------------
	,ROW_NUMBER() OVER(PARTITION BY qt.rfq_revision ORDER BY qt.qt_num ASC) AS RowRev
	,qtLine.rfq_line
	,qtLine.part_name
	,qtLine.cust_part_num
	,qtLine.size
	,qtLine.hardness
	,qtLine.color
	,qtLine.material
	,qtLine.volume
	,qtLine.vol1	
	,qtLine.vol2
	,qtLine.vol3
	,qtLine.unit_price
	,qtLine.tooling_price
	,qtLine.cavities
	,qtLine.tooling_mat
	,qtLine.LT_offtool_samp
	,qtLine.LT_mass_prod
	,qtLine.max_capacity

	--Raf 27/11/2019
	,qtLine.Uf_ERPP_No_of_Cavities1 as cavities1
	,qtLine.Uf_ERPP_No_of_Cavities2 as cavities2
	,qtLine.Uf_ERPP_No_of_Cavities3 as cavities3
	,qtLine.UF_ERPP_Tooling_Price1 as tooling_price1
	,qtLine.UF_ERPP_Tooling_Price2 as tooling_price2
	,qtLine.UF_ERPP_Tooling_Price3 as tooling_price3
	,ISNULL(CAST(qtLine.Uf_ERPP_Unit_Price1 as decimal(18,4)),0) as unit_price1
	,ISNULL(CAST(qtLine.Uf_ERPP_Unit_Price2 as decimal(18,4)),0) as unit_price2
	,ISNULL(CAST(qtLine.Uf_ERPP_Unit_Price3 as decimal(18,4)),0) as unit_price3
	
	------------- Testing ------------
	, qtLine.test_topic1 
    , qtLine.test_method1 
    , qtLine.test_value1 
    , LTRIM(qtLine.tested_by1) tested_by1
    , qtLine.test_cost1 
    , qtLine.test_topic2 
    , qtLine.test_method2 
    , qtLine.test_value2 
    , LTRIM(qtLine.tested_by2) tested_by2
    , qtLine.test_cost2 
    , qtLine.test_topic3 
    , qtLine.test_method3 
    , qtLine.test_value3 
    , LTRIM(qtLine.tested_by3) tested_by3
    , qtLine.test_cost3 
	
	------------- Detail ------------
	,qt.prices_base_on
	,qt.exch_rate
	,qt.curr_code
	--,(select TOP(1) curr.buy_rate from currate_mst curr 
	--	where qt.curr_code=curr.from_curr_code AND curr.to_curr_code = 'THB'
	--	ORDER BY eff_date DESC) AS exch_rate
	
	--,curr.curr.buy_rate AS exch_rate
	--,qt.packing as pack
	,udf3.Description as packing
	,qt.payment_method AS payMetDesc
	,qt.term_products
	,qt.term_tooling
	,qt.remark
	,qt.eff_date
	,qt.name_from
	,qt.title_from
	--Raf 27/11/2019
	,qt.Uf_ERPP_price_range as price_range
	,qt.Uf_ERPP_prices_base_on as price_base_on
	,rfq.Uf_ERPP_PTTooling as Tooling_new
	

	--,udtvTF.description nameFrom
	--,curr.from_curr_code
	--,curr.buy_rate
	--,MAX(curr.eff_date)
	, (SELECT top 1 buy_rate FROM currate_mst curr
		WHERE curr.to_curr_code = 'THB' AND qt.curr_code=curr.from_curr_code
		ORDER BY curr.eff_date DESC) AS buyRate
	,cust.custName custTo
	,cust.custContactName custCont
	
		-------- DESC --------
	,(SELECT udtv.description FROM UserDefinedTypeValues udtv where qt.name_from = udtv.Value AND TypeName='ERPP_Namefrom') AS nameFrom
	,(SELECT udtv.description FROM UserDefinedTypeValues udtv where qt.title_from = udtv.Value AND TypeName='ERPP_Titlefrom') AS titleFrom
	,(SELECT udtv.description FROM UserDefinedTypeValues udtv where qt.remark = udtv.Value AND TypeName='ERPP_Remark') AS remarkDesc
	,qt.Uf_ERPP_Remark2Line as remarkDesc2
	,(SELECT udtv.description FROM UserDefinedTypeValues udtv where qt.packing = udtv.Value AND TypeName='ERPP_Packing') AS packDesc
	--,(SELECT udtv.description FROM UserDefinedTypeValues udtv where qt.payment_method = udtv.Value AND TypeName='ERPP_SK_PaymentMethod') AS payMetDesc
	,(SELECT term.description FROM terms_mst term where qt.term_products = term.terms_code ) AS termProDesc
	,(SELECT term.description FROM terms_mst term where qt.term_tooling = term.terms_code ) AS termToolDesc

	,udf.Description Namefrom
	,udf2.Description Titlefrom
	,qtLine.Uf_ERPP_UmVolume Umvolume
	,qtLine.Uf_ERPP_PunchDie PunchDie
	,ISNULL(rfqi.vol1, 0) RfqVol1
	,ISNULL(rfqi.vol2, 0) RfqVol2
	,ISNULL(rfqi.vol3, 0) RfqVol3
	,@Decimal as DC
	, CASE WHEN qt.Uf_Approved = 1 THEN qt.Uf_Signature ELSE NULL END [Signature]
	, qtLine.Uf_Image1 Image1
	, CASE 
		WHEN qtLine.Uf_Image1 IS NULL THEN 0
		ELSE 1
		END AS HasImage
	, qt.Uf_Project Project
	, qt.Uf_DelDueDate DelDueDate
FROM ERPP_SK_Quotation qt
LEFT JOIN ERPP_SK_QuotationLine qtLine ON qt.qt_num = qtLine.qt_num  AND qt.rfq_revision=qtLine.rfq_rev
LEFT JOIN ERPP_CustomerProspectIDOViews cust ON LTRIM(qt.cust_num) = LTRIM(cust.custNum) AND qt.cust_type = cust.custType
LEFT JOIN employee_mst emp ON LTRIM(qt.qt_from) = LTRIM(emp.emp_num)
--Raf  27/11/2019
LEFT JOIN ERPP_rfq rfq ON rfq.rfq_num = qt.qt_num and rfq.rfq_rev = qt.rfq_revision
LEFT JOIN ERPP_rfqitem rfqi ON rfqi.rfq_num = qtLine.qt_num and rfqi.rfq_rev = qtLine.rfq_rev and rfqi.rfq_line = qtLine.rfq_line
LEFT JOIN UserDefinedTypeValues udf ON udf.Value = qt.Uf_ERPP_namefrom and udf.TypeName = 'ERPP_Nameform_R'
LEFT JOIN UserDefinedTypeValues udf2 ON udf2.Value = qt.Uf_ERPP_titlefrom and udf2.TypeName = 'ERPP_Titlefrom_R'
LEFT JOIN UserDefinedTypeValues udf3 ON udf3.Value = qt.packing and udf3.TypeName = 'ERPP_Packing_R'


WHERE qt.qt_num BETWEEN @qtNumS AND @qtNumE
AND ISNULL(CONVERT(DATE,qt.qt_date),'') BETWEEN CONVERT(DATE,@qtdateS) AND CONVERT(DATE,@qtdateE)
and qt.rfq_revision = @Revision




--LEFT JOIN UserDefinedTypeValues udtvNF on qt.name_from = udtvNF.Value AND TypeName='ERPP_SK_QT_Namefrom'
--LEFT JOIN UserDefinedTypeValues udtvTF on qt.title_from = udtvTF.Value AND TypeName='ERPP_SK_QT_Titlefrom'


--select * from UserDefinedTypeValues where TypeName='ERPP_SK_QT_Namefrom' AND Value
--(SELECT top 1 curr.from_curr_code FROM currate_mst curr
--WHERE qt.curr_code=curr.from_curr_code ORDER BY curr.eff_date DESC )  AND curr.to_curr_code = 'THB' 


--FROM ERPP_rfq rfq
--	LEFT JOIN ERPP_rfqitem rfqitem ON rfq.rfq_num = rfqitem.rfq_num
--	LEFT JOIN ERPP_CustomerProspectIDOViews cust ON LTRIM(rfq.cust_num) = LTRIM(cust.custNum) AND rfq.cust_type = cust.custType
--	LEFT JOIN custaddr_mst dm ON LTRIM(rfq.cust_num) = LTRIM(dm.cust_num) AND dm.cust_seq = 0
--	LEFT JOIN employee_mst emp ON LTRIM(rfq.issue_by) = LTRIM(emp.emp_num)

--group by curr.eff_date
--	--AND rfq.cust_num BETWEEN @customerS AND @customerE
GO



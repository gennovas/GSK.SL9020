 
ALTER VIEW [dbo].[ERPP_ExpKQIAutomotivePlantDetailView]
AS

SELECT 'I' as DocType
	, ISNULL(co.slsman,cs.slsman) as CustSlsman
	, inv_hdr.cust_num as CustNum
	, cs.cust_type as CustType
	, CASE WHEN LEFT(inv_hdr.cust_num,2) = 'EX' THEN 1 ELSE 0 END as CustOverseas
	, inv_hdr.inv_date as InvDate
	, inv_hdr.inv_num as InvNum
	, 0 as InvAmount
	, 0 as InvVat
	, 0 as InvAmtIncVat
	--, ((ISNULL(artran.Amount,0) + ISNULL(artran.misc_charges,0) + ISNULL(artran.freight,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvAmount    
	--, ((ISNULL(artran.sales_tax,0) + ISNULL(artran.sales_tax_2,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvVat    
	--, ((ISNULL(artran.Amount,0) + ISNULL(artran.misc_charges,0) + ISNULL(artran.freight,0) + isnull(artran.sales_tax,0) + ISNULL(artran.sales_tax_2,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvAmtIncVat
	, inv_item.co_num as CoNum
	, inv_item.co_line as CoLine
	, inv_item.co_release as CoRelease
	, inv_item.item as Item
	, inv_item.qty_invoiced as QtyInvoiced
	--, inv_item.disc as Disc
	, (inv_item.price * ISNULL(inv_hdr.exch_rate,1)) as Price
	, (((inv_item.price) * inv_item.qty_invoiced) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(inv_hdr.exch_rate,1) as NetAmountNonDisc
	, (((inv_item.price) * inv_item.qty_invoiced) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(inv_hdr.exch_rate,1) as NetAmountInclDiscLine
	, ROUND( (((inv_item.price * inv_item.qty_invoiced) - ((inv_item.price * inv_item.qty_invoiced) * (ISNULL(inv_hdr.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(inv_hdr.exch_rate,1) ,2) as NetAmount
	--, (((inv_item.price * inv_item.qty_invoiced) - ((inv_item.price * inv_item.qty_invoiced) * (ISNULL(inv_hdr.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(inv_hdr.exch_rate,1) as NetAmount
	, 'MAIN' as Whse
	, ISNULL(cs.Uf_SKP_Customers_RegisDate,cs.CreateDate) as CustRegisterDate
	, ISNULL(item.Uf_regis_date,item.CreateDate) as ItemRegisterDate
	, 0 as NewCustomer
	, 0 as NewItem
	, inv_hdr.site_ref as SiteRef
	, co.include_tax_in_price as IncludeTaxInPrice
	, co.tax_code1 as TaxCode
	, ISNULL(taxcode.tax_rate,0) as TaxRate
	, co.Uf_BU BU
FROM inv_item_mst inv_item
 LEFT OUTER JOIN inv_hdr_mst inv_hdr ON inv_hdr.inv_num = inv_item.inv_num and inv_hdr.inv_seq = inv_item.inv_seq  and inv_hdr.site_ref = inv_item.site_ref --and inv_hdr.cust_num = inv_item.cust_num
 LEFT OUter JOIN (
	SELECT inv_num as InvNum
		, type as InvType
	FROM arinv_mst arinv
	WHERE type = 'I'
	UNION
	SELECT inv_num as InvNum
		, type as InvType
	FROM artran_mst artran
	WHERE type = 'I'
 ) artran ON artran.InvNum = inv_hdr.inv_num
 --LEFT OUTER JOIN artran_mst artran ON inv_item.inv_num = artran.inv_num and inv_item.inv_seq = artran.inv_seq and inv_item.site_ref = artran.site_ref
 LEFT OUTER JOIN co_mst co ON co.co_num = inv_item.co_num and co.site_ref = inv_item.site_ref
 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = inv_hdr.cust_num and cs.cust_seq = 0 and cs.site_ref = inv_hdr.site_ref
 LEFT OUTER JOIN item_mst item ON item.item = inv_item.item and item.site_ref = inv_item.site_ref
 LEFT OUTER JOIN taxcode_mst taxcode ON taxcode.tax_code = co.tax_code1 and taxcode.site_ref = co.site_ref
WHERE artran.InvType = 'I'
 --and artran.site_ref = 'TrainX'
 --and artran.inv_num = '         2'


UNION

SELECT 'I' as DocType
	, cs.slsman as CustSlsman
	, inv_hdr.cust_num as CustNum
	, cs.cust_type as CustType
	, CASE WHEN LEFT(inv_hdr.cust_num,2) = 'EX' THEN 1 ELSE 0 END as CustOverseas
	, inv_hdr.inv_date as InvDate
	, inv_hdr.inv_num as InvNum
	, 0 as InvAmount
	, 0 as InvVat
	, 0 as InvAmtIncVat
	--, ((ISNULL(artran.Amount,0) + ISNULL(artran.misc_charges,0) + ISNULL(artran.freight,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvAmount    
	--, ((ISNULL(artran.sales_tax,0) + ISNULL(artran.sales_tax_2,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvVat    
	--, ((ISNULL(artran.Amount,0) + ISNULL(artran.misc_charges,0) + ISNULL(artran.freight,0) + isnull(artran.sales_tax,0) + ISNULL(artran.sales_tax_2,0)) * (CASE WHEN CHARINDEX(artran.Type, 'PC') > 0 THEN -1 ELSE 1 END)) AS InvAmtIncVat
	, inv_item.co_num as CoNum
	, inv_item.co_line as CoLine
	, inv_item.co_release as CoRelease
	, inv_item.item as Item
	, inv_item.qty_invoiced as QtyInvoiced
	--, inv_item.disc as Disc
	, (inv_item.price * ISNULL(inv_hdr.exch_rate,1)) as Price
	, (((inv_item.price) * inv_item.qty_invoiced) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(inv_hdr.exch_rate,1) as NetAmountNonDisc
	, (((inv_item.price) * inv_item.qty_invoiced) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(inv_hdr.exch_rate,1) as NetAmountInclDiscLine
	, ROUND( (((inv_item.price * inv_item.qty_invoiced) - ((inv_item.price * inv_item.qty_invoiced) * (ISNULL(inv_hdr.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(inv_hdr.exch_rate,1) ,2) as NetAmount
	--, (((inv_item.price * inv_item.qty_invoiced) - ((inv_item.price * inv_item.qty_invoiced) * (ISNULL(inv_hdr.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(inv_hdr.exch_rate,1)  as NetAmount
	, 'MAIN' as Whse
	, ISNULL(cs.Uf_SKP_Customers_RegisDate,cs.CreateDate) as CustRegisterDate
	, ISNULL(item.Uf_regis_date,item.CreateDate) as ItemRegisterDate
	, 0 as NewCustomer
	, 0 as NewItem
	, inv_hdr.site_ref as SiteRef
	, co.include_tax_in_price as IncludeTaxInPrice
	, co.tax_code1 as TaxCode
	, ISNULL(taxcode.tax_rate,0) as TaxRate
	, co.Uf_BU BU
FROM inv_item_mst inv_item
 LEFT OUTER JOIN inv_hdr_mst inv_hdr ON inv_hdr.inv_num = inv_item.inv_num and inv_hdr.inv_seq = inv_item.inv_seq  and inv_hdr.site_ref = inv_item.site_ref --and inv_hdr.cust_num = inv_item.cust_num
 LEFT OUter JOIN (
	SELECT inv_num as InvNum
		, type as InvType
	FROM arinv_mst arinv
	WHERE type in ('C','D')
	UNION
	SELECT inv_num as InvNum
		, type as InvType
	FROM artran_mst artran
	WHERE type in ('C','D')
 ) artran ON artran.InvNum = inv_hdr.inv_num
 --LEFT OUTER JOIN artran_mst artran ON inv_item.inv_num = artran.inv_num and inv_item.inv_seq = artran.inv_seq and inv_item.site_ref = artran.site_ref
 LEFT OUTER JOIN rma_mst co ON co.rma_num = inv_item.co_num and co.site_ref = inv_item.site_ref
 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = inv_hdr.cust_num and cs.cust_seq = 0 and cs.site_ref = inv_hdr.site_ref
 LEFT OUTER JOIN item_mst item ON item.item = inv_item.item and item.site_ref = inv_item.site_ref
 LEFT OUTER JOIN taxcode_mst taxcode ON taxcode.tax_code = co.tax_code1 and taxcode.site_ref = co.site_ref
WHERE artran.InvType in ('C','D')
 --and artran.site_ref = 'TrainX'
 --and artran.inv_num = '         2'


UNION

SELECT 'D' as DocType
	, ISNULL(co.slsman,cs.slsman) as CustSlsman
	, co.cust_num as CustNum
	, cs.cust_type as CustType
	, CASE WHEN LEFT(co.cust_num,2) = 'EX' THEN 1 ELSE 0 END as CustOverseas
	, co.order_date as InvDate
	, coitem.co_num as InvNum
	, (ISNULL(co.price,0) - ISNULL(co.sales_tax,0)) * ISNULL(co.exch_rate,1) AS InvAmount    
	, ISNULL(co.sales_tax,0) * ISNULL(co.exch_rate,1) AS InvVat    
	, ISNULL(co.price,0) * ISNULL(co.exch_rate,1) AS InvAmtIncVat
	, coitem.co_num as CoNum
	, coitem.co_line as CoLine
	, coitem.co_release as CoRelease
	, coitem.item as Item
	, (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0)) as QtyInvoiced
	--, inv_item.disc as Disc
	, (coitem.price * ISNULL(co.exch_rate,1)) as Price
	, ((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(co.exch_rate,1) as NetAmountNonDisc
	, (((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) - ((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) * (ISNULL(coitem.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(co.exch_rate,1) as NetAmountInclDiscLine
	--, (((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) - ((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) * (ISNULL(coitem.disc,0) / 100.00))) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(co.exch_rate,1) as NetAmount
	, ((coitem2.NetAmountIncDiscLine - (coitem2.NetAmountIncDiscLine * (ISNULL(co.disc,0) / 100.00))) * (CASE WHEN ISNULL(co.include_tax_in_price,0) = 1 THEN ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0))) ELSE 1 END)) * ISNULL(co.exch_rate,1) as NetAmount
	, coitem.whse as Whse
	, ISNULL(cs.Uf_SKP_Customers_RegisDate,cs.CreateDate) as CustRegisterDate
	, ISNULL(item.Uf_regis_date,item.CreateDate) as ItemRegisterDate
	, 0 as NewCustomer
	, 0 as NewItem
	, coitem.site_ref as SiteRef
	, co.include_tax_in_price as IncludeTaxInPrice
	, co.tax_code1 as TaxCode
	, ISNULL(taxcode.tax_rate,0) as TaxRate
	, co.Uf_BU BU
FROM coitem_mst coitem
 LEFT OUTER JOIN (
	SELECT coitem.co_num as CoNum
		, coitem.co_line as CoLine
		, coitem.co_release as CoRelease
		, (((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) - ((coitem.price * (coitem.qty_ordered - ISNULL(coitem.qty_invoiced,0))) * (ISNULL(coitem.disc,0) / 100.00)))) as NetAmountIncDiscLine
	FROM coitem_mst coitem
	 LEFT OUTER JOIN co_mst co ON co.co_num = coitem.co_num and co.site_ref = coitem.site_ref
	 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = co.cust_num and cs.cust_seq = 0 and cs.site_ref = co.site_ref
	 LEFT OUTER JOIN item_mst item ON item.item = coitem.item and item.site_ref = coitem.site_ref
	 LEFT OUTER JOIN taxcode_mst taxcode ON taxcode.tax_code = co.tax_code1 and taxcode.site_ref = co.site_ref
WHERE co.type = 'R'
 ) coitem2 ON coitem2.CoNum = coitem.co_num and coitem2.CoLine = coitem.co_line and coitem2.CoRelease = coitem.co_release
 LEFT OUTER JOIN co_mst co ON co.co_num = coitem.co_num and co.site_ref = coitem.site_ref
 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = co.cust_num and cs.cust_seq = 0 and cs.site_ref = co.site_ref
 LEFT OUTER JOIN item_mst item ON item.item = coitem.item and item.site_ref = coitem.site_ref
 LEFT OUTER JOIN taxcode_mst taxcode ON taxcode.tax_code = co.tax_code1 and taxcode.site_ref = co.site_ref
WHERE co.type = 'R'
 and co.stat = 'O'
 and coitem.stat in ('O','F')
 --and co.co_num NOT IN (SELECT co_num FROM coitem_mst WHERE qty_invoiced <> 0)
 --and coitem.site_ref = 'TrainX'

UNION

SELECT 'D' as DocType
	, ISNULL(co.slsman,cs.slsman) as CustSlsman
	, co.cust_num as CustNum
	, cs.cust_type as CustType
	, CASE WHEN LEFT(co.cust_num,2) = 'EX' THEN 1 ELSE 0 END as CustOverseas
	, co.order_date as InvDate
	, coitem.co_num as InvNum
	, (ISNULL(co.price,0) - ISNULL(co.sales_tax,0)) * ISNULL(co.exch_rate,1) AS InvAmount    
	, ISNULL(co.sales_tax,0) * ISNULL(co.exch_rate,1) AS InvVat    
	, ISNULL(co.price,0) * ISNULL(co.exch_rate,1) AS InvAmtIncVat
	, coitem.co_num as CoNum
	, coitem.co_line as CoLine
	, 0 as CoRelease
	, coitem.item as Item
	, coitem.blanket_qty as QtyInvoiced
	--, inv_item.disc as Disc
	, coitem.cont_price * ISNULL(co.exch_rate,1) as Price
	, ((coitem.cont_price * coitem.blanket_qty) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(co.exch_rate,1) as NetAmountNonDisc
	, ((coitem.cont_price * coitem.blanket_qty) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(co.exch_rate,1) as NetAmountInclDiscLine
	, ((coitem.cont_price * coitem.blanket_qty) * ( 100.00 / (100 + ISNULL(taxcode.tax_rate,0)))) * ISNULL(co.exch_rate,1) as NetAmount
	, 'MAIN' as Whse
	, ISNULL(cs.Uf_SKP_Customers_RegisDate,cs.CreateDate) as CustRegisterDate
	, ISNULL(item.Uf_regis_date,item.CreateDate) as ItemRegisterDate
	, 0 as NewCustomer
	, 0 as NewItem
	, coitem.site_ref as SiteRef
	, co.include_tax_in_price as IncludeTaxInPrice
	, co.tax_code1 as TaxCode
	, ISNULL(taxcode.tax_rate,0) as TaxRate
	, co.Uf_BU BU
FROM co_bln_mst coitem
 LEFT OUTER JOIN co_mst co ON co.co_num = coitem.co_num and co.site_ref = coitem.site_ref
 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = co.cust_num and cs.cust_seq = 0 and cs.site_ref = co.site_ref
 LEFT OUTER JOIN item_mst item ON item.item = coitem.item and item.site_ref = coitem.site_ref
 LEFT OUTER JOIN taxcode_mst taxcode ON taxcode.tax_code = co.tax_code1 and taxcode.site_ref = co.site_ref
WHERE co.type = 'B'
 --and co.co_num NOT IN (SELECT co_num FROM coitem_mst WHERE qty_invoiced <> 0)
 --and coitem.site_ref = 'TrainX'



UNION


SELECT 'Q' as DocType
	, ISNULL(slsman.slsman,cs.slsman) as CustSlsman
	, co.cust_num as CustNum
	, cs.cust_type as CustType
	, CASE WHEN LEFT(co.cust_num,2) = 'EX' THEN 1 ELSE 0 END as CustOverseas
	, co.qt_date as InvDate
	, coitem.qt_num as InvNum
	, 0 AS InvAmount
	, 0 AS InvVat    
	, 0 AS InvAmtIncVat
	--, ISNULL(co.price,0) - ISNULL(co.sales_tax,0) AS InvAmount    
	--, ISNULL(co.sales_tax,0) AS InvVat    
	--, ISNULL(co.price,0) AS InvAmtIncVat
	, coitem.qt_num as CoNum
	, coitem.rfq_line as CoLine
	, 0 as CoRelease
	, coitem.cust_part_num as Item
	, rfqitem.vol1 as QtyInvoiced
	--, inv_item.disc as Disc
	, coitem.Uf_ERPP_Unit_Price1 * ISNULL(co.exch_rate,0) as Price
	, (coitem.Uf_ERPP_Unit_Price1 * rfqitem.vol1) * ISNULL(co.exch_rate,0) as NetAmountNonDisc
	, (coitem.Uf_ERPP_Unit_Price1 * rfqitem.vol1) * ISNULL(co.exch_rate,0) as NetAmountInclDiscLine
	, (coitem.Uf_ERPP_Unit_Price1 * rfqitem.vol1) * ISNULL(co.exch_rate,0) as NetAmount
	, 'MAIN' as Whse
	, NULL as CustRegisterDate
	, ISNULL(item.Uf_regis_date,item.CreateDate) as ItemRegisterDate
	, 0 as NewCustomer
	, 0 as NewItem
	, NULL as SiteRef
	, 0 as IncludeTaxInPrice
	, NULL as TaxCode
	, 0 as TaxRate
	, co.Uf_UnitCode3 BU
FROM ERPP_SK_QuotationLine coitem
 LEFT OUTER JOIN ERPP_rfqitem rfqitem ON rfqitem.rfq_num = coitem.qt_num AND rfqitem.rfq_rev = coitem.rfq_rev AND rfqitem.rfq_line = coitem.rfq_line
 LEFT OUTER JOIN ERPP_SK_Quotation co ON co.qt_num = coitem.qt_num --and co.site_ref = coitem.site_ref
 --LEFT OUTER JOIN employee_mst emp ON emp.emp_num = co.qt_from
 LEFT OUTER JOIN slsman_mst slsman ON slsman.ref_num = co.qt_from
 LEFT OUTER JOIN customer_mst cs ON cs.cust_num = co.cust_num and cs.cust_seq = 0 --and cs.site_ref = co.site_ref
 LEFT OUTER JOIN item_mst item ON item.item = coitem.cust_part_num --and item.site_ref = coitem.site_ref
WHERE co.qt_stat <> 'H'















GO



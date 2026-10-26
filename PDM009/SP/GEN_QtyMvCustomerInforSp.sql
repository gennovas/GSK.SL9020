 
CREATE PROCEDURE [dbo].[GEN_QtyMvCustomerInforSp] (
  @CustNum       CustNumType
, @CustName      NameType    OUTPUT
, @Contact       ContactType OUTPUT
, @Address1      AddressType OUTPUT
, @Address2      AddressType OUTPUT
, @Address3      AddressType OUTPUT
, @Address4      AddressType OUTPUT
) AS
 
DECLARE
  @Severity INT

SET @Severity = 0

SELECT
	@CustName = custaddr.name
   ,@Contact = customer.contact##1
   ,@Address1 = custaddr.addr##1
   ,@Address2 = custaddr.addr##2
   ,@Address3 = custaddr.addr##3
   ,@Address4 = custaddr.addr##4
FROM custaddr
INNER JOIN customer ON
	customer.cust_num = custaddr.cust_num
AND customer.cust_seq = custaddr.cust_seq
WHERE custaddr.cust_num = @CustNum
AND custaddr.cust_seq = 0

RETURN @Severity

GO



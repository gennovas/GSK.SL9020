 

CREATE PROCEDURE [dbo].[GEN_QtyMvVendorInforSp] (
  @VendNum       VendNumType
, @VendName      NameType    OUTPUT
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
	@VendName = vendaddr.name
   ,@Contact = vendor.contact
   ,@Address1 = vendaddr.addr##1
   ,@Address2 = vendaddr.addr##2
   ,@Address3 = vendaddr.addr##3
   ,@Address4 = vendaddr.addr##4
FROM vendaddr
INNER JOIN vendor ON
	vendor.vend_num = vendaddr.vend_num
WHERE vendaddr.vend_num = @VendNum

RETURN @Severity

GO



 
CREATE PROCEDURE [dbo].[GEN_GetNextMvNoSp] (
  @TransDate	DateType	= NULL
, @MvType		NVARCHAR(3)	= NULL
, @MvNo			DocumentNumType	OUTPUT
)
AS 
DECLARE
 @Severity		INT
,@Infobar		InfobarType
,@KeyStr		NVARCHAR(4000)
,@Len			INT
,@KeyLength		INT
,@Prefix		DocumentNumType

DECLARE @Site	SiteType
SELECT @Site = site FROM site
EXEC dbo.SetSiteSp 
  @Site = @Site
, @Infobar = @Infobar OUTPUT

SET @Severity = 0
SET @Prefix = LTRIM(RTRIM(ISNULL(@MvType, ''))) + '-' + SUBSTRING(CONVERT(NVARCHAR(10), @TransDate, 103), 9, 2)
SET @KeyLength = 12 

GETNEXTMVNO:
EXEC @Severity = dbo.NextKeySp 
		  @TableName  = 'GEN_QtyMv_Hdr'
		, @ColumnName = 'move_num'
		, @Prefix     = @Prefix
		, @KeyLength  = @KeyLength
		, @Type       = 'Running'
		, @Where      = NULL
		, @TableName2 = NULL
		, @Where2     = NULL
		, @KeyStr     = @MvNo OUTPUT
		, @Infobar    = @Infobar  OUTPUT  
		    
IF EXISTS(SELECT TOP 1 *
		  FROM GEN_QtyMv_Hdr
		  WHERE GEN_QtyMv_Hdr.move_num = @MvNo)
   GOTO GETNEXTMVNO

GO



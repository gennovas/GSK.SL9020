SET NOCOUNT ON
GO

update user_fld set fld_UDT= 'DateTimeType' where fld_name in ('Uf_ERPP_TimeT1', 'Uf_ERPP_TimeT2', 'Uf_ERPP_TimeT3', 'Uf_ERPP_TimeT4', 'Uf_ERPP_TimeT5', 'Uf_ERPP_TimeT6')

DECLARE @RC int
DECLARE @PCommit tinyint
DECLARE @PRollback tinyint
DECLARE @PImpact tinyint
DECLARE @Infobar nvarchar(2800)
DECLARE @RedoViews tinyint

-- Set parameter values
SET  @PCommit = 1
SET  @PRollback = 0
SET  @PImpact = 1
EXEC @RC = [dbo].[UETImpactWrapperSp] @PCommit, @PRollback, @PImpact,@RedoViews, @Infobar OUTPUT 

--SELECT @Infobar
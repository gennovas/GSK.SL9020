
 
CREATE PROCEDURE [dbo].[Gen_QtyMoveListGroupItem] 
	 @MoveNumber  DocumentNumType
	, @job  JobType
	 ,@Suffix  suffixType

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE from GEN_QtyMoveGroupItem where move_number= @MoveNumber

	INSERT INTO GEN_QtyMoveGroupItem
	([move_number]
      ,[job]
     ,[suffix]
      ,[oper_num]
      ,[item]
      ,[qty_set]
      ,[matl_qty]
      ,[cost]
      ,[total_qty]
      ,[u_m]
	  ,seq)
	SELECT @MoveNumber
		,@job
		, @Suffix 
		,oper_num
		,item
		,1
		,matl_qty
		,cost
		,matl_qty 
		,u_m
		,[sequence]
	FROM jobmatl_mst
	WHERE rtrim(ltrim(job)) = @job and  (suffix= case when @Suffix =9999 then suffix else    @Suffix   end)



END
GO



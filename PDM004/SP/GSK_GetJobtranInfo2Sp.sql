 

/****** Object:  StoredProcedure [dbo].[GSK_GetJobtranInfo2Sp]    Script Date: 28/10/2026 11:56:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GSK_GetJobtranInfo2Sp] (
	@JobtranTransNum HugeTransNumType = NULL OUTPUT,
	@JobtranSuffix SuffixType = NULL,
	@JobtranJob JobType = NULL,
	@JobtranTransDate DateTimeType = NULL
)
AS

PRINT 'OK'
GO



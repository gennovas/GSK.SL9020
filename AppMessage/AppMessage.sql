--File Generated on 22/07/2026 11:01:16 AM by sa
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2011 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/*
** Message File Generated for: 
** All messages where AccessAs IS NULL
*/

/************************
 * Delete Messages
 ************************/
if exists (select 1 from dbo.sysobjects where id = object_id(N'[dbo].[ObjectBuildMessagesFk2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
  ALTER TABLE [dbo].[ObjectBuildMessages] DROP CONSTRAINT ObjectBuildMessagesFk2
GO
DELETE ObjectBuildMessages
  WHERE ObjectName IN 
  (SELECT obb.ObjectName FROM dbo.ObjectBuildMessages AS obb 
  INNER JOIN dbo.ObjectMainMessages AS obm ON obb.ObjectName = obm.ObjectName 
  AND obb.MessageType = obm.MessageType 
  WHERE obm.AccessAs IS NULL
  AND  NOT (obb.MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(obb.ObjectName), N'IsForeignKey'),0) = 1)
  AND  NOT (obb.MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(obb.ObjectName), N'IsPrimaryKey'),0) = 1)
  AND  NOT (obb.MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(obb.ObjectName), N'IsUniqueCnst'),0) = 1)
  AND  NOT (obb.MessageType = N'18' AND ISNULL(OBJECTPROPERTYEX(object_id(obb.ObjectName), N'IsForeignKey'),0) = 1))
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsForeignKey'),0) = 1)
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsPrimaryKey'),0) = 1)
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsUniqueCnst'),0) = 1)
  AND  NOT (MessageType = N'18' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsForeignKey'),0) = 1)
DELETE ObjectMainMessages WHERE AccessAs IS NULL
  AND  ObjectName NOT LIKE '%.RowPointer'
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsForeignKey'),0) = 1)
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsPrimaryKey'),0) = 1)
  AND  NOT (MessageType = N'17' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsUniqueCnst'),0) = 1)
  AND  NOT (MessageType = N'18' AND ISNULL(OBJECTPROPERTYEX(object_id(ObjectName), N'IsForeignKey'),0) = 1)
DELETE ApplicationMessages
  WHERE MessageNo NOT IN ( 
  SELECT MessageNo FROM ObjectBuildMessages) 
AND MessageNo NOT IN ( 
  SELECT MessageNo FROM ObjectMainMessages) 
AND AccessAs IS NULL
GO
alter table [dbo].[ObjectBuildMessages]
add constraint [ObjectBuildMessagesFk2]
  foreign key (
  ObjectName , MessageType
  ) references [dbo].[ObjectMainMessages] (
  ObjectName , MessageType
  ) not for replication
GO

/************************
 * Application Messages
 ************************/
/* The following message must be there. Message 1 cannot be used as a real message */

EXEC AddApplicationMessage2Sp N'GEN_mApproveQuatationCompleted', N'Approve Quotation No. [&1] Revision [&2] completed.', N'1033', N'', 0
GO

EXEC AddApplicationMessage2Sp N'GEN_mApproveRFQCompleted', N'Approve RFQ No. [&1] Revision [&2] completed.', N'1033', N'', 0
GO

EXEC AddApplicationMessage2Sp N'GEN_mEQuatationIsNotOriginal', N'Quatation [&1] Revision [&2] is not the original revision.', N'1033', N'', 0
GO

EXEC AddApplicationMessage2Sp N'GEN_mERFQIsNotOriginal', N'RFQ [&1] Revision [&2] is not the original revision.', N'1033', N'', 0
GO

EXEC AddApplicationMessage2Sp N'GEN_mQuatationCreated', N'Quotation [&1] Revision [&2] has been successfully created.', N'1033', N'', 0
GO

EXEC AddApplicationMessage2Sp N'GEN_mRFQCreated', N'RFQ [&1] Revision [&2] has been successfully created.', N'1033', N'', 0
GO

/************************
 * ObjectMainMessages
 ************************/

EXEC AddObjectMainMessage2Sp
  N'GEN_mApproveQuatationCompleted', 5, N'GEN_mApproveQuatationCompleted', 0, N'Approve quatation complete message', 2, N'', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GEN_mApproveRFQCompleted', 5, N'GEN_mApproveRFQCompleted', 0, N'Approve RFQ complete message', 2, N'', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GEN_mEQuatationIsNotOriginal', 5, N'GEN_mEQuatationIsNotOriginal', 16, N'Validate quatation revision before copy', 2, N'', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GEN_mERFQIsNotOriginal', 5, N'GEN_mERFQIsNotOriginal', 16, N'Validate RFQ revision before copy', 2, N'', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GEN_mQuatationCreated', 5, N'GEN_mQuatationCreated', 0, N'Copy quatation success message', 2, N'', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GEN_mRFQCreated', 5, N'GEN_mRFQCreated', 0, N'Copy RFQ success message', 2, N'', 0
GO

/************************
 * ObjectBuildMessages
 ************************/


SET NOCOUNT ON
GO

/*User Defined Types*/
IF NOT EXISTS(SELECT * FROM UserDefinedTypes WHERE Name = N'GEN_SendToStoreBU')
    INSERT INTO UserDefinedTypes (Name, [Description])
    VALUES ('GEN_SendToStoreBU', 'Job Send To Store BU')
 

/*User Defined Type Values*/
IF NOT EXISTS(SELECT * FROM UserDefinedTypeValues WHERE TypeName = N'GEN_SendToStoreBU' AND Value = 'A')
    INSERT INTO UserDefinedTypeValues (TypeName, [Value], [Description])
    VALUES ('GEN_SendToStoreBU', 'A', 'Auto')
IF NOT EXISTS(SELECT * FROM UserDefinedTypeValues WHERE TypeName = N'GEN_SendToStoreBU' AND Value = 'E')
    INSERT INTO UserDefinedTypeValues (TypeName, [Value], [Description])
    VALUES ('GEN_SendToStoreBU', 'E', 'E&E')
IF NOT EXISTS(SELECT * FROM UserDefinedTypeValues WHERE TypeName = N'GEN_SendToStoreBU' AND Value = 'P')
    INSERT INTO UserDefinedTypeValues (TypeName, [Value], [Description])
    VALUES ('GEN_SendToStoreBU', 'P', 'PHARMA')
IF NOT EXISTS(SELECT * FROM UserDefinedTypeValues WHERE TypeName = N'GEN_SendToStoreBU' AND Value = 'S')
    INSERT INTO UserDefinedTypeValues (TypeName, [Value], [Description])
    VALUES ('GEN_SendToStoreBU', 'S', 'SKPB')    
 
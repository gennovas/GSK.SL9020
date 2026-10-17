SET NOCOUNT ON
DECLARE @FormID int
SET @FormID = NULL
SELECT @FormID = Forms.ID FROM Forms WHERE [Name] = N'GSK_QtySendToStore' AND [ScopeType] = 1
IF @FormID IS NOT NULL
BEGIN
   DELETE FROM Forms WHERE ID = @FormID
   DELETE FROM FormEventHandlers WHERE FormID = @FormID
   DELETE FROM FormComponents WHERE FormID = @FormID
   DELETE FROM ActiveXComponentProperties WHERE FormID = @FormID
   DELETE FROM Variables WHERE FormID = @FormID
   DELETE FROM FormComponentDragDropEvents WHERE FormID = @FormID
   DELETE FROM DerivedFormOverrides WHERE FormID = @FormID
END
INSERT INTO [Forms] (
  [ScopeType], [ScopeName], [Component], [Name], [SubComponent], [Type], [Caption], 
  [PrimaryDataSource], 
  [StandardOperations], [TopPos], [LeftPos], [Height], [Width], [IconFileName], [HelpFileName], [HelpContextID], [Flags], [LockedBy], 
  [FilterFormSpec], [PaneZeroSize], [Description], [MasterDeviceID], [BaseFormName] ) 
VALUES ( 
  1, N'[NULL]', NULL, N'GSK_QtySendToStore', NULL, 1, N'(GSK) Send To Store', 
  N'V(fds_DataSource)', 
  1, CAST('0' AS float), CAST('0' AS float), CAST('30' AS float), CAST('80' AS float), NULL, NULL, -1, 8, NULL, 
  NULL, N'0', NULL, 0, NULL)
SELECT @FormID = Forms.ID FROM Forms WHERE [Name] = N'GSK_QtySendToStore' AND [ScopeType] = 1
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DeleteButton', -1, 
  0, 8, CAST('12.529411764705882' AS float), CAST('48.75' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('9.375' AS float), N'Delete', 
  NULL, 
  NULL, 0, NULL, 
  0, N'Delete', NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_DeleteButton))', 
  NULL, N'Delete')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DescriptionGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Description', 
  NULL, 
  N'MainGrid', 6, N'object.Description', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Description')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DeselectAllButton', -1, 
  0, 8, CAST('12.529411764705882' AS float), CAST('14' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('10.75' AS float), N'Deselect All', 
  NULL, 
  NULL, 0, NULL, 
  0, N'DeselectAll', NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Deselect All')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DocumentDateCombo', -1, 
  0, 26, CAST('12.529411764705882' AS float), CAST('62.125' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.DocumentDateVar(INITIALVALUE(CURDATE()))', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  512, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'DateVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DocumentDateStatic', -1, 
  0, 0, CAST('8.8235294117647065' AS float), CAST('2.875' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('15.125' AS float), N'Document Date', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'Document Date')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DocumentNumberGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('19.75' AS float), N'Document Number', 
  NULL, 
  N'MainGrid', 10, N'object.DocumentNum', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Document Number')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'DocumentNumberStatic', -1, 
  0, 0, CAST('7.2352941176470589' AS float), CAST('2.875' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('15.125' AS float), N'Document Number', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'Document Number')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndDocumentComboBox', -1, 
  0, 27, CAST('6.7647058823529411' AS float), CAST('48' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), N'comboBox6', 
  NULL, 
  NULL, 0, N'variables.EndDocumentNumVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  N'STDOLE GEN_Serials(  PROPERTIES(DocumentNum) DISPLAY(1)READMODE(COMMITTED))', 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_EndDocumentComboBox))', 
  NULL, N'comboBox6')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndDocumentDateComboBox', -1, 
  0, 26, CAST('8.3529411764705888' AS float), CAST('48' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.EndDocumentDateVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'DateVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_EndDocumentDateComboBox))', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndItemComboBox', -1, 
  0, 27, CAST('3.6470588235294112' AS float), CAST('48' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('22.125' AS float), N'comboBox4', 
  NULL, 
  NULL, 0, N'variables.EndItemVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'ItemVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'comboBox4')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndJobComboBox', -1, 
  0, 27, CAST('2.1176470588235294' AS float), CAST('48' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.EndJobVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'JobWithSuffix(EndSuffixEdit)', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndJobDateComboBox', -1, 
  0, 26, CAST('5.117647058823529' AS float), CAST('48' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), N'dateCombo2', 
  NULL, 
  NULL, 0, N'variables.EndJobDateVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'DateVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'dateCombo2')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'EndSuffixEdit', -1, 
  0, 1, CAST('2.1764705882352935' AS float), CAST('64.5' AS float), CAST('1.1764705882352942' AS float), CAST('0' AS float), CAST('6.5' AS float), N'edit2', 
  NULL, 
  NULL, 0, N'variables.EndSuffixVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'SuffixVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'edit2')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'FilterGroupBox', -1, 
  0, 6, CAST('1' AS float), CAST('1.875' AS float), CAST('10.705882352941176' AS float), CAST('0' AS float), CAST('75.75' AS float), NULL, 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'GenerateDocumentButton', -1, 
  0, 7, CAST('10.294117647058824' AS float), CAST('19' AS float), CAST('1' AS float), CAST('0' AS float), CAST('16.25' AS float), N'Generate Document', 
  NULL, 
  NULL, 0, N'variables.RefreshOptionVar(INITIALVALUE(G))', 
  6, N'ClearCollection', NULL, NULL, NULL, N'G', 
  NULL, 
  8, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Generate Document')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'ItemGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('17.75' AS float), N'Item', 
  NULL, 
  N'MainGrid', 5, N'object.Item', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'ItemVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Item')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'ItemStatic', -1, 
  0, 0, CAST('4.117647058823529' AS float), CAST('7.5' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('10.375' AS float), N'Item', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'Item')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'JobGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('9.25' AS float), N'Job', 
  NULL, 
  N'MainGrid', 2, N'object.Job', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'JobVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Job')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'JobStartDateStatic', -1, 
  0, 0, CAST('5.5882352941176467' AS float), CAST('7.5' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('10.375' AS float), N'Job Start Date', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'Job Start Date')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'JobStatic', -1, 
  0, 0, CAST('2.5882352941176467' AS float), CAST('7.5' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('10.375' AS float), N'Job', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'Job')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'MainGrid', -1, 
  0, 14, CAST('14.588235294117647' AS float), CAST('2' AS float), CAST('15.235294117647058' AS float), CAST('0' AS float), CAST('77.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'objects', 
  3, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  384, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'OperNumGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Operation', 
  NULL, 
  N'MainGrid', 4, N'object.OperNum', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Operation')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'PostedQtyGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Posted Qty.', 
  NULL, 
  N'MainGrid', 7, N'object.QtyComplete', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'QtyUnitVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Posted Qty.')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'PrintButton', -1, 
  0, 8, CAST('12.529411764705882' AS float), CAST('37.875' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('9.375' AS float), N'Print', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_PrintButton))', 
  NULL, N'Print')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'PrintRadioButton', -1, 
  0, 7, CAST('10.294117647058824' AS float), CAST('36.625' AS float), CAST('1' AS float), CAST('0' AS float), CAST('10.625' AS float), N'Print', 
  NULL, 
  NULL, 0, N'variables.RefreshOptionVar', 
  6, N'ClearCollection', NULL, NULL, NULL, N'P', 
  NULL, 
  8, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Print')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'ProcessButton', -1, 
  0, 8, CAST('12.529411764705882' AS float), CAST('26.625' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('9.375' AS float), N'Process', 
  NULL, 
  NULL, 0, NULL, 
  0, N'Process', NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_ProcessButton))', 
  NULL, N'Process')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'ReceiptQtyGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Receipt Qty.', 
  NULL, 
  N'MainGrid', 9, N'object.ReceivedQty', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'QtyUnitVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Receipt Qty.')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'RefreshButton', -1, 
  0, 8, CAST('10' AS float), CAST('44.375' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('14.375' AS float), N'Refresh', 
  NULL, 
  NULL, 0, NULL, 
  0, N'Refresh', NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Refresh')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'SelectAllButton', -1, 
  0, 8, CAST('12.529411764705882' AS float), CAST('1.875' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('11.125' AS float), N'Select All', 
  NULL, 
  NULL, 0, NULL, 
  0, N'SelectAll', NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Select All')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'SelectGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('8.5' AS float), N'Select', 
  NULL, 
  N'MainGrid', 0, N'object.UbSelect', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  8, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, N'ListYesNo', 
  N'BOOLTRUE(1) BOOLFALSE(0)', N'AUTOIME(NoControl)', 
  NULL, N'Select')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'SendToStoreQtyGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Send To Store Qty', 
  N'LessThanOrEqualTo%1(C(PostedQtyGridCol))', 
  N'MainGrid', 8, N'object.CurSendQty', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  544, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'QtyUnitVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_SendToStoreQtyGridCol))', 
  NULL, N'Send To Store Qty')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'SequenceGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Sequence', 
  NULL, 
  N'MainGrid', 12, N'object.Sequence', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 1, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Sequence')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartDocumentComboBox', -1, 
  0, 27, CAST('6.7647058823529411' AS float), CAST('19.25' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartDocumentNumVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  N'STDOLE GEN_Serials(  PROPERTIES(DocumentNum) DISPLAY(1)READMODE(COMMITTED))', 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_StartDocumentComboBox))', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartDocumentDateComboBox', -1, 
  0, 26, CAST('8.3529411764705905' AS float), CAST('19.25' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartDocumentDateVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'DateVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) ENABLEDWHEN(V(cew_StartDocumentDateComboBox))', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartItemComboBox', -1, 
  0, 27, CAST('3.5882352941176472' AS float), CAST('19.375' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('22.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartItemVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'ItemVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartJobComboBox', -1, 
  0, 27, CAST('2.117647058823529' AS float), CAST('19.25' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartJobVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'JobWithSuffix(StartSuffixEdit)', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartJobDateComboBox', -1, 
  0, 26, CAST('5.117647058823529' AS float), CAST('19.25' AS float), CAST('1.2352941176470589' AS float), CAST('0' AS float), CAST('15.125' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartJobDateVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'DateVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'StartSuffixEdit', -1, 
  0, 1, CAST('2.1764705882352935' AS float), CAST('35.75' AS float), CAST('1.1764705882352942' AS float), CAST('0' AS float), CAST('6.5' AS float), NULL, 
  NULL, 
  NULL, 0, N'variables.StartSuffixVar', 
  6, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'SuffixVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'sSuffix')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'static4', -1, 
  0, 0, CAST('7.2352941176470589' AS float), CAST('4.625' AS float), CAST('0.76470588235294112' AS float), CAST('0' AS float), CAST('4.375' AS float), NULL, 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, NULL)
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'SuffixGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('14.25' AS float), N'Suffix', 
  NULL, 
  N'MainGrid', 3, N'object.Suffix', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', N'SuffixVar()', NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Suffix')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'TransDateGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('15.875' AS float), N'Trans Date', 
  NULL, 
  N'MainGrid', 1, N'object.TransDate', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Trans Date')
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption] )
VALUES (
  @FormID, N'TransNumGridCol', -1, 
  0, 15, CAST('0' AS float), CAST('0' AS float), CAST('5.882352941176471' AS float), CAST('0' AS float), CAST('12.5' AS float), N'Transaction', 
  NULL, 
  N'MainGrid', 11, N'object.TransNum', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 1, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'Transaction')
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'ClearCollection', 0, 35, N'ClearCollection()', NULL, NULL, NULL )
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'Delete', 0, 35, N'DeleteSerial()', NULL, NULL, NULL )
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'DeselectAll', 0, 35, N'SetSelect(0)', NULL, NULL, NULL )
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'Process', 0, 35, N'Process()', NULL, NULL, NULL )
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'Refresh', 0, 28, N'object', NULL, NULL, NULL )
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES ( @FormID, N'SelectAll', 0, 35, N'SetSelect(1)', NULL, NULL, NULL )
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_DeleteButton', 1, N'[NULL]', N'Enabled:#C(DeleteButton), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_EndDocumentComboBox', 1, N'[NULL]', N'Enabled:#C(EndDocumentComboBox), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_EndDocumentDateComboBox', 1, N'[NULL]', N'Enabled:#C(EndDocumentDateComboBox), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_PrintButton', 1, N'[NULL]', N'Enabled:#C(PrintButton), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_ProcessButton', 1, N'[NULL]', N'Enabled:#C(ProcessButton), #V(RefreshOptionVar) = "G", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_SelectGridCol', 1, N'[NULL]', N'Enabled:#C(SelectGridCol), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_SendToStoreQtyGridCol', 1, N'[NULL]', N'Enabled:#C(SendToStoreQtyGridCol), #V(RefreshOptionVar) = "G", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_StartDocumentComboBox', 1, N'[NULL]', N'Enabled:#C(StartDocumentComboBox), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'cew_StartDocumentDateComboBox', 1, N'[NULL]', N'Enabled:#C(StartDocumentDateComboBox), #V(RefreshOptionVar) = "P", "True"', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'fds_DataSource', 1, N'[NULL]', N'GEN_FGSendToStores.GEN_CLM_FGSendToStoreLoadSp( V(fds1_PrimaryMethodParms) OBJNAME(GEN_FGSendToStores) )', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'fds1_PrimaryMethodParms', 1, N'[NULL]', N'PARMS(VAR V(StartJobVar), VAR V(EndJobVar), VAR V(StartSuffixVar), VAR V(EndSuffixVar), VAR V(StartItemVar), VAR V(EndItemVar), VAR V(StartJobDateVar), VAR V(EndJobDateVar), VAR V(StartDocumentNumVar), VAR V(EndDocumentNumVar), VAR V(StartDocumentDateVar), VAR V(EndDocumentDateVar), VAR V(RefreshOptionVar))', NULL, NULL, NULL, NULL)
DELETE FROM ActiveXScriptLines WHERE ScriptName = N'GSK_QtySendToStore' AND [ScopeType] = 1
DELETE FROM ActiveXScripts WHERE Name = N'GSK_QtySendToStore' AND [ScopeType] = 1
INSERT INTO ActiveXScripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 2, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 7, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 8, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 9, N'Namespace Mongoose.FormScripts')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 10, N'Public Class GSK_QtySendToStore')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 11, N'Inherits FormScript')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 12, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 13, N'''')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 14, N''' Methods go here')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 15, N'''')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 16, N'        Sub Process()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 17, N'            Dim Invalid As Boolean = False')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 18, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 19, N'            For i As Integer = 0 To ThisForm.PrimaryIDOCollection.GetNumEntries() - 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 20, N'                If ThisForm.PrimaryIDOCollection.IsObjectInvalid(i) Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 21, N'                    Invalid = True')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 22, N'                    Exit For')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 23, N'                End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 24, N'            Next')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 25, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 26, N'            If Invalid Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 27, N'                Application.ShowMessage("Collection Invalid!", MsgBoxStyle.Critical)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 28, N'                Return')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 29, N'            End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 30, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 31, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 32, N'            If (Application.ShowMessage("Do you want to process selected record?", "Confirm", wsMessageStyle.wsYesNo, wsMessageStyle.wsQuestion)) = wsMsgBoxResult.wsNo Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 33, N'                Return')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 34, N'            End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 35, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 36, N'            Dim CountProcess As Integer = 0')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 37, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 38, N'            Dim IDO As IWSIDOCollection = ThisForm.Components("MainGrid").IDOCollection')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 39, N'            For i As Integer = 0 To IDO.GetNumEntries - 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 40, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 41, N'                Dim Selected As String = IDO.GetObjectProperty("UbSelect", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 42, N'                If Selected = "1" Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 43, N'                    Dim TransNum As String = IDO.GetObjectPropertyInternal("TransNum", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 44, N'                    Dim Sequence As String = IDO.GetObjectPropertyInternal("Sequence", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 45, N'                    Dim DocumentDate As Date = ThisForm.Variables("DocumentDateVar").GetValue(Of DateTime)()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 46, N'                    Dim Job As String = IDO.GetObjectProperty("Job", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 47, N'                    Dim Suffix As String = IDO.GetObjectProperty("Suffix", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 48, N'                    Dim OperNum As String = IDO.GetObjectProperty("OperNum", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 49, N'                    Dim CompleteQty As String = IDO.GetObjectProperty("QtyComplete", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 50, N'                    Dim SentQty As String = IDO.GetObjectProperty("SentQty", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 51, N'                    Dim ReceivedQty As String = IDO.GetObjectProperty("ReceivedQty", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 52, N'                    Dim CurSendQty As String = IDO.GetObjectProperty("CurSendQty", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 53, N'                    Dim CurReceivedQty As String = IDO.GetObjectProperty("CurReceivedQty", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 54, N'                    Dim PrintFlag As String = IDO.GetObjectProperty("PrintFlag", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 55, N'                    Dim DocumentNum As String = IDO.GetObjectProperty("DocumentNum", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 56, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 57, N'                    ''Dim Message As String = TransNum & ", " & Sequence & ", " & DocumentDate & " (" & DocumentDate.GetType().ToString & ")" & ", " _')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 58, N'                    ''                        & Job & ", " & Suffix & ", " & OperNum & ", " & CompleteQty & ", " & SentQty & ", " & ReceivedQty & ", " _')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 59, N'                    ''                        & CurSendQty & ", " & CurReceivedQty & ", " & PrintFlag & ", " & DocumentNum')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 60, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 61, N'                    Dim request As New InvokeRequestData')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 62, N'                    request.IDOName = "GEN_FGSendToStores"')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 63, N'                    request.MethodName = "GEN_FGSendToStoreProcessSp"')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 64, N'                    request.Parameters.Add(TransNum)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 65, N'                    request.Parameters.Add(Sequence)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 66, N'                    request.Parameters.Add(DocumentDate)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 67, N'                    request.Parameters.Add(Job)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 68, N'                    request.Parameters.Add(Suffix)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 69, N'                    request.Parameters.Add(OperNum)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 70, N'                    request.Parameters.Add(CompleteQty)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 71, N'                    request.Parameters.Add(SentQty)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 72, N'                    request.Parameters.Add(ReceivedQty)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 73, N'                    request.Parameters.Add(CurSendQty)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 74, N'                    request.Parameters.Add(CurReceivedQty)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 75, N'                    request.Parameters.Add(PrintFlag)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 76, N'                    request.Parameters.Add(DocumentNum, True) ''12 Document Number')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 77, N'                    request.Parameters.Add(IDONull.Value, True) ''13 Infobar')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 78, N'                    Try')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 79, N'                        Dim Result As InvokeResponseData = IDOClient.Invoke(request)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 80, N'                        If Result.IsReturnValueStdError Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 81, N'                            Application.ShowMessage(request.Parameters(12).Value, MsgBoxStyle.Critical)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 82, N'                        Else')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 83, N'                            CountProcess += 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 84, N'                            Dim ProcessDocNum As String = request.Parameters(12).Value')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 85, N'                            ''MsgBox(ProcessDocNum)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 86, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 87, N'                            IDO.SetObjectPropertyPlusModifyRefresh("DocumentNum", i, ProcessDocNum)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 88, N'                            ThisForm.Components("MainGrid").SetGridValueByColumnName(i + 1, "DocumentNumberGridCol", request.Parameters(12).Value)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 89, N'                            ''IDO.NotifyDependentsToRefresh("DocumentNum")')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 90, N'                        End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 91, N'                    Catch ex As Exception')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 92, N'                        Application.ShowMessage(ex.Message, MsgBoxStyle.Critical)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 93, N'                    End Try')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 94, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 95, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 96, N'                End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 97, N'            Next')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 98, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 99, N'            ThisForm.PrimaryIDOCollection.Refresh()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 100, N'            Application.ShowMessage(CountProcess.ToString() & " record(s) have been generated as serial documents.", MsgBoxStyle.Information)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 101, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 102, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 103, N'        End Sub')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 104, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 105, N'        Sub ClearCollection()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 106, N'            ThisForm.PrimaryIDOCollection.ClearEntries()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 107, N'        End Sub')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 108, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 109, N'        Sub SetSelect(ByVal value As Integer)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 110, N'            For i As Integer = 0 To ThisForm.PrimaryIDOCollection.GetNumEntries() - 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 111, N'                ThisForm.PrimaryIDOCollection.SetObjectPropertyPlusModifyRefresh("UbSelect", i, value.ToString)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 112, N'            Next')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 113, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 114, N'        End Sub')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 115, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 116, N'        Sub DeleteSerial()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 117, N'             ')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 118, N'            If (Application.ShowMessage("Do you want to delete selected record?", "Confirm", wsMessageStyle.wsYesNo, wsMessageStyle.wsQuestion)) = wsMsgBoxResult.wsNo Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 119, N'                Return')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 120, N'            End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 121, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 122, N'            Dim CountDelDoc As Integer = 0')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 123, N'            Dim IDO As IWSIDOCollection = ThisForm.Components("MainGrid").IDOCollection')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 124, N'            For i As Integer = 0 To IDO.GetNumEntries - 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 125, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 126, N'                Dim Selected As String = IDO.GetObjectProperty("UbSelect", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 127, N'                If Selected = "1" Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 128, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 129, N'                    Dim request As New InvokeRequestData')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 130, N'                    request.IDOName = "GEN_Serials"')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 131, N'                    request.MethodName = "GEN_DeleteSendToStoreDocSp"')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 132, N'                    Dim DocumentNum As String = IDO.GetObjectProperty("DocumentNum", i)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 133, N'                    request.Parameters.Add(DocumentNum, True) ''0 Document Number')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 134, N'                    request.Parameters.Add(IDONull.Value, True) ''1 Infobar')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 135, N'                    Try')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 136, N'                        Dim Result As InvokeResponseData = IDOClient.Invoke(request)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 137, N'                        If Result.IsReturnValueStdError Then')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 138, N'                            Application.ShowMessage(request.Parameters(1).Value, MsgBoxStyle.Critical)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 139, N'                        Else')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 140, N'                            CountDelDoc += 1')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 141, N'                        End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 142, N'                    Catch ex As Exception')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 143, N'                        Application.ShowMessage(ex.Message, MsgBoxStyle.Critical)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 144, N'                    End Try')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 145, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 146, N'                End If')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 147, N'            Next')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 148, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 149, N'            ThisForm.PrimaryIDOCollection.Refresh()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 150, N'            Application.ShowMessage(CountDelDoc.ToString() & " document(s) " & " deleted.", MsgBoxStyle.Information)')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 151, N'            ')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 152, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 153, N'        End Sub')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 154, N'End Class')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_QtySendToStore', 1, N'[NULL]', 155, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'AcctUnitCode4' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'AcctUnitCode4' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'AcctUnitCode4', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SLChartUnitcd4s(  PROPERTIES(unit4, Unitcd4Description) FILTER(acct = FP(%1)))', 
 NULL, NULL, NULL, 
 N'AcctUnitCode4(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'Button' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'Button' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'Button', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, N'LaunchFixedAssetCosts', NULL, NULL, 
 NULL, NULL, 0, N'StdDefault', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'CustNumSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'CustNumSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'CustNumSE', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLCustomers(  PROPERTIES(CustNum, Name) DISPLAY(1,2)DISTINCT() FILTER(CustSeq = 0 And ShowInDropDownList=1)ORDERBY(CustNum))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'CustNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'CustNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'CustNumVar', 1, N'[NULL]', 
 N'Only selects CustSeq=0', N'sCustomerNumber', N'STDOLE SL.SLCustomers(  PROPERTIES(CustNum, Name) FILTER(CustSeq = 0 And ShowInDropDownList=1))', 
 N'CustomersQuery', N'CustNum', N'Customers( PROPERTY(CustNum) )', 
 NULL, 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 N'DATATYPE(NUMSORTCHAR) LENGTH(7)', N'AUTOIME(NoControl) JUSTIFY(R)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'CustSeqCO' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'CustSeqCO' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'CustSeqCO', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLCustomers(  PROPERTIES(CustSeq, Name, CreditHold, FaxNum, TelexNum, Contact_2, Contact_3, Phone_2, Phone_3, ExportType, Slsman) DISPLAY(1,2)FILTER(CustNum=FP(%1) and ShowInShipToDropDownList=1))', 
 N'ShipTosQuery( FILTERPERM(CustNum = ISNULL(FP(%1),CustNum)))', N'CustSeq', N'ShipTos( PROPERTY(CustSeq) FILTER(CustNum = FP(%1)) SETVARVALUES(DefCustNum = P(%1)) )', 
 N'CustSeq(%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11),GetExportType,CustSeqAllowChange,Ask(PromptMsg, PromptButtons,)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 N'StdCurCompDetails', NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'DateSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'DateSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'DateSE', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 N'Date,DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_Acct' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_Acct' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_Acct', 1, N'[NULL]', 
 N'%1-%4 are output properties to receive unit code access', NULL, N'STDOLE SL.SLCharts(  PROPERTIES(Acct, Description, AccessUnit1, AccessUnit2, AccessUnit3, AccessUnit4, Type) DISPLAY(1,2)FILTER(Type <> ''S'' AND IsControl <> 1))', 
 NULL, NULL, NULL, 
 N'ERPP_AcctCont(%1,%2,%3,%4,%5,,,,,,%6,%9,%10),ERPP_AcctValid(%7,%8)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_BillNum' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_BillNum' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_BillNum', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE slartranalls(  PROPERTIES(artUf_erpp_ARBillNum) DISTINCT() FILTER(artUf_erpp_ARBillNum <> '''')ORDERBY(artUf_erpp_ARBillNum))', 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_CoNumNotEByCustNum' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_CoNumNotEByCustNum' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_CoNumNotEByCustNum', 1, N'[NULL]', 
 NULL, N'C(CoNumStatic)', N'STDOLE SL.SLCos(  PROPERTIES(CoNum, CustNum, Stat, Type) DISPLAY(1)FILTER(Type <> ''E'' AND CustNum = FP(%1)))', 
 N'CustomerOrdersQuery', N'CoNum', N'CustomerOrders( )', 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_Decimal2Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_Decimal2Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_Decimal2Var', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 N'DATATYPE(DECIMAL) DEFAULTVALUE(0)', N'AUTOIME(NoControl) MASK(->>>>>>9.99) JUSTIFY(R)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_Decimal4Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_Decimal4Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_Decimal4Var', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 N'DATATYPE(DECIMAL) DEFAULTVALUE(0)', N'AUTOIME(NoControl) MASK(->>>>>>9.9999) JUSTIFY(R)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_Decimal5Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_Decimal5Var' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_Decimal5Var', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 N'DATATYPE(DECIMAL)', N'AUTOIME(NoControl) MASK(->>>>>>9.99999) JUSTIFY(R)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_GetTaxId' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_GetTaxId' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_GetTaxId', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE sl.slvendors(  PROPERTIES(VendNum, Name, VadAddr_1, VadAddr_2, VadAddr_3, VadAddr_4, TaxRegNum1) FILTER(VendNum like ''P(VendNum)%'')ORDERBY(VendNum))', 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_ItemC' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_ItemC' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_ItemC', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLItems(  PROPERTIES(Item, Description, LotTracked, SerialTracked, UM) DISPLAY(1,2)FILTER(ShowInDropDownList=1)ORDERBY(Item))', 
 NULL, NULL, NULL, 
 N'ERPP_ItemSetC(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_NoVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_NoVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_NoVar', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 N'DATATYPE(DECIMAL) DEFAULTVALUE(0)', N'AUTOIME(NoControl) MASK(->>>>>>9) JUSTIFY(R)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_Slsman' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_Slsman' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_Slsman', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLSlsmans(  PROPERTIES(Slsman, DerSalesmanName, DerSalesmanAddress, Slsmangr, RefNum) DISPLAY(1,2))', 
 NULL, NULL, NULL, 
 N'Slsman(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_TaxCode' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_TaxCode' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_TaxCode', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLTaxcodes(  PROPERTIES(TaxCode, Description, TaxRate, ApAcct, ApAcctUnit1, ApAcctUnit2, ApAcctUnit3, ApAcctUnit4) DISPLAY(1,2,3,4))', 
 NULL, NULL, NULL, 
 N'TaxCode(%1, %2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_TaxCodeAR' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_TaxCodeAR' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_TaxCodeAR', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE sl.SLTaxcodes(  PROPERTIES(TaxCode, Description, TaxRate, ArAcct) )', 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_TransportPerson' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_TransportPerson' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_TransportPerson', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE ERPP_TransportPersons(  PROPERTIES(Person_id, Full_Name, Type) DISPLAY(1,2)FILTER(Type=''%1''))', 
 NULL, NULL, NULL, 
 N'ERPP_TransPerson(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ERPP_UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ERPP_UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ERPP_UserDefinedType', 1, N'[NULL]', 
 N'Parm: name of type; use this for standard facilities for value corresponding to a user-defined type', NULL, N'STDOLE MGCore.UserDefinedTypeValues(  PROPERTIES( Value, Description ) DISPLAY(1,2) FILTER(TypeName = ''%1'') )', 
 N'UserDefinedTypeValuesQuery( FILTERPERM( TypeName = ''%1'' ) )', N'Value', N'UserDefinedTypeValues( FILTERPERM( TypeName = ''%1'' ) SETVARVALUES( TypeName=%1 ) )', 
 N'ERPP_UserDefinedTypeValue(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'GEN_CoWhse' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'GEN_CoWhse' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'GEN_CoWhse', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SLWhseAlls(  PROPERTIES(Whse, SiteRef, Name) DISPLAY(1,3,2)FILTER(SiteRef = FV(%1)))', 
 NULL, NULL, NULL, 
 N'GEN_WhseAllSites(%1)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'gen_customerpreship' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'gen_customerpreship' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'gen_customerpreship', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLCustomers(  V(lsp_gen_customerpreship) DISPLAY(1,2)FILTER(CustSeq = 0))', 
 N'Customers', N'CustNum', N'Customers', 
 N'gen_customer_preship_vld(%1,%2,%3,%4,%5,%6,7%,8%,%9,%10,%11,%12,%13,%14,%15,%16,%17,%18,%19,%20,%21,%22,%23,%24,%25,%26,%27,%28,%29, %30, %31, %32, %33, %34)', 0, 1, 0, 
 NULL, NULL, 0, 0, 512, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsFind', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'GEN_ItemWhseLocByVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'GEN_ItemWhseLocByVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'GEN_ItemWhseLocByVar', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLItemLocs(  PROPERTIES(Loc, LocDescription) DISPLAY(1,2)DISTINCT() FILTER(Item=FV(%1) AND Whse=FV(%2) )ORDERBY(Loc))', 
 N'ItemStockroomLocationsQuery( )', N'Loc', N'ItemStockroomLocations( PROPERTY(Loc) FILTER(Item = FP(%1) AND Whse = FP(%2) AND Loc=FP(%4)) )', 
 N'GEN_LocForitemWhseLotByVar(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'GEN_ShipTosFromCustomer' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'GEN_ShipTosFromCustomer' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'GEN_ShipTosFromCustomer', 1, N'[NULL]', 
 N'%1 is CustNum property name; provides filtered list and filtered find/details', NULL, N'STDOLE SL.SLCustomers(  V(lsp_GEN_ShipTosFromCustomer) DISPLAY(1,2)DISTINCT() FILTER(CustNum like ISNULL(FP(%1),''%'')))', 
 N'ShipTos( FILTER(CustNum like ISNULL(FP(%1),''%'')) )', N'CustSeq', N'ShipTos( PROPERTY(CustSeq) FILTER(CustNum like ISNULL(FP(%1),''%'')) )', 
 N'GEN_ValidateCustSeq(%1,%2,%3,%4,%5,%6,7%,8%,%9,%10,%11,%12,%13,%14,%15,%16,%17,%18,%19,%20,%21,%22)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'GEN_SlsmanAll' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'GEN_SlsmanAll' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'GEN_SlsmanAll', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SLSlsmanAlls(  PROPERTIES(Slsman, DerSlsmanName) DISPLAY(1,2))', 
 NULL, NULL, NULL, 
 N'GEN_SlsmanAll(%1)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDefault', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'GEN_UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'GEN_UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'GEN_UserDefinedType', 1, N'[NULL]', 
 N'Parm: name of type; use this for standard facilities for value corresponding to a user-defined type', NULL, N'STDOLE MGCore.UserDefinedTypeValues(  PROPERTIES( Value, Description ) DISPLAY(1,2) FILTER(TypeName = ''%1'') )', 
 N'UserDefinedTypeValuesQuery( FILTERPERM( TypeName = ''%1'' ) )', N'Value', N'UserDefinedTypeValues( FILTERPERM( TypeName = ''%1'' ) SETVARVALUES( TypeName=%1 ) )', 
 N'GEN_UserDefinedTypeValue(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'IncoDelterms' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'IncoDelterms' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'IncoDelterms', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SLIncoDelTerms(  PROPERTIES(IncoDelterm, Description) )', 
 N'IncoDeliveryTerms', NULL, N'IncoDeliveryTerms( PROPERTY(IncoDelterm) )', 
 N'IncoDelterms(%1)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsFind', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ItemSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ItemSE' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ItemSE', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLItems(  PROPERTIES(Item, Description, LotTracked, UM, TaxFreeMatl, ActiveForCustomerPortal, Overview, DimensionGroup, TrackPieces, LotPrefix) DISPLAY(1,2)ORDERBY(Item))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'LocItem' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'LocItem' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'LocItem', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLItemLocs(  PROPERTIES(Loc, LocDescription, QtyOnHand) FILTER(iloc.whse=FV(%1) and iloc.item=FP(%2) and iloc.loc_type = %3)ORDERBY(Loc))', 
 NULL, NULL, NULL, 
 N'LocForItem(%2,%1,%5,1,0,,,,,,,,,,,),Ask(ItemlocValidatePromptMsg,ItemlocValidatePromptButtons,ItemlocValidatePromptResponse,),GenerateEvent(%13),EvalResponseGenerateEvent(ItemlocValidatePromptResponse,%6,%5),SetVariableValue(CallContainerFormVar,1),LocForItemQtyDetl(%1,%2,%4,%5,%7,%8,%9,%10,%11),Ask(ItemQtyDetlPromptMsg,ItemQtyDetlPromptButtons,ItemQtyDetlPromptResponse),EvalResponseAndVariableGenerateEvent(ItemQtyDetlPromptResponse,CallContainerFormVar,1,%12,%5,True)', 0, 1, 0, 
 NULL, NULL, 0, 0, 512, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'LTH_ArRVNumberVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'LTH_ArRVNumberVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'LTH_ArRVNumberVar', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE LTHArpmtsHistorical(  PROPERTIES(RVNum) DISPLAY(1)ORDERBY(RVNum))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%2,%3)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDefault', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'LTH_BuilderInvNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'LTH_BuilderInvNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'LTH_BuilderInvNumVar', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE GEN_SLInvItemAlls(  PROPERTIES(CreatedBy) DISPLAY(1)DISTINCT() )', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 2097152, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'LTH_VendInputTaxValid' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'LTH_VendInputTaxValid' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'LTH_VendInputTaxValid', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLVendaddrs(  PROPERTIES(VendNum, Name) DISPLAY(1,2)FILTER(ShowInDropDownList = 1 AND VndVendNum IS NOT NULL))', 
 NULL, NULL, NULL, 
 N'LTH_VendInputTax(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'LTH_Whse' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'LTH_Whse' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'LTH_Whse', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SLWhses(  PROPERTIES(Whse, Name) DISPLAY(1,2))', 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'PreShipNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'PreShipNumVar' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'PreShipNumVar', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE GEN_preship_inv_hdrs(  PROPERTIES(PreShipNumber) DISPLAY(1)DISTINCT() ORDERBY(PreShipNumber))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'ProbCode' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'ProbCode' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'ProbCode', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLProbcodes(  PROPERTIES(ProbCode, Description) )', 
 NULL, NULL, NULL, 
 N'ProbCodes(%1)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'Slsman' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'Slsman' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'Slsman', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLSlsmans(  PROPERTIES(Slsman, DerSalesmanName, DerSalesmanAddress, Slsmangr, RefNum) DISPLAY(1,2))', 
 NULL, NULL, NULL, 
 N'Slsman(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'SSSFSSRONumVarNoValid2' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'SSSFSSRONumVarNoValid2' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'SSSFSSRONumVarNoValid2', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE FSP.FSSROs(  PROPERTIES(SroNum, Description) DISPLAY(1,2)FILTER(SroStat <> ''T''))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'UDTMat' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'UDTMat' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'UDTMat', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE UserDefinedTypeValues(  PROPERTIES(Value, Description) DISPLAY(1,2)FILTER(TypeName = ''ERPP_MasterofMaterial''))', 
 NULL, NULL, NULL, 
 N'DefaultStartingToEnding(%1,%2)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'UserDefinedType' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'UserDefinedType', 1, N'[NULL]', 
 N'Parm: name of type; use this for standard facilities for value corresponding to a user-defined type', NULL, N'STDOLE MGCore.UserDefinedTypeValues(  PROPERTIES(Value, Description ) DISPLAY(1,2)FILTER(TypeName = ''%1''))', 
 N'UserDefinedTypeValuesQuery( FILTERPERM( TypeName = ''%1'' ) )', N'Value', N'UserDefinedTypeValues( FILTERPERM( TypeName = ''%1'' ) SETVARVALUES( TypeName=%1 ) )', 
 N'UserDefinedTypeValue(%1)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDetailsAddFind', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'VendAddress' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'VendAddress' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'VendAddress', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE sl.slvendors(  PROPERTIES(VendNum, Name, VadAddr_1, VadAddr_2, VadAddr_3, VadAddr_4, TaxRegNum1) )', 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDefault', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'VoucherAptrxd' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'VoucherAptrxd' AND [IsPropertyClassExtension] = 0 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'VoucherAptrxd', 1, N'[NULL]', 
 NULL, NULL, N'STDOLE SL.SLAPPayDisVchs(  PROPERTIES(V(VchListSrc)) DISPLAY(1, 2, 3, 4) FILTER(V(VoucherFilterString)) ORDERBY(V(VchSrtVar)) )', 
 NULL, NULL, NULL, 
 N'SetPropertyFromList(Site,TrxSiteRef),GenerateEventNoMsg(ValidateVoucher)', 0, 1, 0, 
 NULL, NULL, 0, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, NULL, 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM Menus WHERE Name = N'GSK_LoadSignature' AND [ScopeType] = 1
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'GSK_LoadSignature', 1, N'[NULL]', N'Load Signature', N'LoadPictureSignature', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'GSK_LoadSignature', 1, N'[NULL]', N'Remove Signature', N'RemovePictureSignature', NULL )
-------------------------------------------------------------------------------
DELETE FROM Menus WHERE Name = N'LoadPicture2' AND [ScopeType] = 1
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N's&Copy', N'StdCurCompClipboardCopy', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N's&Help', N'StdFormComponentHelp', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N's&Paste', N'StdCurCompClipboardPaste', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N'sCu&t', N'StdCurCompClipboardCut', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N'sLoadPicture', N'LoadPicture2', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture2', 1, N'[NULL]', N'sRemovePicture', N'RemovePictureAndShowMessage', NULL )
-------------------------------------------------------------------------------
DELETE FROM Menus WHERE Name = N'LoadPicture3' AND [ScopeType] = 1
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N's&Copy', N'StdCurCompClipboardCopy', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N's&Help', N'StdFormComponentHelp', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N's&Paste', N'StdCurCompClipboardPaste', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N'sCu&t', N'StdCurCompClipboardCut', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N'sLoadPicture', N'LoadPicture3', NULL )
INSERT INTO Menus ([Name], [ScopeType], [ScopeName], [ItemName], [EventToGenerate], [LockedBy] ) VALUES ( N'LoadPicture3', 1, N'[NULL]', N'sRemovePicture', N'RemovePictureAndShowMessage', NULL )
-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'Amount' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'Amount' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'Amount', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 N'Calculator', N'Value', NULL, 
 NULL, 0, 0, 0, 
 NULL, N'DEFAULTFORMAT(MASK(V(AmtFormatVar)))', 1, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdCalc', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'BankAccount' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'BankAccount' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'BankAccount', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 NULL, NULL, NULL, 
 NULL, 0, 0, 0, 
 NULL, NULL, 1, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdDefault', 
 NULL, N'AUTOIME(NoControl)' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'CostPrc' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'CostPrc' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'CostPrc', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 N'Calculator', N'Value', NULL, 
 NULL, 0, 0, 0, 
 NULL, N'DEFAULTFORMAT(MASK(V(CstPrcFormatVar)))', 1, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdCalc', 
 NULL, N'TRUNCATEDECIMAL()' ) 


-------------------------------------------------------------------------------
DELETE FROM PropertyDefaults WHERE [PropertyName] = N'QtyUnitNoNeg' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

DELETE FROM PropertyDefaultDragDropEvents WHERE [PropertyName] = N'QtyUnitNoNeg' AND [IsPropertyClassExtension] = 1 AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO PropertyDefaults ( 
 [PropertyName], [ScopeType], [ScopeName], 
 [Description], [Label], [ListSource], 
 [FindFromForm], [FindFromProperty], [MaintainFromSpec], 
 [Validators], [MaxCharacters], [ValidateImmediately], [ValueIsListIndex], 
 [LockedBy], [DataType], [IsPropertyClassExtension], [Flags], [ComponentFlags], 
 [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], 
 [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
 [Post301DataType], [Post301Format] ) 
VALUES ( 
 N'QtyUnitNoNeg', 1, N'[NULL]', 
 NULL, NULL, NULL, 
 N'Calculator', N'Value', NULL, 
 N'GreaterThanOrEqualTo0', 0, 1, 0, 
 NULL, N'DEFAULTFORMAT(MASK(V(Parm_QtyUnitFormat)))', 1, 0, 0, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, 0, N'StdCalc', 
 NULL, NULL ) 


-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'DefaultStartingToEnding' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'DefaultStartingToEnding' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 8, N'Namespace Mongoose.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 9, N'Public class DefaultStartingToEnding')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 10, N'Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 12, N'Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 13, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 14, N'            Dim strEnabled As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 15, N'            Dim strStart As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 16, N'            Dim strEnd As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 17, N'            Dim iParamCount As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 18, N'            Dim oComp As IWSFormComponent')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 19, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 20, N'            On Error GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 21, N'            iParamCount = ParameterCount()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 22, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 23, N'            If Application.Variables("Parm_DefaultStartingToEnding").Value = "1" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 24, N'                strStart = GetParameter(0)   ''name of start component')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 25, N'                strEnd = GetParameter(1)   ''name of end compontent')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 26, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 27, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 28, N'                If strStart.Length > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 29, N'                    If Left(strStart, 1) = "%" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 30, N'                        ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 31, N'                        Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 32, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 33, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 34, N'                If strEnd.Length > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 35, N'                    If Left(strEnd, 1) = "%" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 36, N'                        ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 37, N'                        Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 38, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 39, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 40, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 41, N'                If strStart.Length = 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 42, N'                    strStart = ThisForm.GetCurrentComponentName')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 43, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 44, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 45, N'                ''replace the end component if no initialized')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 46, N'                If strEnd.Length = 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 47, N'                    strEnd = strStart.ToLower')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 48, N'                    If strEnd.IndexOf("start") >= 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 49, N'                        strEnd = strEnd.Replace("start", "end")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 50, N'                    ElseIf strEnd.IndexOf("begin") >= 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 51, N'                        strEnd = strEnd.Replace("begin", "end")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 52, N'                    Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 53, N'                        ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 54, N'                        Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 55, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 56, N'                    ''get the correct name of end component when its name is null')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 57, N'                    For Each oComp In ThisForm.Components.Values')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 58, N'                        If oComp.Name.ToLower = strEnd Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 59, N'                            strEnd = oComp.Name')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 60, N'                            Exit For')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 61, N'                        End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 62, N'                    Next')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 63, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 64, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 65, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 66, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 67, N'                If ThisForm.Components.ContainsKey(strEnd) And ThisForm.Components.ContainsKey(strStart) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 68, N'                    If ThisForm.Components(strEnd).Enabled And IsNothing(ThisForm.Components(strEnd).GetValueOfString(Nothing)) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 69, N'                        ThisForm.Components(strEnd).SetValue(ThisForm.Components(strStart).GetValueOfString(String.Empty))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 70, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 71, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 72, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 73, N'            ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 74, N'            Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 75, N'ErrorHandler:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 76, N'            Application.ShowMessage("Default Starting To Ending Script: " & Err.Description, vbCritical)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 77, N'            ReturnValue = "1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 78, N'End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 79, N'End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 80, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'GSK_CalDurationInMinute' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'GSK_CalDurationInMinute' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 8, N'Namespace SyteLine.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 9, N'    Public Class GSK_CalDurationInMinute')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 10, N'        Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 12, N'        ''*********************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 13, N'        '' Script name : Calculate Duration in minute')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 14, N'        '' Parameters')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 15, N'        '' (0) Date/Time 1 Property')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 16, N'        '' (1) Date/Time 2 Property')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 17, N'        '' (2) SET Duration Property')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 18, N'        ''*********************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 19, N'        Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 20, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 21, N'            On Error GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 22, N'            Dim PropDateTime1Name As String = GetParameter(0)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 23, N'            Dim PropDateTime2Name As String = GetParameter(1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 24, N'            Dim PropDurationName As String = GetParameter(2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 25, N'             ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 26, N'            Dim oPropDateTime1 As Object = ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty(PropDateTime1Name)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 27, N'            Dim oPropDateTime2 As Object = ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty(PropDateTime2Name)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 28, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 29, N'            ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh( _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 30, N'                    PropDurationName, "0")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 31, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 32, N'            If oPropDateTime1 IsNot Nothing _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 33, N'            AndAlso oPropDateTime2 IsNot Nothing Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 34, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 35, N'                Dim DateTime1 As DateTime')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 36, N'                Dim DateTime2 As DateTime')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 37, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 38, N'                If DateTime.TryParse(CStr(oPropDateTime1), DateTime1) _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 39, N'                AndAlso DateTime.TryParse(CStr(oPropDateTime2), DateTime2) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 40, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 41, N'                    Dim DurationMinute As Long = _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 42, N'                        CLng(DateDiff(DateInterval.Minute, DateTime1, DateTime2))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 43, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 44, N'                    ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh( _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 45, N'                        PropDurationName, DurationMinute.ToString())')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 46, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 47, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 48, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 49, N'            ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 50, N'            ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 51, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 52, N'            Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 53, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 54, N'ErrorHandler:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 55, N'            Application.ShowMessage( _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 56, N'                "Error " & CStr(Err.Number) & vbCrLf & _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 57, N'                Err.Description, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 58, N'                vbCritical, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 59, N'                "GSK_CalDurationInMinute")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 60, N'            ReturnValue = "1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 61, N'        End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 62, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 63, N'    End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_CalDurationInMinute', 1, N'[NULL]', 64, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'GSK_ValidateTime' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'GSK_ValidateTime' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'GSK_ValidateTime', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 8, N'Namespace SyteLine.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 9, N'    Public Class GSK_ValidateTime')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 10, N'        Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 12, N'        ''*********************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 13, N'        '' Script name : Run validate time format 24 hours and set date/time')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 14, N'        '' Parameters')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 15, N'        '' (0) Property ' + NCHAR(3586) + NCHAR(3629) + NCHAR(3591) + NCHAR(3648) + NCHAR(3623) + NCHAR(3621) + NCHAR(3634) + NCHAR(3607) + NCHAR(3637) + NCHAR(3656) + NCHAR(3592) + NCHAR(3632) + N' Validate ' + NCHAR(3619) + NCHAR(3641) + NCHAR(3611) + NCHAR(3649) + NCHAR(3610) + NCHAR(3610) + N' 24 ' + NCHAR(3594) + NCHAR(3633) + NCHAR(3656) + NCHAR(3623) + NCHAR(3650) + NCHAR(3617) + NCHAR(3591))
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 16, N'        '' (1) Label ' + NCHAR(3607) + NCHAR(3637) + NCHAR(3656) + NCHAR(3592) + NCHAR(3632) + NCHAR(3649) + NCHAR(3626) + NCHAR(3604) + NCHAR(3591) + NCHAR(3648) + NCHAR(3623) + NCHAR(3621) + NCHAR(3634) + NCHAR(3617) + NCHAR(3637) + N' Error')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 17, N'        '' (2) Property ' + NCHAR(3586) + NCHAR(3629) + NCHAR(3591) + N' Date ' + NCHAR(3607) + NCHAR(3637) + NCHAR(3656) + NCHAR(3592) + NCHAR(3632) + N' SET ' + NCHAR(3648) + NCHAR(3623) + NCHAR(3621) + NCHAR(3634) + NCHAR(3586) + NCHAR(3629) + NCHAR(3591) + N' parameter (0)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 18, N'        ''*********************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 19, N'        Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 20, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 21, N'            On Error GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 22, N'            Dim ValidatePropName As String = GetParameter(0)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 23, N'            Dim ValidatePropLabel As String = GetParameter(1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 24, N'            Dim SetPropName As String = GetParameter(2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 25, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 26, N'            Dim sTime As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 27, N'            Dim sHrs As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 28, N'            Dim sMin As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 29, N'            sMin = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 30, N'            sTime = ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty(ValidatePropName)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 31, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 32, N'            If sTime = "" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 33, N'                sTime = "00:00"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 34, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 35, N'            sHrs = Left(sTime, 2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 36, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 37, N'            If Len(Trim(sHrs)) < 2 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 38, N'                sHrs = Left("00", 2 - Len(Trim(sHrs))) + Trim(sHrs)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 39, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 40, N'            If Int(Len(Trim(sTime))) > 3 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 41, N'                sMin = Right(sTime, 2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 42, N'            Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 43, N'                If Int(Len(Trim(sTime))) > 2 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 44, N'                    sMin = Right(sTime, 1) & "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 45, N'                Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 46, N'                    If sMin = "" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 47, N'                        sMin = "00"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 48, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 49, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 50, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 51, N'            ''sMin = Right(sTime, 2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 52, N'            If sMin = "" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 53, N'                sMin = "00"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 54, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 55, N'            If Len(Trim(sMin)) < 2 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 56, N'                sMin = Left("00", 2 - Len(Trim(sMin))) + Trim(sMin)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 57, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 58, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 59, N'            If Not ((CDec(sHrs) <= 23 And CDec(sMin) <= 59) Or sTime = "24:00") Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 60, N'                Application.ShowMessage(ValidatePropLabel + " must be between 0:00 and 23:59", vbCritical, "SyteLine")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 61, N'                GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 62, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 63, N'            sTime = Left("00", 2 - Len(Trim(sHrs))) + Trim(sHrs) + ":" + Left("00", 2 - Len(Trim(sMin))) + Trim(sMin)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 64, N'            Dim oPropDate As Object = ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty(SetPropName)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 65, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 66, N'            If Not IsNothing(oPropDate) AndAlso Not IsDBNull(oPropDate) AndAlso Not String.IsNullOrWhiteSpace(CStr(oPropDate)) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 67, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 68, N'                Dim PropDate As DateTime = CType(oPropDate, DateTime)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 69, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 70, N'                Dim iHour As Integer = Integer.Parse(Left(sTime, 2))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 71, N'                Dim iMinute As Integer = Integer.Parse(Right(sTime, 2))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 72, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 73, N'                Dim NewDateTime As DateTime')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 74, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 75, N'                If sTime = "24:00" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 76, N'                    NewDateTime = PropDate.Date.AddDays(1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 77, N'                Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 78, N'                    NewDateTime = New DateTime( _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 79, N'                        PropDate.Year, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 80, N'                        PropDate.Month, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 81, N'                        PropDate.Day, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 82, N'                        iHour, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 83, N'                        iMinute, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 84, N'                        0)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 85, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 86, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 87, N'                ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh( _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 88, N'                    SetPropName, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 89, N'                    NewDateTime.ToString("yyyy-MM-dd HH:mm:ss"))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 90, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 91, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 92, N'            ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 93, N'            ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 94, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 95, N'            Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 96, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 97, N'ErrorHandler:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 98, N'            ReturnValue = "1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 99, N'        End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 100, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 101, N'    End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'GSK_ValidateTime', 1, N'[NULL]', 102, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'MsgApp' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'MsgApp' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'MsgApp', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 8, N'Namespace Mongoose.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 9, N'   Public Class MsgApp')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 10, N'      Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 12, N'      ''********************************************************************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 13, N'      ''Routine: ''MsgApp''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 14, N'      ''Used for constructing and presenting messages generated within the')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 15, N'      ''Client (WinStudio) code base. If desired, script ''Ask'' may be used')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 16, N'      ''for presenting messages built by script MsgApp by passing variables')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 17, N'      ''PromptMsg and PromptButtons. MsgApp sets these two variables when')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 18, N'      ''processing a message. MsgApp uses the following three reserved')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 19, N'      ''form variables:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 20, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 21, N'      ''  PromptMsg      - Holds the formatted message.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 22, N'      ''  PromptButtons  - Hold button specification of current message.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 23, N'      ''  PromptResponse - Holds the value of the Button pressed in response')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 24, N'      ''                   to a conditional query.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 25, N'      ''MsgApp parameters are described below:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 26, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 27, N'      ''Parameter#:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 28, N'      ''1- "Clear"/"NoClear" -- (Default: NoClear if passed as blank)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 29, N'      ''   Determines whether to clear variable "PromptMsg" before formatting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 30, N'      ''   the message. If NoClear is specified, "PromptMsg" is not cleared and')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 31, N'      ''   the new message is appended to any existing message with an intervening')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 32, N'      ''   New line specification. Variable PromptButtons is also cleared if "Clear"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 33, N'      ''   is specified.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 34, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 35, N'      ''2- "Prompt"/"NoPrompt"/Buttons -- (Default: "NoPrompt" if passed as blank)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 36, N'      ''   Options:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 37, N'      ''   "Prompt"   - Format and present message with appropriate default buttons')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 38, N'      ''   "NoPrompt" - Format message in PromptMsg variable. Message is not presented.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 39, N'      ''   Buttons    - Format and present message with specified buttons. The  button')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 40, N'      ''                values specified here override the default button specification.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 41, N'      ''                In addition, a suffix indicating the Message Icon can be included.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 42, N'      ''                The first button specified in the Button Specifications will')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 43, N'      ''                be set as the Default pushbutton.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 44, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 45, N'      ''   Valid button specifications are:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 46, N'      ''     "Yes|No",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 47, N'      ''     "No|Yes",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 48, N'      ''     "Yes|No|Cancel",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 49, N'      ''     "No|Yes|Cancel",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 50, N'      ''     "OK|Cancel",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 51, N'      ''     "Cancel|OK",')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 52, N'      ''     "OK"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 53, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 54, N'      ''   Valid Icon suffix specifications are (Optional)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 55, N'      ''     "-W"   - Warning icon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 56, N'      ''     "-Q"   - Question icon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 57, N'      ''     "-E"   - Error icon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 58, N'      ''     "-I"   - Informational icon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 59, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 60, N'      ''   Notes: Default buttons are defined by the message. If the message contains')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 61, N'      ''   no button specifications, then OK is the default button. If the message')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 62, N'      ''   contains a button specification at the end (e.g. "^No|Yes") then that')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 63, N'      ''   specification is used. Any  button specification is stripped from the')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 64, N'      ''   message before displaying it. The first button in the list will be the')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 65, N'      ''   Default push button.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 66, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 67, N'      ''3- "SuccessFailure"/"ReturnAction" -- (Default: SuccessFailure if passed as blank)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 68, N'      ''   "SuccessFailure" - ReturnValue will be set to success (0) if the user selected')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 69, N'      ''                      vbOK or vbYes. Otherwise it will be set to failure (1).')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 70, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 71, N'      ''   "ReturnAction"   - The user response will be returned in the PromptResponse')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 72, N'      ''                      variable and the ReturnValue will always be set to Success (0).')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 73, N'      ''                      Affirmative responses (vbYes, vbOK) will always be returned as')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 74, N'      ''                      vbYes. For two-state prompts, negative responses (vbNo, vbCancel)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 75, N'      ''                      will always be returned as vbNo. For three-state prompts, the')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 76, N'      ''                      response will always be returned in PromptResponse regardless')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 77, N'      ''                      what is specified for this parameter. Possible values for')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 78, N'      ''                      three-state prompts are vbYes, vbNo, and vbCancel.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 79, N'      ''4- BaseMsg         -- String Name of actual message to be used (e.g. mE=CmdFailed)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 80, N'      ''5-19 Parm1-Parm15  -- String substitutions. If the parms start with the "@" character,')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 81, N'      ''                      then they are considered string names instead of literal strings.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 82, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 83, N'      ''EXAMPLES:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 84, N'      ''  MsgApp(Clear, Prompt, SuccessFailure, mCmdPerform, @sDelete)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 85, N'      ''  MsgApp(Clear, Prompt, ReturnAction, mCmdContinueNoYes, @sGenerateVoucher)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 86, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 87, N'      ''InLine list String Names (List Item Pair) should be formatted as follows:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 88, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 89, N'      ''  @s<PropertyClassName>=X or @s<PropertyClassName>=X=Y')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 90, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 91, N'      ''  where <PropertyClassName> is the appropriate PropertyClassName and')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 92, N'      ''  X and Y respectively represent valid options. (e.g. @sCoStatus=O)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 93, N'      ''********************************************************************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 94, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 95, N'      Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 96, N'         Dim strTemp As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 97, N'         Dim VBButtons As MsgBoxStyle')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 98, N'         Dim strMessage As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 99, N'         Dim strFind As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 100, N'         Dim strReplace As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 101, N'         Dim strReplaceValue As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 102, N'         Dim strPromptButtons As String = String.Empty')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 103, N'         Dim iResponse As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 104, N'         Dim iParmIndex As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 105, N'         Dim iSrchIndex As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 106, N'         Dim iIcon As MsgBoxStyle')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 107, N'         Dim bTriState As Boolean')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 108, N'         Dim strYes As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 109, N'         Dim strNo As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 110, N'         Dim strOK As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 111, N'         Dim strCancel As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 112, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 113, N'         '' Defaults')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 114, N'         iIcon = vbInformation')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 115, N'         bTriState = False')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 116, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 117, N'         Me.ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 118, N'         bTriState = False')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 119, N'         '' On Error GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 120, N'         Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 121, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 122, N'            If ParameterCount() < 3 Then Throw New Exception("Required parameters not present.")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 123, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 124, N'            strYes = Application.GetStringValue("sYes")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 125, N'            If strYes = "" Then strYes = "Yes"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 126, N'            strNo = Application.GetStringValue("sNo")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 127, N'            If strNo = "" Then strNo = "No"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 128, N'            strOK = Application.GetStringValue("sOK")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 129, N'            If strOK = "" Then strOK = "OK"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 130, N'            strCancel = Application.GetStringValue("sCancel")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 131, N'            If strCancel = "" Then strCancel = "Cancel"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 132, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 133, N'            ''Initialize variables if "Clear" is specified.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 134, N'            If GetParameter(0) = "Clear" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 135, N'               ThisForm.Variables("PromptMsg").Value = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 136, N'               ThisForm.Variables("PromptButtons").Value = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 137, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 138, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 139, N'            ''Get Base Message and Icon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 140, N'            strMessage = Application.GetStringValue(GetParameter(3))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 141, N'            If strMessage = GetParameter(3) Then Throw New Exception("Base Message """ & strMessage & """ not found.")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 142, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 143, N'            If Mid(GetParameter(3), 2, 1) = "Q" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 144, N'               iIcon = vbQuestion')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 145, N'            ElseIf Mid(GetParameter(3), 2, 1) = "W" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 146, N'               iIcon = vbExclamation')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 147, N'            ElseIf Mid(GetParameter(3), 2, 1) = "E" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 148, N'               iIcon = vbCritical')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 149, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 150, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 151, N'            ''Get Buttons')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 152, N'            iSrchIndex = InStr(strMessage, "^")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 153, N'            If iSrchIndex > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 154, N'               strPromptButtons = Mid(strMessage, iSrchIndex + 1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 155, N'               strMessage = Left(strMessage, iSrchIndex - 1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 156, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 157, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 158, N'            ''Substitute parms in %n placeholders')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 159, N'            For iParmIndex = (ParameterCount() - 1) To 4 Step -1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 160, N'               strFind = "%" + Format(Hex(iParmIndex - 3)) '' msg strings use hex-numbered parms')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 161, N'               strReplace = GetParameter(iParmIndex)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 162, N'               ''  Look for @<string_object_name>')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 163, N'               If ("@" = Left(strReplace, 1)) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 164, N'                  strReplace = Mid(strReplace, 2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 165, N'                  strReplaceValue = Application.GetStringValue(strReplace)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 166, N'                  If (strReplaceValue = strReplace) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 167, N'                     strReplaceValue = ConstructListPairCombinationValue(strReplace)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 168, N'                  End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 169, N'                  strReplace = strReplaceValue')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 170, N'               ElseIf IsNumeric(strReplace) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 171, N'                  '' Change numeric to display value for the language override')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 172, N'                  '' Cannot opt to format numeric data with thousands separator')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 173, N'                  '' else you will format check numbers or other numeric string data')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 174, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 175, N'                  Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 176, N'                     strReplace = Application.OSNumericToDisplayNumeric(strReplace)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 177, N'                  Catch ex As Exception')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 178, N'                     '' if an error occurs here, it is because we')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 179, N'                     '' don''t have the right version of the toolset, and we')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 180, N'                     '' should just use strReplace.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 181, N'                  End Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 182, N'               ElseIf IsDate(strReplace) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 183, N'                  '' Change date to display value for the language override')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 184, N'                  '' If the time data is not meaningful (00:00:00)- display only the date.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 185, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 186, N'                  Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 187, N'                     If DateValue(strReplace) = CDate(strReplace) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 188, N'                        strReplace = Application.OSDateToDisplayDate(strReplace, "D")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 189, N'                     Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 190, N'                        strReplace = Application.OSDateToDisplayDate(strReplace)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 191, N'                     End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 192, N'                  Catch ex As Exception')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 193, N'                     '' if an error occurs here, it is because we')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 194, N'                     '' don''t have the right version of the toolset, and we')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 195, N'                     '' should just use strReplace.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 196, N'                  End Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 197, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 198, N'               strMessage = Replace(strMessage, strFind, strReplace)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 199, N'            Next iParmIndex')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 200, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 201, N'            If (ThisForm.Variables("PromptMsg").Value <> "") Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 202, N'               strMessage = Chr(13) + Chr(13) + strMessage')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 203, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 204, N'            ThisForm.Variables("PromptMsg").Value = ThisForm.Variables("PromptMsg").Value + strMessage')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 205, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 206, N'            ''Prompt the user?')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 207, N'            strTemp = GetParameter(1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 208, N'            If strTemp <> "" And strTemp <> "NoPrompt" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 209, N'               ''Check for Icon specification')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 210, N'               If InStr(strTemp, "-W") > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 211, N'                  iIcon = vbExclamation')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 212, N'               ElseIf InStr(strTemp, "-Q") > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 213, N'                  iIcon = vbQuestion')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 214, N'               ElseIf InStr(strTemp, "-E") > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 215, N'                  iIcon = vbCritical')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 216, N'               ElseIf InStr(strTemp, "-I") > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 217, N'                  iIcon = vbInformation')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 218, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 219, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 220, N'               ''Strip Icon Specification off buttons')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 221, N'               If InStr(strTemp, "-") > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 222, N'                  strTemp = Left(strTemp, InStr(strTemp, "-") - 1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 223, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 224, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 225, N'               If strTemp <> "Prompt" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 226, N'                  strPromptButtons = strTemp')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 227, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 228, N'               Select Case strPromptButtons')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 229, N'                  Case "Yes|No", strYes & "|" & strNo')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 230, N'                     VBButtons = vbYesNo OR iIcon OR vbDefaultButton1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 231, N'                  Case "No|Yes", strNo & "|" & strYes')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 232, N'                     VBButtons = vbYesNo OR iIcon OR vbDefaultButton2')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 233, N'                  Case "Yes|No|Cancel", strYes & "|" & strNo & "|" & strCancel')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 234, N'                     bTriState = True')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 235, N'                     VBButtons = vbYesNoCancel OR iIcon OR vbDefaultButton1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 236, N'                  Case "No|Yes|Cancel", strNo & "|" & strYes & "|" & strCancel')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 237, N'                     bTriState = True')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 238, N'                     VBButtons = vbYesNoCancel OR iIcon OR vbDefaultButton2')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 239, N'                  Case "OK|Cancel", strOK & "|" & strCancel')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 240, N'                     VBButtons = vbOKCancel OR iIcon OR vbDefaultButton1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 241, N'                  Case "Cancel|OK", strCancel & "|" & strOK')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 242, N'                     VBButtons = vbOKCancel OR iIcon OR vbDefaultButton2')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 243, N'                  Case Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 244, N'                     VBButtons = vbOKOnly OR iIcon')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 245, N'               End Select')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 246, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 247, N'               iResponse = Application.ShowMessage(ThisForm.Variables("PromptMsg").Value, VBButtons)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 248, N'               If GetParameter(2) = "ReturnAction" Or bTriState Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 249, N'                  ''Only return one type of affirmative (vbYes)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 250, N'                  If iResponse = vbYes Or iResponse = vbOK Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 251, N'                     iResponse = vbYes')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 252, N'                  End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 253, N'                  ''If Not TriState, return vbNo or vbCancel as vbNo')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 254, N'                  If (Not bTriState) And _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 255, N'                     (iResponse = vbNo Or iResponse = vbCancel) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 256, N'                     iResponse = vbNo')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 257, N'                  End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 258, N'                  ThisForm.Variables("PromptResponse").Value = CStr(iResponse)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 259, N'               Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 260, N'                  ''Only set Success/Failure returns if ReturnAction output')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 261, N'                  ''is not specified.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 262, N'                  Select Case iResponse')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 263, N'                     Case vbYes, vbOK')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 264, N'                        Me.ReturnValue = "0"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 265, N'                     Case Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 266, N'                        Me.ReturnValue = "1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 267, N'                  End Select')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 268, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 269, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 270, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 271, N'            ''If strPromptButtons set, set PromptButtons Form variable with "Question"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 272, N'            ''Icon.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 273, N'            If Len(strPromptButtons) > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 274, N'               ThisForm.Variables("PromptButtons").Value = strPromptButtons + "-Q"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 275, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 276, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 277, N'         Catch ex As Exception')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 278, N'            Application.ShowMessage("MsgApp: " & ex.Message, vbCritical)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 279, N'            Me.ReturnValue = "1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 280, N'         End Try')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 281, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 282, N'      End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 283, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 284, N'      ''************************************************************************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 285, N'      ''Function ConstructListPairCombinationValue:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 286, N'      ''This function will take a string name that may represent a List Item Pair')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 287, N'      ''combination (e.g. sCoStatus:O:P) and attempt to create a resulant value')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 288, N'      ''of concatentated List Item Pair values. Each List Item Pair should exist')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 289, N'      ''as a string in the database, but their combinatorial specifications')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 290, N'      ''must be constructed dynamically.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 291, N'      ''')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 292, N'      ''  Input Parm: String specification to be dereferenced. It has already been')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 293, N'      ''              determined before calling this function that an entry for this')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 294, N'      ''              string does not exist. It is therefore a possible candidate')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 295, N'      ''              for a List Item Pair combination specification.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 296, N'      ''  RETURNS:    The constructed List Item Pair values, each delimited by ";".')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 297, N'      ''              If no valid string entries exist for the individually parsed')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 298, N'      ''              options, then the input parm is returned as is.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 299, N'      ''*************************************************************************')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 300, N'      Function ConstructListPairCombinationValue(ByVal strParm As String) As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 301, N'         Dim strConstructedParmValue As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 302, N'         Dim strStringOptions As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 303, N'         Dim strOption As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 304, N'         Dim strBaseString As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 305, N'         Dim strListPair As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 306, N'         Dim strListPairValue As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 307, N'         Dim iStrIndex As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 308, N'         Dim bUndefinedValueFlag As Boolean')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 309, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 310, N'         strConstructedParmValue = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 311, N'         bUndefinedValueFlag = False')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 312, N'         ''Candidate for ListItemPair object')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 313, N'         iStrIndex = InStr(strParm, "=")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 314, N'         If iStrIndex > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 315, N'            strBaseString = Left(strParm, iStrIndex - 1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 316, N'            strStringOptions = Mid(strParm, iStrIndex + 1, Len(strParm) - iStrIndex)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 317, N'            ''Loop through constructing and retrieving each option')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 318, N'            While iStrIndex > 0')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 319, N'               iStrIndex = InStr(strStringOptions, "=")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 320, N'               If iStrIndex > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 321, N'                  strOption = Left(strStringOptions, iStrIndex - 1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 322, N'                  strStringOptions = Mid(strStringOptions, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 323, N'                                         iStrIndex + 1, _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 324, N'                                         Len(strStringOptions) - iStrIndex)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 325, N'               Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 326, N'                  strOption = strStringOptions')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 327, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 328, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 329, N'               strListPairValue = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 330, N'               strListPair = strBaseString + "=" + strOption')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 331, N'               strListPairValue = Application.GetStringValue(strListPair)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 332, N'               If (strListPairValue <> strListPair) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 333, N'                  If Len(strConstructedParmValue) = 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 334, N'                     If bUndefinedValueFlag = True Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 335, N'                        strConstructedParmValue = "<undefined value>" + "; " + strListPairValue')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 336, N'                     Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 337, N'                        strConstructedParmValue = strListPairValue')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 338, N'                     End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 339, N'                  Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 340, N'                     strConstructedParmValue = strConstructedParmValue + "; " + strListPairValue')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 341, N'                  End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 342, N'                  bUndefinedValueFlag = False')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 343, N'               Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 344, N'                  bUndefinedValueFlag = True')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 345, N'                  If Len(strConstructedParmValue) > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 346, N'                     strConstructedParmValue = strConstructedParmValue + "; " + "<undefined value>"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 347, N'                  End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 348, N'               End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 349, N'            End While')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 350, N'         End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 351, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 352, N'         If Len(strConstructedParmValue) > 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 353, N'            ConstructListPairCombinationValue = strConstructedParmValue')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 354, N'         Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 355, N'            ConstructListPairCombinationValue = strParm')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 356, N'         End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 357, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 358, N'      End Function')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 359, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 360, N'   End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'MsgApp', 1, N'[NULL]', 361, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'ReportSubmitted' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'ReportSubmitted' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'ReportSubmitted', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 8, N'Namespace Mongoose.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 9, N'    Public Class ReportSubmitted')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 10, N'        Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 12, N'        Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 13, N'            ''Application.ShowMessage "Report Submitted", vbOKOnly, ThisForm.Caption')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 14, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 15, N'            ThisForm.CallGlobalScript("MsgApp", "Clear", "Prompt", "SuccessFailure", _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 16, N'                "I=ReportSubmitted", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 17, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 18, N'        End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 19, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 20, N'    End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'ReportSubmitted', 1, N'[NULL]', 21, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'SetUnitCodeComponents' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'SetUnitCodeComponents' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 8, N'Namespace SyteLine.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 9, N'    Public Class SetUnitCodeComponents')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 10, N'        Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 12, N'        '' parameters:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 13, N'        '' 0-3 are the settings, N, R, Y for disabled, required, enabled')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 14, N'        '' 4- ?? are the names of components, in sets of four at a time, to be set based on these values')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 15, N'        Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 16, N'            Dim iUnitCodeIndex As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 17, N'            Dim iUnitCodeSet As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 18, N'            Dim iParmIndex As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 19, N'            Dim bSuccess As Boolean')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 20, N'            Dim strSetting1 As String = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 21, N'            Dim strSetting2 As String = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 22, N'            Dim strSetting3 As String = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 23, N'            Dim strSetting4 As String = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 24, N'            Dim strComponentName As String')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 25, N'            Dim strSetting As String = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 26, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 27, N'            On Error GoTo ErrorHandler')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 28, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 29, N'            bSuccess = ParameterCount > 4')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 30, N'            If (Not bSuccess) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 31, N'                Application.ShowMessage("Internal error: too few parameters")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 32, N'                ReturnValue = "-1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 33, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 34, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 35, N'            If (bSuccess) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 36, N'                iParmIndex = 4')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 37, N'                strSetting1 = GetParameter(0)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 38, N'                strSetting2 = GetParameter(1)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 39, N'                strSetting3 = GetParameter(2)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 40, N'                strSetting4 = GetParameter(3)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 41, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 42, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 43, N'            While (iParmIndex + 3 < ParameterCount)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 44, N'                For iUnitCodeIndex = 0 To 3')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 45, N'                    Select Case iUnitCodeIndex')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 46, N'                        Case 0')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 47, N'                            strSetting = strSetting1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 48, N'                        Case 1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 49, N'                            strSetting = strSetting2')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 50, N'                        Case 2')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 51, N'                            strSetting = strSetting3')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 52, N'                        Case 3')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 53, N'                            strSetting = strSetting4')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 54, N'                    End Select                   ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 55, N'                    ThisForm.Components(GetParameter(iParmIndex)).Enabled = (strSetting <> "N") And (strSetting <> "")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 56, N'                    ThisForm.Components(GetParameter(iParmIndex)).Required = (strSetting = "R")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 57, N'                    If strSetting = "N" Or strSetting = "" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 58, N'                        ''If the current record is not modified then the user is just navigating.  Don''t modify any data.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 59, N'                        '' If the value is already blank, avoid flipping the component''s Modified flag.')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 60, N'                        If Not ThisForm.Components(GetParameter(iParmIndex)).IDOCollection Is Nothing Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 61, N'                            If ThisForm.Components(GetParameter(iParmIndex)).IDOCollection.IsCurrentObjectModified _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 62, N'                            And ThisForm.Components(GetParameter(iParmIndex)).Text <> "" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 63, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 64, N'                                ThisForm.Components(GetParameter(iParmIndex)).Text = ""')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 65, N'                            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 66, N'                        End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 67, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 68, N'                    iParmIndex = iParmIndex + 1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 69, N'                Next iUnitCodeIndex')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 70, N'            End While')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 71, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 72, N'            Exit Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 73, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 74, N'ErrorHandler:')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 75, N'            Application.ShowMessage(GetParameter(iParmIndex) & ": " & Err.Description)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 76, N'            ReturnValue = "-1"')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 77, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 78, N'        End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 79, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 80, N'    End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'SetUnitCodeComponents', 1, N'[NULL]', 81, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM ScriptLines WHERE ScriptName = N'THA_FaDepr.MethodChange' AND [ScopeType] = 1
DELETE FROM Scripts WHERE Name = N'THA_FaDepr.MethodChange' AND [ScopeType] = 1
INSERT INTO Scripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 2, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 7, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 8, N'Namespace SyteLine.GlobalScripts')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 9, N'    Public Class THA_FaDepr_MethodChange')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 10, N'        Inherits GlobalScript')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 11, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 12, N'        Sub Main()')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 13, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 14, N'            Dim lvTot As Decimal')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 15, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 16, NCHAR(9) + N'    Dim t_day As Integer')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 17, N'    ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 18, NCHAR(9) + N'    If IsNumeric(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("UnitsTot")) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 19, N'    ' + NCHAR(9) + N'    ''Thai Loc')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 20, N'    ' + NCHAR(9) + N'    If ThisForm.Variables("vLocVar").Value = "1" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 21, N'        ' + NCHAR(9) + N'ThisForm.GenerateEvent ("GetAcqDate")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 22, N'                    If ThisForm.Variables("VarAddOne").Value = "1" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 23, N'                        t_day = 1')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 24, N'                    Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 25, N'                        t_day = 0')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 26, N'                    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 27, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 28, N'                 ')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 29, NCHAR(9) + N'    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 30, NCHAR(9) + N'    ''Thai Loc')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 31, NCHAR(9) + N'    End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 32, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 33, N'            If Len(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("UnitsTot")) = 0 Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 34, N'                ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh("UnitsTot", "0")')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 35, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 36, N'            If IsNumeric(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("UnitsTot")) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 37, N'                If UCase(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("Method")) <> "USAGE" _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 38, N'                        And ((Len(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("UnitsTot")) = 0 _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 39, N'                                    Or ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("UnitsTot") = "0") _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 40, N'                                Or Len(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("DepFreq")) <> 0) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 41, N'                    If ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("DepFreq") = "P" And _')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 42, N'                       IsNumeric(ThisForm.Variables("NumPeriods").Value) Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 43, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 44, NCHAR(9) + NCHAR(9) + NCHAR(9) + N'If ThisForm.Variables("vLocVar").Value = "1" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 45, N'        ' + NCHAR(9) + N'                lvTot = CDec(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("famLife")) * CDec(ThisForm.Variables("NumPeriods").Value) + t_day ''Thai')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 46, N'                ' + NCHAR(9) + N'Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 47, N'                        ' + NCHAR(9) + N'lvTot = CDec(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("famLife")) * CDec(ThisForm.Variables("NumPeriods").Value)')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 48, NCHAR(9) + N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 49, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 50, N'                        ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh("UnitsTot", CStr(lvTot))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 51, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 52, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 53, N'                    Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 54, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 55, NCHAR(9) + NCHAR(9) + NCHAR(9) + N'If ThisForm.Variables("vLocVar").Value = "1" Then')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 56, N'                        ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh("UnitsTot",Cstr(CDec(ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("famLife")) + t_day))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 57, N'        ' + NCHAR(9) + NCHAR(9) + N'Else')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 58, NCHAR(9) + N'                        ThisForm.PrimaryIDOCollection.SetCurrentObjectPropertyPlusModifyRefresh("UnitsTot", ThisForm.PrimaryIDOCollection.GetCurrentObjectProperty("famLife"))')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 59, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 60, NCHAR(9) + NCHAR(9) + NCHAR(9) + N'End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 61, NCHAR(9) + N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 62, N'                End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 63, N'            End If')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 64, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 65, N'        End Sub')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 66, NULL)
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 67, N'    End Class')
INSERT INTO ScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'THA_FaDepr.MethodChange', 1, N'[NULL]', 68, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'(GSK) Invoices, Debit and Credit Memos Historical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'(GSK) Invoices, Debit and Credit Memos Historical', N'(GSK) Invoices, Debit and Credit Memos Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Amount' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Amount', N'Amount', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Approve' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Approve', N'Approve', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'co_line' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'co_line', N'co_line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Code Task' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Code Task', N'Code  Task', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'CP' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'CP', N'CP', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Customer' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Customer', N'Customer', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Customer Description' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Customer Description', N'Customer  Description', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Customer Name' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Customer Name', N'Customer  Name', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Date' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Date', N'Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Description' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Description', N'Description', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Ending' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Ending', N'Ending', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'f10ERPP_APPaymentDistribution' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'f10ERPP_APPaymentDistribution', N'(ERPP) A/P Payment Distributions (10)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'f10ERPP_APPayments' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'f10ERPP_APPayments', N'(ERPP) A/P Payments (10)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'f10ERPP_ARPaymentDistributions' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'f10ERPP_ARPaymentDistributions', N'(ERPP) A/R Payment Distributions (10)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'f10ERPP_ARPayments' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'f10ERPP_ARPayments', N'(ERPP) A/R Payments (10)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_10ARQuickPaymentApplication' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_10ARQuickPaymentApplication', N'(ERPP) A/R Quick Payment Distributions', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_APBilling' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_APBilling', N'(ERPP) A/P Billing', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_APPaymentDistributions' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_APPaymentDistributions', N'(ERPP) A/P Payment Distributions', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_ARBilling' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_ARBilling', N'(ERPP) A/R Billing', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_BillPayCalendar' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_BillPayCalendar', N'(ERPP) Customer Billing and Payment Calendar', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_ControlCheckNumber' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_ControlCheckNumber', N'(ERPP) Control Check Number', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_FixedAssetDeprReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_FixedAssetDeprReport', N'(ERPP) Fixed Asset Depreciation Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_FixedAssetTransfer' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_FixedAssetTransfer', N'(ERPP) Fixed Asset Transfer', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_FixedAssetTransferPosting' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_FixedAssetTransferPosting', N'(ERPP) Fixed Asset Transfer Posting', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_InputVat' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_InputVat', N'(ERPP) Input Vat', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_PDCAgingCheckDueReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_PDCAgingCheckDueReport', N'(ERPP) Aging Check Due Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_PDCPostCheckDeposit' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_PDCPostCheckDeposit', N'(ERPP) Post Check Deposit', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_Receipt' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_Receipt', N'(ERPP) Receipts', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_ReturnChecks' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_ReturnChecks', N'(ERPP) Return Checks', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPP_TaxCodes' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPP_TaxCodes', N'(ERPP) Tax Codes', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPA/PQuickPaymentApplication' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPA/PQuickPaymentApplication', N'(ERPP) A/ P Quick Payment Application', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPA/RPayments' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPA/RPayments', N'(ERPP) A/R Payments', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPA/RPostedTransactionsDetail' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPA/RPostedTransactionsDetail', N'(ERPP) A/ R Posted Transactions Detail (Billing)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPAgingCheckDueReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPAgingCheckDueReport', N'(ERPP) Aging Check Due Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPAPPayments' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPAPPayments', N'(ERPP) A/P Payments', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPAPPostedTransactionsDetail' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPAPPostedTransactionsDetail', N'(ERPP) A/P Posted Transactions Detail', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPAPVouchersandAdjustments' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPAPVouchersandAdjustments', N'(ERPP) A/P Vouchers and Adjustments', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPARPaymentDistributions' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPARPaymentDistributions', N'(ERPP) A/R Payment Distributions', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPBankCodes' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPBankCodes', N'(ERPP) Bank Reconciliations', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPPDCCheckDepositAR' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPPDCCheckDepositAR', N'(ERPP) PDC Check Deposit A/R', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPPostedCheckDue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPPostedCheckDue', N'(ERPP) Posted Check Due', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'ferppprccheckontheway' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'ferppprccheckontheway', N'(ERPP) A/R Check for Deposit', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fERPPWithholdingTax' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fERPPWithholdingTax', N'(ERPP) Withholding Tax', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_InvoicesDebitandCreditMemosGLDistHistorical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_InvoicesDebitandCreditMemosGLDistHistorical', N'(GSK) Invoices Debit and Credit Memos GL Distribution Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_InvoicesDebitandCreditMemosGLDistribution' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_InvoicesDebitandCreditMemosGLDistribution', N'(GSK) Invoices, Debit and Credit Memos G/L Distribution', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_PreShipAddLocLot' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_PreShipAddLocLot', N'GEN Pre-Ship Add Loc / Lot', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_PreShipAddOrder' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_PreShipAddOrder', N'Gen Pre-Ship Add Order & Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_PreShipAddSerial' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_PreShipAddSerial', N'GEN Pre-Ship Add Serial', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fGSK_PreShipInvoiceLines' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fGSK_PreShipInvoiceLines', N'GEN Pre-Ship Invoice Lines', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_AccountReceivableAgingReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_AccountReceivableAgingReport', N'A/R Aging Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_InvoicesDebitandCreditMemosGLDistHistorical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_InvoicesDebitandCreditMemosGLDistHistorical', N'LTH Invoice, Debit and Credit Memos G/L Distribution Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_InvoicesDebitandCreditMemosGLDistribution' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_InvoicesDebitandCreditMemosGLDistribution', N'LTH Invoice, Debit and Credit Memos G/L Distribution', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_InvoicesDebitandCreditMemosHistorical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_InvoicesDebitandCreditMemosHistorical', N'LTH Invoice, Debit and Credit Memos Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_InvoiceVoucherListing' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_InvoiceVoucherListing', N'LTH Invoice Voucher Listing', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_InvoiceVoucherReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_InvoiceVoucherReport', N'LTH Invoice Voucher Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_OutputVatReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_OutputVatReport', N'LTH Output Vat Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_ReceiptVoucherReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_ReceiptVoucherReport', N'LTH Receipt Voucher Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_VoucherAdjustmentDistribution' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_VoucherAdjustmentDistribution', N'LTH Voucher Adjustment Distribution', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLTH_VoucherAdjustmentDistributionHistorical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLTH_VoucherAdjustmentDistributionHistorical', N'LTH Voucher Adjustment Distribution Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fServiceOrders' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fServiceOrders', N'(GSK) Service Orders', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fTSK_PreShipInvoiceLines' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fTSK_PreShipInvoiceLines', N'GEN Pre-Ship Invoice Lines', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'GSK_ARPaymentDistributionsHistorical' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'GSK_ARPaymentDistributionsHistorical', N'(GSK) A/R Payment Distributions Historical', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Invoice Date' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Invoice Date', N'Invoice  Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Invoice No.' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Invoice No.', N'Invoice  No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Item' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Item', N'Item', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Item Description เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Item Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Item  Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Item Description ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Item Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Item  Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Item เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Item ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Item ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Item ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Item ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Item ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Job' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Job', N'Job', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Line' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Line', N'Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Location' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Location', N'Location', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Machine Description เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Machine Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Machine  Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Machine Description ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Machine Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Machine  Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Machine เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Machine ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Machine ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Machine ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Machine ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Machine ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'mBackEndMessage' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'mBackEndMessage', N'%b', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'mIsNotAValid' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'mIsNotAValid', N'%V is not a valid %L', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Mold Description เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Mold Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Mold  Description ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Mold Description ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Mold Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Mold  Description ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Mold เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Mold ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Mold ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Mold ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Mold ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Mold ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'No' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'No', N'No', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Order' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Order', N'Order', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_1', N'Period_1', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_10' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_10', N'Period_10', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_11' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_11', N'Period_11', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_12' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_12', N'Period_12', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_2', N'Period_2', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_3' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_3', N'Period_3', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_4' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_4', N'Period_4', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_5' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_5', N'Period_5', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_6' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_6', N'Period_6', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_7' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_7', N'Period_7', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_8' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_8', N'Period_8', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Period_9' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Period_9', N'Period_9', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Picture' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Picture', N'Picture', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'PlantID' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'PlantID', N'Plant ID', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Prefix 1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Prefix 1', N'Prefix 1', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Prefix 2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Prefix 2', N'Prefix 2', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Prefix 3' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Prefix 3', N'Prefix 3', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Production BU' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Production BU', N'Production  BU', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Qty' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Qty', N'Qty', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Qty Released เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Qty Released ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Qty  Released ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Receipt BU' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Receipt BU', N'Receipt  BU', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Release' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Release', N'Release', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Remark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Remark', N'Remark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Running No.' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Running No.', N'Running  No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sAddr_1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sAddr_1', N'Addr_1', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sAddr_2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sAddr_2', N'Addr_2', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCarrier' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCarrier', N'Carrier', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCarton', N'Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCartonCombination' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCartonCombination', N'Carton Combination Flag', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCartonPrefix' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCartonPrefix', N'Carton Prefix', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCheckPostedDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCheckPostedDate', N'Check Posted Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCI' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCI', N'CI', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCombinedToCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCombinedToCarton', N'Combined To Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCommit' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCommit', N'Commit', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sConsignee' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sConsignee', N'Consignee', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sConsignor' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sConsignor', N'Consignor', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCurrency' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCurrency', N'Currency', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sCustomer' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sCustomer', N'Customer', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDate', N'Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDeliveryOrder' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDeliveryOrder', N'Delivery Order', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDeliveryOrderLine' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDeliveryOrderLine', N'Delivery Order Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDeliveryOrderValue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDeliveryOrderValue', N'Delivery Order Value', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDescription' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDescription', N'Description', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDiscount' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDiscount', N'Discount', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDistributionDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDistributionDate', N'Distribution Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDobol' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDobol', N'DO/BOL', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sDueDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sDueDate', N'Due Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sEnding' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sEnding', N'Ending', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sEndingCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sEndingCarton', N'Ending Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPP_InputVat' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPP_InputVat', N'(ERPP) Input Vat', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPP_PrintTax' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPP_PrintTax', N'Print Receipt/Tax Invoice', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPP_TaxBasis' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPP_TaxBasis', N'TaxBasis(Baht)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBankCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBankCode', N'Bank of Check', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBankFee' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBankFee', N'Bank Fee', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBankFeeAcct' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBankFeeAcct', N'Bank Fee Acct', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBankOfCheck' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBankOfCheck', N'Bank Of Check', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBillDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBillDate', N'Billing Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBillingNumber' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBillingNumber', N'Billing Number', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPBudgetRemark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPBudgetRemark', N'Budget Remark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPCharLevel' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPCharLevel', N'Characteristic Level', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPCheckDue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPCheckDue', N'Check Due', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPCheckDueDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPCheckDueDate', N'Check Due Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPCheckNum' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPCheckNum', N'Check Num', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPDepDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPDepDate', N'Deposit Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPDepNo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPDepNo', N'Deposit No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPInputVatReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPInputVatReport', N'Input Vat Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPPdcBank' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPPdcBank', N'Bank of Check', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPReservedBudget' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPReservedBudget', N'Reserved Budget', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPReturnDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPReturnDate', N'Return Check Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPTaxAmt' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPTaxAmt', N'Tax Amount(Baht)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPUpdate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPUpdate', N'Update Value', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPValue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPValue', N'Value', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPVatCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPVatCode', N'Vat Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPVendInv' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPVendInv', N'VendorInoice/WHD No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPWhd' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPWhd', N'WHD Tax Informations', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPWhdDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPWhdDate', N'InvoiceDate/WHD Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPWithholdingTax' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPWithholdingTax', N'(ERPP) Withholding Tax Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPWithholdingTaxNo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPWithholdingTaxNo', N'Withholding Tax No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sERPPWithholdingTaxReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sERPPWithholdingTaxReport', N'Withholding  Tax  Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sExtendedPrice' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sExtendedPrice', N'Extended Price', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sFOBPoint' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sFOBPoint', N'FOB Point', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sFreight' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sFreight', N'Freight', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_AddLocLot' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_AddLocLot', N'Add Loc/Lot', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_AddOrderLine' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_AddOrderLine', N'Add Order && Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_AddSerial' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_AddSerial', N'Add Serial', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_Commercial' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_Commercial', N'Commercial', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_DeliveryOrderReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_DeliveryOrderReport', N'Delivery Order Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ETA' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ETA', N'ETA', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ETD' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ETD', N'ETD', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_GenerateInvoiceNumber' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_GenerateInvoiceNumber', N'Generate Invoice Number', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_LineDetail' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_LineDetail', N'Line Detail', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_LocationLot' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_LocationLot', N'Location/Lot', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_LotQty' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_LotQty', N'Lot Qty', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_LotQtyShipped' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_LotQtyShipped', N'Lot Qty Shipped', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_MakerCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_MakerCode', N'Maker Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_MarkerCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_MarkerCode', N'Marker Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_NonCommercial' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_NonCommercial', N'Non Commercial', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_OrderShippingbyPre-Ship' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_OrderShippingbyPre-Ship', N'Order Shipping by Pre-Ship', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_OverseaNote' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_OverseaNote', N'Oversea Note', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_OverseaRemark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_OverseaRemark', N'Oversea Remark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_PickingListReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_PickingListReport', N'Picking List Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_PlanCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_PlanCode', N'Plan Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_PortofDischarge' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_PortofDischarge', N'Port of Discharge', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_PREPAID=P' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_PREPAID=P', N'PREPAID', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_Pre-ShipInvoiceLine' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_Pre-ShipInvoiceLine', N'Pre-Ship Invoice Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_Pre-ShipInvoiceReport' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_Pre-ShipInvoiceReport', N'Pre-Ship Invoice Report', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_PreShipNumber' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_PreShipNumber', N'Pre Ship Number', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_QtyAllocated' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_QtyAllocated', N'Qty Allocated', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_QtyPreshipped' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_QtyPreshipped', N'Qty Preshipped', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_Remark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_Remark', N'Remark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ReturnDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ReturnDate', N'Return Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ReturnOrderShipping' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ReturnOrderShipping', N'Return Order Shipping', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ShipFrom' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ShipFrom', N'Ship From', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ShippingMark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ShippingMark', N'Shipping Mark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_ShippingMarks' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_ShippingMarks', N'Shipping Marks', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGEN_WhseOnHand' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGEN_WhseOnHand', N'Whse On Hand', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGrossWeight' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGrossWeight', N'Gross Weight', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGSK_Cause' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGSK_Cause', NCHAR(3626) + NCHAR(3634) + NCHAR(3648) + NCHAR(3627) + NCHAR(3605) + NCHAR(3640), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGSK_Editing' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGSK_Editing', NCHAR(3585) + NCHAR(3634) + NCHAR(3619) + NCHAR(3649) + NCHAR(3585) + NCHAR(3657) + NCHAR(3652) + NCHAR(3586), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGSK_Protect' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGSK_Protect', NCHAR(3585) + NCHAR(3634) + NCHAR(3619) + NCHAR(3611) + NCHAR(3657) + NCHAR(3629) + NCHAR(3591) + NCHAR(3585) + NCHAR(3633) + NCHAR(3609), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sGSK_Symptoms' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sGSK_Symptoms', NCHAR(3629) + NCHAR(3634) + NCHAR(3585) + NCHAR(3634) + NCHAR(3619), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sHeader' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sHeader', N'New Forms', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sInvoiceDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sInvoiceDate', N'Invoice Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sInvoicee' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sInvoicee', N'Invoicee', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sInvoiceNo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sInvoiceNo', N'Invoice No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Site' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Site', N'Site', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'site_ref' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'site_ref', N'ite_ref', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sItem' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sItem', N'Item', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sItemCategory' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sItemCategory', N'Item Category', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLine' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLine', N'Line', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLocation' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLocation', N'Location', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLot' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLot', N'Lot', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLotTrack' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLotTrack', N'Lot Tracked', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_Branch' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_Branch', N'Branch', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_BranchID' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_BranchID', N'Branch ID', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_BranchType' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_BranchType', N'Branch Type', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_HeadOffice' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_HeadOffice', N'Head Office', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_RVNumber' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_RVNumber', N'RV Number', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_TaxID' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_TaxID', N'Tax ID', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_TaxService' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_TaxService', N'Tax For Service', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_TaxServiceClear' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_TaxServiceClear', N'Tax Service Clear', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_VatRunningNo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_VatRunningNo', N'Vat Running No', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_VendorForInputTaxCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_VendorForInputTaxCode', N'Vendor For Input Tax', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_WHTAmount' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_WHTAmount', N'WHT Amount', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_WHTInformation' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_WHTInformation', N'WHT Information', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_WHTTaxBasis' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_WHTTaxBasis', N'WHT Tax Basis', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_WHTTaxRate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_WHTTaxRate', N'WHT Tax Rate', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLTH_WHTType' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLTH_WHTType', N'WHT Type', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sMeasurement' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sMeasurement', N'Measurement(CUFT)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sMessage' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sMessage', N'Message', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sMiscChgs' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sMiscChgs', N'Misc Charges', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sNetWeight' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sNetWeight', N'Net Weight', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sNo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sNo', N'No', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPage' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPage', N'Page', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPayment' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPayment', N'Payment No.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPaymentTerms' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPaymentTerms', N'Payment Terms', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPDCBankCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPDCBankCode', N'Bank of Check', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPhysicallyShipped' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPhysicallyShipped', N'Physically Shipped', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPickupDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPickupDate', N'Pickup Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPostedToJournal' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPostedToJournal', N'Posted To Journal', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrefix1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrefix1', N'Prefix 1', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrefix2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrefix2', N'Prefix 2', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrefix3' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrefix3', N'Prefix 3', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrint/Process' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrint/Process', N'Print/ Process', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrintDOLineSequenceText' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrintDOLineSequenceText', N'Print DO Line Sequence Text', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrintExternalNotes' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrintExternalNotes', N'Print External Notes', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrintInternalNotes' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrintInternalNotes', N'Print Internal Notes', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPrintPostedCheckDue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPrintPostedCheckDue', N'Print Posted Check Due', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sProcess' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sProcess', N'Process', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sProductionBU' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sProductionBU', N'Production  BU', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sProFormaInvoice' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sProFormaInvoice', N'Pro Forma Invoice', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhd' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhd', NCHAR(192) + N'.' + NCHAR(167) + N'.' + NCHAR(180) + N'.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhd1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhd1', NCHAR(227) + NCHAR(186) + NCHAR(195) + NCHAR(209) + NCHAR(186) + NCHAR(195) + NCHAR(205) + NCHAR(167) + NCHAR(161) + NCHAR(210) + NCHAR(195) + NCHAR(203) + NCHAR(209) + NCHAR(161) + NCHAR(192) + NCHAR(210) + NCHAR(201) + NCHAR(213) + N' ' + NCHAR(179) + N'.' + NCHAR(183) + NCHAR(213) + NCHAR(232) + NCHAR(168) + NCHAR(232) + NCHAR(210) + NCHAR(194) + N' (' + NCHAR(169) + NCHAR(186) + NCHAR(209) + NCHAR(186) + NCHAR(183) + NCHAR(213) + NCHAR(232) + N' 1)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhd2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhd2', NCHAR(227) + NCHAR(186) + NCHAR(195) + NCHAR(209) + NCHAR(186) + NCHAR(195) + NCHAR(205) + NCHAR(167) + NCHAR(161) + NCHAR(210) + NCHAR(195) + NCHAR(203) + NCHAR(209) + NCHAR(161) + NCHAR(192) + NCHAR(210) + NCHAR(201) + NCHAR(213) + N' ' + NCHAR(179) + N'.' + NCHAR(183) + NCHAR(213) + NCHAR(232) + NCHAR(168) + NCHAR(232) + NCHAR(210) + NCHAR(194) + N' (' + NCHAR(169) + NCHAR(186) + NCHAR(209) + NCHAR(186) + NCHAR(183) + NCHAR(213) + NCHAR(232) + N' 2)', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhd3' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhd3', NCHAR(227) + NCHAR(186) + NCHAR(181) + NCHAR(232) + NCHAR(205) + N' ' + NCHAR(192) + N'.' + NCHAR(167) + N'.' + NCHAR(180) + N'. 3', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhd4' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhd4', NCHAR(227) + NCHAR(186) + NCHAR(181) + NCHAR(232) + NCHAR(205) + N' ' + NCHAR(192) + N'.' + NCHAR(167) + N'.' + NCHAR(180) + N'. 53', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhdExtra' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhdExtra', NCHAR(186) + NCHAR(209) + NCHAR(173) + NCHAR(170) + NCHAR(213) + NCHAR(190) + NCHAR(212) + NCHAR(224) + NCHAR(200) + NCHAR(201) + NCHAR(225) + NCHAR(202) + NCHAR(180) + NCHAR(167) + NCHAR(161) + NCHAR(210) + NCHAR(195) + NCHAR(203) + NCHAR(209) + NCHAR(161) + NCHAR(192) + NCHAR(210) + NCHAR(201) + NCHAR(213) + N' ' + NCHAR(179) + N' ' + NCHAR(183) + NCHAR(213) + NCHAR(232) + NCHAR(168) + NCHAR(232) + NCHAR(210) + NCHAR(194) + NCHAR(225) + NCHAR(197) + NCHAR(208) + NCHAR(161) + NCHAR(210) + NCHAR(195) + NCHAR(185) + NCHAR(211) + NCHAR(202) + NCHAR(232) + NCHAR(167), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sPSCWhdPrt' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sPSCWhdPrt', NCHAR(190) + NCHAR(212) + NCHAR(193) + NCHAR(190) + NCHAR(236) + NCHAR(227) + NCHAR(186) + NCHAR(195) + NCHAR(209) + NCHAR(186) + NCHAR(195) + NCHAR(205) + NCHAR(167) + NCHAR(161) + NCHAR(210) + NCHAR(195) + NCHAR(203) + NCHAR(209) + NCHAR(161) + NCHAR(192) + NCHAR(210) + NCHAR(201) + NCHAR(213) + N' ' + NCHAR(179) + N'.' + NCHAR(183) + NCHAR(213) + NCHAR(232) + NCHAR(168) + NCHAR(232) + NCHAR(210) + NCHAR(194), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sQtyOnHand' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sQtyOnHand', N'Qty On Hand', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sQtyPerCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sQtyPerCarton', N'Qty Per Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sQtyPreShip' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sQtyPreShip', N'Qty Pre-Ship', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sQtyShiped' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sQtyShiped', N'Qty Shiped', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sQuantityShipped' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sQuantityShipped', N'Quantity Shipped', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sReady' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sReady', N'Ready', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sReason' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sReason', N'Reason', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sReceiptBU' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sReceiptBU', N'Receipt  BU', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sRefInvoice' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sRefInvoice', N'Reference Invoice', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sRefVend' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sRefVend', N'Reference Vendor', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sRelease' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sRelease', N'Release', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sRemark' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sRemark', N'Remark', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sRptOpt' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sRptOpt', NCHAR(192) + N'.' + NCHAR(167) + N'.' + NCHAR(180) + N'.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sSel' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sSel', N'Sel.', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sSelect' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sSelect', N'Select', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sSeq' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sSeq', N'Seq', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sSequence' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sSequence', N'Sequence', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sSerial' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sSerial', N'Serial', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sShipDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sShipDate', N'Ship Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sShippedBy' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sShippedBy', N'Shipped By', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sShipTo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sShipTo', N'Ship To', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sShipVia' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sShipVia', N'Ship Via', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sStarting' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sStarting', N'Starting', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sStartingCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sStartingCarton', N'Starting Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sStatus' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sStatus', N'Status', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Start Date เดิม' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Start Date ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), N'Start  Date ' + NCHAR(3648) + NCHAR(3604) + NCHAR(3636) + NCHAR(3617), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Start Date ใหม่' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Start Date ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), N'Start  Date ' + NCHAR(3651) + NCHAR(3627) + NCHAR(3617) + NCHAR(3656), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Starting' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Starting', N'Starting', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTaxCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTaxCode', N'Tax Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTaxID' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTaxID', N'Tax ID', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTermsCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTermsCode', N'Terms Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTHAFromPort' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTHAFromPort', N'From Port', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTHASizeOfCarton' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTHASizeOfCarton', N'Size Of Carton', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTHAToPort' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTHAToPort', N'To Port', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sTotal' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sTotal', N'Total', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Suffix' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Suffix', N'Suffix', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sUM' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sUM', N'UM', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sUnitPrice' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sUnitPrice', N'Unit Price', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sUpdateDate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sUpdateDate', N'Update Date', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sUserDesc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sUserDesc', N'User Description', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sVatCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sVatCode', N'Vat Code', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sWeight' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sWeight', N'Weight', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sWhse' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sWhse', N'Whse', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sYes' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sYes', N'Yes', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Task Name' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Task Name', N'Task  Name', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Vat' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Vat', N'Vat', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'Weight Material' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'Weight Material', N'Weight  Material', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'การป้องกัน' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (NCHAR(3585) + NCHAR(3634) + NCHAR(3619) + NCHAR(3611) + NCHAR(3657) + NCHAR(3629) + NCHAR(3591) + NCHAR(3585) + NCHAR(3633) + NCHAR(3609), NCHAR(3585) + NCHAR(3634) + NCHAR(3619) + NCHAR(3611) + NCHAR(3657) + NCHAR(3629) + NCHAR(3591) + NCHAR(3585) + NCHAR(3633) + NCHAR(3609), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'รหัส สาเหตุ' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (NCHAR(3619) + NCHAR(3627) + NCHAR(3633) + NCHAR(3626) + N' ' + NCHAR(3626) + NCHAR(3634) + NCHAR(3648) + NCHAR(3627) + NCHAR(3605) + NCHAR(3640), NCHAR(3619) + NCHAR(3627) + NCHAR(3633) + NCHAR(3626) + N' ' + NCHAR(3626) + NCHAR(3634) + NCHAR(3648) + NCHAR(3627) + NCHAR(3605) + NCHAR(3640), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'รายละเอียดสาเหตุ' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (NCHAR(3619) + NCHAR(3634) + NCHAR(3618) + NCHAR(3621) + NCHAR(3632) + NCHAR(3648) + NCHAR(3629) + NCHAR(3637) + NCHAR(3618) + NCHAR(3604) + NCHAR(3626) + NCHAR(3634) + NCHAR(3648) + NCHAR(3627) + NCHAR(3605) + NCHAR(3640), NCHAR(3619) + NCHAR(3634) + NCHAR(3618) + NCHAR(3621) + NCHAR(3632) + NCHAR(3648) + NCHAR(3629) + NCHAR(3637) + NCHAR(3618) + NCHAR(3604) + NCHAR(3626) + NCHAR(3634) + NCHAR(3648) + NCHAR(3627) + NCHAR(3605) + NCHAR(3640), NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'BCNB_ValidateColine' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'BCNB_ValidateColine', 1, N'[NULL]', 14, N'SCRIPTTEXT(Option Explicit On ' + NCHAR(13) + NCHAR(10) + N'Option Strict On  ' + NCHAR(13) + NCHAR(10) + N'Imports System ' + NCHAR(13) + NCHAR(10) + N'Imports Microsoft.VisualBasic ' + NCHAR(13) + NCHAR(10) + N'Imports Mongoose.IDO.Protocol ' + NCHAR(13) + NCHAR(10) + N'Imports Mongoose.Scripting  ' + NCHAR(13) + NCHAR(10) + N'Namespace SyteLine.GlobalScripts ' + NCHAR(13) + NCHAR(10) + N'Public class Validator_BCNB_ValidateColine ' + NCHAR(13) + NCHAR(10) + N'Inherits GlobalScript  ' + NCHAR(13) + NCHAR(10) + N'Sub Main()     ' + NCHAR(13) + NCHAR(10) + N'Dim ErrNoVar As String     ' + NCHAR(13) + NCHAR(10) + N'Dim Ret As Integer     ' + NCHAR(13) + NCHAR(10) + N'Ret = ThisForm.GenerateEvent("BC_ValidateCoLine")     ' + NCHAR(13) + NCHAR(10) + N'ErrNoVar = ThisForm.Variables("ErrNoVar").Value     ' + NCHAR(13) + NCHAR(10) + N'ReturnValue = ErrNoVar ' + NCHAR(13) + NCHAR(10) + N'End Sub  ' + NCHAR(13) + NCHAR(10) + N'End Class ' + NCHAR(13) + NCHAR(10) + N'End', N' Namespace )', NULL, N'mNotValidLine', NULL, N'Created By Narendra (Blue Chip, Bangalore)') 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'BCNB_ValidateRelease' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'BCNB_ValidateRelease', 1, N'[NULL]', 14, N'SCRIPTTEXT(Option Explicit On' + NCHAR(13) + NCHAR(10) + N'Option Strict On' + NCHAR(13) + NCHAR(10) + NCHAR(13) + NCHAR(10) + N'Imports System' + NCHAR(13) + NCHAR(10) + N'Imports Microsoft.VisualBasic' + NCHAR(13) + NCHAR(10) + N'Imports Mongoose.IDO.Protocol' + NCHAR(13) + NCHAR(10) + N'Imports Mongoose.Scripting' + NCHAR(13) + NCHAR(10) + NCHAR(13) + NCHAR(10) + NCHAR(13) + NCHAR(10) + N'Namespace Mongoose.GlobalScripts' + NCHAR(13) + NCHAR(10) + N'Public Class Validator_BCNB_ValidateRelease' + NCHAR(13) + NCHAR(10) + N'Inherits GlobalScript' + NCHAR(13) + NCHAR(10) + NCHAR(13) + NCHAR(10) + N'Sub Main()' + NCHAR(13) + NCHAR(10) + N'   ReturnValue = "0"' + NCHAR(13) + NCHAR(10) + N'End Sub' + NCHAR(13) + NCHAR(10) + N'End Class' + NCHAR(13) + NCHAR(10) + N'End Namespace' + NCHAR(13) + NCHAR(10) + N')', NULL, NULL, N'mNotValidRelease', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'BGTaskName' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'BGTaskName', 1, N'[NULL]', 9, N'MGCore.BGTaskDefinitions( PROPERTY(TaskName) FILTER(TaskTypeCode = ''RPT'') )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'DefaultStartingToEnding' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'DefaultStartingToEnding', 1, N'[NULL]', 11, N'DefaultStartingToEnding( %1,%2 )', NULL, NULL, N'mBlank', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_AcctCont' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_AcctCont', 1, N'[NULL]', 9, N'SL.SLCharts( PROPERTY(Acct) FILTER(Type <> ''S'' )  NLC()SETP(%1=AccessUnit1, %2=AccessUnit2, %3=AccessUnit3, %4=AccessUnit4, %5=Description, %11=Type)SETV(%6=AccessUnit1, %7=AccessUnit2, %8=AccessUnit3, %9=AccessUnit4, %10=Description) )', NULL, NULL, N'mIsNotAValidOrIsStatisticalAccount', NULL, N'Does not allow Statistical Accounts') 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_AcctValid' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_AcctValid', 1, N'[NULL]', 7, N'SL.SLCharts.ChkAcctSp( PARMS(VAR P(%1), VAR P(%2), MESSAGE) )', NULL, NULL, N'mValidatorMethodMessage', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_BSS_Unit1Desc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_BSS_Unit1Desc', 1, N'[NULL]', 9, N'SLChartUnitcd1s( PROPERTY(unit1) SETC(AcctCodeDesc1=Unitcd1Description) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_BSS_Unit2Desc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_BSS_Unit2Desc', 1, N'[NULL]', 9, N'SLChartUnitcd2s( PROPERTY(unit2) SETC(AcctCodeDesc2=Unitcd2Description) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_BSS_Unit4Desc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_BSS_Unit4Desc', 1, N'[NULL]', 9, N'SLChartUnitcd4s( PROPERTY(unit4) SETC(AcctCodeDesc4=Unitcd4Description) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_Car' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_Car', 1, N'[NULL]', 12, N'OFTO()', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_CarType' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_CarType', 1, N'[NULL]', 9, N'ERPP_TransportCarTypes( PROPERTY(Car_Type) SETC(edit1=Car_TypeDescription) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_CarTypeDesc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_CarTypeDesc', 1, N'[NULL]', 9, N'ERPP_TransportCarTypes( PROPERTY(Car_Type) SETP(Car_TypeDescription=Car_TypeDescription) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_GetCustFromCO' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_GetCustFromCO', 1, N'[NULL]', 9, N'TABLE!ERPP_GetCoFromRouteView( PROPERTY(co_num) FILTER(whse=''C(WhseEdit)'') SETC(erpOrderitmcust_numSubGridCol=cust_num, erpOrderitmShiptoSubGridCol=cust_seq) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_Item' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_Item', 1, N'[NULL]', 9, N'SLItemsNonInventoryItems( PROPERTY(Item) SETC(ItemTypeEdit=DerIsInventory) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_ItemSetC' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_ItemSetC', 1, N'[NULL]', 9, N'SLItems( PROPERTY(Item) SETC(%1=Description, %2=UM) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_LOC_ReceiptVD' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_LOC_ReceiptVD', 1, N'[NULL]', 9, N'ERPP_InvoiceViews( PROPERTY(INV_NUM) DISTINCT() FILTER(CUST_NUM like ''P(cust_num)%'' V(ERPP_Inv)  and RemAmt <> 0) ORDERBY(INV_NUM) SETC(ERPPReceiptDtlinv_seqSubGridCol=INV_SEQ) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_LOC_UserDefineTayeValues' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_LOC_UserDefineTayeValues', 1, N'[NULL]', 9, N'MGCore.UserDefinedTypeValues( PROPERTY(Value) FILTER(TypeName = ''%1'') SETC(PayByDescEdit=Description) )', NULL, NULL, N'mUserDefinedTypeValueNotFound', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_LOC_ValidTaxCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_LOC_ValidTaxCode', 1, N'[NULL]', 9, N'SLDropshiptos( PROPERTY(DropShipNo) DISTINCT() SETP(UDFLongText2=Name) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RateTypeDesc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RateTypeDesc', 1, N'[NULL]', 9, N'UserDefinedTypeValues( PROPERTY(Value) FILTER(TypeName=''ERPP_TransportRateType'') SETP(UDTDesc=Description) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RouteCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RouteCode', 1, N'[NULL]', 9, N'ERPP_TransportRoutes( PROPERTY(Route_Code) SETC(Route_DescriptionEdit=Route_Description) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RouteCode2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RouteCode2', 1, N'[NULL]', 9, N'ERPP_TransportRoutes( PROPERTY(Route_Code) SETC(Route_DescriptionEdit=Route_Description, edit10=Car_Type, edit1=Car_TypeDescription) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RouteCodeDesc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RouteCodeDesc', 1, N'[NULL]', 9, N'ERPP_TransportRoutes( PROPERTY(Route_Code) SETP(Route_Description=Route_Description, DeliveryFillingDay=Filing_Days, DeliveryDay=Delivery_Days) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RptSSCustomerProspectInfo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RptSSCustomerProspectInfo', 1, N'[NULL]', 9, N'ERPP_RptSSCustomerProspectViews( PROPERTY(Code) SETP(customer_name=Name, contact_person=Contact, curr_code=CurrCode, department=Department) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RptSSItemCustInfo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RptSSItemCustInfo', 1, N'[NULL]', 9, N'SLItemcusts( PROPERTY(Item) READMODE(COMMITTED) DISTINCT() FILTER(Item=P(sk_part_no) and CustNum=P(cust_num)) ORDERBY(Item) SETP(sk_part_name=ItmDescription, customer_part_no=EndUser, unit=UM) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RptSSOppStatsInfo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RptSSOppStatsInfo', 1, N'[NULL]', 7, NULL, NULL, NULL, N'mNotAValidForm', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_RptSSOppStatusInfo' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_RptSSOppStatusInfo', 1, N'[NULL]', 9, N'SLOpportunityStatuses( PROPERTY(OpportunityStatus) READMODE(COMMITTED) DISTINCT() ORDERBY(OpportunityStatus) SETP(opportunity_status_desc=Description) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_SetCar' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_SetCar', 1, N'[NULL]', 9, N'ERPP_Transport_Cars( PROPERTY(car_num) FILTER(car_type=''C(Car_TypeEdit)'') SETP(Car_Driver1=Driver_Full_Name, Car_Loader1=Loader_Full_Name)SETC(carDescEdit=car_description) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_Status' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_Status', 1, N'[NULL]', 12, N'OFTO()', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TaxPlaceValidate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TaxPlaceValidate', 1, N'[NULL]', 9, N'SLDropshiptos( PROPERTY(DropShipNo) SETC(%1=County) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TransCarTypVal' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TransCarTypVal', 1, N'[NULL]', 9, N'ERPP_TransportCarTypes( PROPERTY(Car_Type) SETP(Car_TypeDescription=Car_TypeDescription, Qty_per_Truck=Qty_per_Truck, Transport_UM=Transport_UM, Weight_per_Truck=_Weight_KG___per_Truck) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TransPerson' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TransPerson', 1, N'[NULL]', 9, N'ERPP_TransportPersons( PROPERTY(Person_id) FILTER(Type=''%1'') SETP(%2=Full_Name) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TransportOrderCarType' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TransportOrderCarType', 1, N'[NULL]', 9, N'ERPP_TransportCarTypes( PROPERTY(Car_Type) SETC(Qty_per_TruckEdit=Qty_per_Truck, Transport_UMEdit=Transport_UM, Weight_per_TruckEdit=_Weight_KG___per_Truck) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TransportOrderRoute' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TransportOrderRoute', 1, N'[NULL]', 9, N'ERPP_TransportRoutes( PROPERTY(Route_Code) SETC(Route_DescriptionEdit=Route_Description) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TransportOrderWhse' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TransportOrderWhse', 1, N'[NULL]', 10, N'PROPERTY(Whse) SETC(whsenameEdit=Name)', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_TranUM' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_TranUM', 1, N'[NULL]', 9, N'SLUMs( PROPERTY(UM) SETC(Transport_UMDescriptionEdit=Description) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_UMDesc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_UMDesc', 1, N'[NULL]', 9, N'SL.SLUMs( PROPERTY(UM) SETP(TransUMdesc=Description) )', NULL, NULL, N'mlsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_UserDefinedTypeValue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_UserDefinedTypeValue', 1, N'[NULL]', 9, N'MGCore.UserDefinedTypeValues( PROPERTY(Value) FILTER(TypeName = ''%1'') SETC(%2=Description) )', NULL, NULL, N'mUserDefinedTypeValueNotFound', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERPP_ValidTaxCode' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERPP_ValidTaxCode', 1, N'[NULL]', 9, N'SLShipTos( PROPERTY(DropShipNo) DISTINCT() SETP(Uf_ERPP_BranchDesc=Name) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'ERRP_BSS_Unit3Desc' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'ERRP_BSS_Unit3Desc', 1, N'[NULL]', 9, N'SLChartUnitcd3s( PROPERTY(unit3) SETC(AcctCodeDesc3=Unitcd3Description) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'gen_customer_preship_vld' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'gen_customer_preship_vld', 1, N'[NULL]', 9, N'SL.SLCustomers( PROPERTY(CustNum) FILTER(CustSeq=0)  NLC()V(vsp_gen_customer_preship_vld) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_GetPreShipLineNonValidate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_GetPreShipLineNonValidate', 1, N'[NULL]', 9, N'GEN_preship_inv_line_nons( PROPERTY(Item) DISTINCT() FILTER(PreShipNumber=''P(PreShipNumber)'' AND Item=''P(part_no)'') SETP(qty=QtyPreShip, um=UM, description=Description, UbQtyAllocated=QtyPreShip) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_GetPreShipLineValidate' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_GetPreShipLineValidate', 1, N'[NULL]', 9, N'GEN_preship_inv_lines( PROPERTY(Seq) DISTINCT() FILTER(PreShipNumber=''P(PreShipNumber)'' AND Seq=''P(seq)'')  OIO() NLC()SETP(part_no=Item, qty=QtyPreShip, um=UM, nw_kgs=weight_allocated, description=Description, UbQtyAllocated=QtyPreShip, UbWeightAllocated=ItemUnitWeight) )', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_LocForitemWhseLotByVar' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_LocForitemWhseLotByVar', 1, N'[NULL]', 9, N'SLItemLocs( PROPERTY(Loc) DISTINCT() FILTER(Item=FV(%1) AND Whse=FV(%2)) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_SlsmanAll' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_SlsmanAll', 1, N'[NULL]', 9, N'SLSlsmanAlls( PROPERTY(Slsman) SETP(%1=DerSlsmanName) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_UserDefinedTypeValue' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_UserDefinedTypeValue', 1, N'[NULL]', 9, N'MGCore.UserDefinedTypeValues( PROPERTY(Value) FILTER(TypeName = ''%1'') SETP(%2=Description) )', NULL, NULL, N'mUserDefinedTypeValueNotFound', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_ValidateCustSeq' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_ValidateCustSeq', 1, N'[NULL]', 9, N'SL.SLCustomers( PROPERTY(CustSeq) FILTER(CustNum = FP(%1)) V(vsp_GEN_ValidateCustSeq) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GEN_WhseAllSites' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GEN_WhseAllSites', 1, N'[NULL]', 9, N'SL.SLWhseAlls( PROPERTY(Whse) FILTER(SiteRef = FV(%1))  NLC() )', NULL, NULL, N'mE=NoExistIsLV', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GenerateEventNoMsg' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GenerateEventNoMsg', 1, N'[NULL]', 11, N'GenerateEventWithReturn( %1 )', NULL, NULL, N'mBlank', NULL, N'Generate Event without displaying a Success/Failure message') 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GenerateEventWithMessage' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GenerateEventWithMessage', 1, N'[NULL]', 14, N'SCRIPTTEXT(Option Explicit On' + NCHAR(10) + N'Option Strict On' + NCHAR(10) + NCHAR(10) + N'Imports System' + NCHAR(10) + N'Imports Microsoft.VisualBasic' + NCHAR(10) + N'Imports Mongoose.IDO.Protocol' + NCHAR(10) + N'Imports Mongoose.Scripting' + NCHAR(10) + NCHAR(10) + N'Namespace SyteLine.GlobalScripts' + NCHAR(10) + N'    Public Class Validator_GenerateEventWithMessage' + NCHAR(10) + N'        Inherits GlobalScript' + NCHAR(10) + NCHAR(10) + N'        Sub Main()' + NCHAR(10) + N'            ReturnValue = CStr(ThisForm.GenerateEvent(GetParameter(0)))' + NCHAR(10) + N'        End Sub' + NCHAR(10) + N'    End Class' + NCHAR(10) + N'End Namespace' + NCHAR(10) + N')', NULL, NULL, N'mVGenerateEventWithMessage', NULL, N'%1 is the event to generate; caller must set V(GenerateEventWithMessage) with the message to be displayed if an error occurs') 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'GSK_VLD_Jobtran' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'GSK_VLD_Jobtran', 1, N'[NULL]', 7, N'GSK_ERPP_LossTimes.GSK_GetJobtranInfoSp( PARMS(VAR P(%1), RVAR P(%2), RVAR P(%3), RVAR P(%4), RVAR P(%5), MESSAGE) )', NULL, NULL, N'mBackEndMessage', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'InLineList' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'InLineList', 1, N'[NULL]', 12, NULL, NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'LTH_VendInputTax' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'LTH_VendInputTax', 1, N'[NULL]', 9, N'SL.SLVendaddrs( PROPERTY(VendNum) FILTER(VndVendNum IS NOT NULL) SETP(%1=VendNum, %2=Name) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'Numeric_SK' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'Numeric_SK', 1, N'[NULL]', 2, N'MIN(-99999999) MAX(99999999)', NULL, NULL, NULL, NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'valItem1' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'valItem1', 1, N'[NULL]', 13, N'SETC(descEdit1=Description)', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'valItem2' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'valItem2', 1, N'[NULL]', 13, N'SETC(descEdit2=Description)', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Validators] WHERE [Name] = N'VendNumLeaveName' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 

INSERT INTO [Validators] ([Name], [ScopeType], [ScopeName], [Type], [Parms], [Parms2], [Parms3], [ErrorMsg], [LockedBy], [Description] ) 
VALUES (N'VendNumLeaveName', 1, N'[NULL]', 9, N'SL.SLVendors( PROPERTY(VendNum) SETP(VadName=Name) )', NULL, NULL, N'mIsNotAValid', NULL, NULL) 
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'amporn' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'amporn', N'2025/05/22 05:11:12', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'kanokwan.ru' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'kanokwan.ru', N'2025/10/09 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'punyapha' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'punyapha', N'2026/01/23 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'ruk' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'ruk', N'2025/11/29 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'saowalak' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'saowalak', N'2025/12/22 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'weena' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'weena', N'2025/07/15 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'JobTransDate' AND ScopeType = 3 AND ScopeName = N'wirot' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'JobTransDate', 3, N'wirot', N'2026/03/16 00:00:00', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'lse_GlbankType' AND ScopeType = 1 AND ScopeName = N'[NULL]' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'lse_GlbankType', 1, N'[NULL]', N'C\sGlbankType=C,D\sGlbankType=D,M\sGlbankType=M,O\sGlbankType=O,W\sGlbankType=W,R\sGlbankType=R,T\sGlbankType=T,E\sGlbankType=E,N\sGlbankType=N,F\sGLBankType=F,A\sGLBankType=A,H\sGLBankType=H', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'lsp_gen_customerpreship' AND ScopeType = 1 AND ScopeName = N'[NULL]' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'lsp_gen_customerpreship', 1, N'[NULL]', N'PROPERTIES(CustNum, Name, Addr_1, Addr_2, Addr_3, Addr_4, Country, County, Zip, City, State, FaxNum, Phone_1, TaxRegNum1, TaxCode1, TaxCode1Description, InvCategory, InvCategoryDescription, TermsCode, TermDescription, Slsman, ShipCode, ShipCodeDescription, CustSeq, DerSalesmanName, Contact_1)', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'lsp_GEN_ShipTosFromCustomer' AND ScopeType = 1 AND ScopeName = N'[NULL]' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'lsp_GEN_ShipTosFromCustomer', 1, N'[NULL]', N'PROPERTIES(CustSeq, Name, Addr_1, Addr_2, Addr_3, Addr_4, Country, County, Zip, City, State, FaxNum, Phone_1, TaxRegNum1, TaxCode1, TaxCode1Description, InvCategory, InvCategoryDescription, TermsCode, TermDescription, Slsman, ShipCode, ShipCodeDescription, DerSalesmanName)', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'Tax2AmountLabel' AND ScopeType = 3 AND ScopeName = N'BOONYOD' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'Tax2AmountLabel', 3, N'BOONYOD', N's<UnusedTaxAmount2>', NULL, NULL, NULL, N'Tax2Amount')
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'vsp_gen_customer_preship_vld' AND ScopeType = 1 AND ScopeName = N'[NULL]' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'vsp_gen_customer_preship_vld', 1, N'[NULL]', N'SETP(%1=Name, %2=InvCategory, %3=InvCategoryDescription, %4=TaxCode1, %5=TaxCode1Description, %6=TermsCode, %7=TermDescription, %8=Slsman, %9=DerSalesmanName, %10=ShipCode, %11=ShipCodeDescription, %12=Addr_1, %13=Addr_2, %14=Addr_3, %15=Addr_4, %16=Addr_1, %17=Addr_2, %18=Addr_3, %19=Addr_4, %20=City, %21=TaxRegNum1, %22=Phone_1, %23=Zip, %24=FaxNum, %25=CustSeq, %26=Name, %27=Contact_1, %28=Phone_1, %29=FaxNum, %30=City, %31=Phone_1, %32=Zip, %33=FaxNum, %34=Country)', NULL, NULL, NULL, NULL)
-------------------------------------------------------------------------------
DELETE FROM [Variables] WHERE FormID = -1 AND Name = N'vsp_GEN_ValidateCustSeq' AND ScopeType = 1 AND ScopeName = N'[NULL]' 

INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (-1, N'vsp_GEN_ValidateCustSeq', 1, N'[NULL]', N'SETP(%2=InvCategory, %3=InvCategoryDescription, %4=TaxCode1, %5=TaxCode1Description, %6=TermsCode, %7=TermDescription, %8=Slsman, %9=DerSalesmanName, %10=ShipCode, %11=ShipCodeDescription, %12=Addr_1, %13=Addr_2, %14=Addr_3, %15=Addr_4, %16=City, %17=TaxRegNum1, %18=Phone_1, %19=Zip, %20=FaxNum, %21=Name, %22=Country)', NULL, NULL, NULL, NULL)

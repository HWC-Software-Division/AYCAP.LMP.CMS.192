/* Temp_FormDefinition table serves for (alt)form definition modifications and is removed by HotfixProcedure */
IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Temp_FormDefinition'))
BEGIN
    CREATE TABLE [Temp_FormDefinition]
    (
        [TempID] [int] NOT NULL IDENTITY (1, 1),
        [ObjectName] [nvarchar] (200) NOT NULL,
        [FormDefinition] [nvarchar] (max) NULL,
        [IsAltForm] [bit] NULL,
        CONSTRAINT [PK_Temp_FormDefinition] PRIMARY KEY CLUSTERED ([TempID])
    ) ON [PRIMARY];
END
ELSE
BEGIN
    DELETE FROM [Temp_FormDefinition];
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 4
BEGIN

INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
VALUES ('media.library',
        '<form version="2"><field column="LibraryID" columntype="integer" guid="00fdb6b0-5f2e-4ef9-8648-1d3c7af8b721" isPK="true" system="true"><properties><fieldcaption>LibraryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="LibraryDisplayName" columnsize="250" columntype="text" guid="9b4aa82c-02df-4712-a5b9-3b9dee377b45" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$medialibrary.librarydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="LibraryName" columnsize="250" columntype="text" guid="e4081abf-652e-47bd-82d0-313752f01873" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$medialibrary.libraryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="LibraryDescription" columntype="longtext" guid="ac965989-ec7a-446f-81bb-ccb5043abf0b" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$medialibrary.librarydescription.description$}</fielddescription></properties><settings><controlname>LocalizableTextArea</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="LibraryTeaserGUID" columntype="guid" guid="1cf86270-1d15-4a07-a3fb-4d97ba972c46" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field column="LibraryFolder" columnsize="250" columntype="text" guid="06f6b6a9-08ca-4735-8732-20cc75d11802" system="true" visible="true"><properties><enabledmacro ismacro="true">{%FormMode == FormModeEnum.Insert|(user)administrator|(hash)0a89b968eb862d72bdc749e4095716028feb4b47d8cca3d195452ef627679385%}</enabledmacro><fieldcaption>{$general.foldername$}</fieldcaption><fielddescription>{$medialibrary.libraryfolder.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryAccess" columntype="integer" guid="720d2865-0be4-43d3-8ed8-412b269b1d00" system="true"><properties><fieldcaption>LibraryAccess</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="LibrarySiteID" columntype="integer" guid="99746a1e-3514-4c13-b878-7bb7b39ddb3d" system="true"><properties><defaultvalue ismacro="true">{%CurrentSite.SiteID|(user)administrator|(hash)f1f36b57555be68f4a774a617ef7f4b296d321c24bd971a578ae7443c86b1480%}</defaultvalue><fieldcaption>LibrarySiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryGUID" columntype="guid" guid="512c11dd-a325-4bf2-b1be-4f7c54397132" system="true"><properties><fieldcaption>LibraryGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="LibraryLastModified" columntype="datetime" guid="54f9c352-5ac2-4e4b-ab98-65d41240e9e4" system="true"><properties><fieldcaption>LibraryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="LibraryTeaserPath" columnsize="450" columntype="text" guid="5de9f8d9-3e2d-4d83-8a63-6c2bdfb76629" system="true"><properties><fieldcaption>LibraryTeaserPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryUseDirectPathForContent" columntype="boolean" guid="b84913d8-82f6-438e-abc2-f6e6c7e9e7b2" system="true" visible="true"><properties><fieldcaption>{$medialibrary.libraryusedirectpathforcontent.name$}</fieldcaption><fielddescription>{$medialibrary.libraryusedirectpathforcontent.description$}</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
        0);
IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = ('<form version="2"><field column="LibraryID" columntype="integer" guid="00fdb6b0-5f2e-4ef9-8648-1d3c7af8b721" isPK="true" system="true"><properties><fieldcaption>LibraryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="LibraryDisplayName" columnsize="250" columntype="text" guid="9b4aa82c-02df-4712-a5b9-3b9dee377b45" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$medialibrary.librarydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="LibraryName" columnsize="250" columntype="text" guid="e4081abf-652e-47bd-82d0-313752f01873" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$medialibrary.libraryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="LibraryDescription" columntype="longtext" guid="ac965989-ec7a-446f-81bb-ccb5043abf0b" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$medialibrary.librarydescription.description$}</fielddescription></properties><settings><controlname>LocalizableTextArea</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="LibraryTeaserGUID" columntype="guid" guid="1cf86270-1d15-4a07-a3fb-4d97ba972c46" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field column="LibraryFolder" columnsize="250" columntype="text" guid="06f6b6a9-08ca-4735-8732-20cc75d11802" system="true" visible="true"><properties><enabledmacro ismacro="true">{%FormMode == FormModeEnum.Insert|(user)administrator|(hash)0a89b968eb862d72bdc749e4095716028feb4b47d8cca3d195452ef627679385%}</enabledmacro><fieldcaption>{$general.foldername$}</fieldcaption><fielddescription>{$medialibrary.libraryfolder.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryAccess" columntype="integer" guid="720d2865-0be4-43d3-8ed8-412b269b1d00" system="true"><properties><fieldcaption>LibraryAccess</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="LibrarySiteID" columntype="integer" guid="99746a1e-3514-4c13-b878-7bb7b39ddb3d" system="true"><properties><defaultvalue ismacro="true">{%CurrentSite.SiteID|(user)administrator|(hash)f1f36b57555be68f4a774a617ef7f4b296d321c24bd971a578ae7443c86b1480%}</defaultvalue><fieldcaption>LibrarySiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryGUID" columntype="guid" guid="512c11dd-a325-4bf2-b1be-4f7c54397132" system="true"><properties><fieldcaption>LibraryGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="LibraryLastModified" columntype="datetime" guid="54f9c352-5ac2-4e4b-ab98-65d41240e9e4" system="true"><properties><fieldcaption>LibraryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="LibraryTeaserPath" columnsize="450" columntype="text" guid="5de9f8d9-3e2d-4d83-8a63-6c2bdfb76629" system="true"><properties><fieldcaption>LibraryTeaserPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryUseDirectPathForContent" columntype="boolean" guid="b84913d8-82f6-438e-abc2-f6e6c7e9e7b2" system="true" visible="true"><properties><fieldcaption>{$medialibrary.libraryusedirectpathforcontent.name$}</fieldcaption><fielddescription>{$medialibrary.libraryusedirectpathforcontent.description$}</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>')
	WHERE ClassName = 'media.library';
END

END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 10
BEGIN

UPDATE [CMS_UIElement] SET
		[ElementVisibilityCondition] = '{%EditedObject.ClassHasURL || EditedObject.ClassIsCoupledClass|(identity)GlobalAdministrator|(hash)7510bbac5902b136c8ecfa300cba0e08e2c1b3457819de41eb44e239583bc13a%}'
	WHERE [ElementGUID]  = '39931a03-68ce-46fd-9ee3-1e019ff18826'

END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 13
BEGIN

INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
VALUES ('newsletter.emailtemplate.EditTemplateCode',
		'<form version="2"><field column="TemplateID" guid="1fc8d3e4-5b6f-4a8b-9266-42cfdd739d2d" /><field column="TemplateDisplayName" guid="d3505546-d312-4dda-aacc-cf1dfcb7bab3" visible="" /><field column="TemplateName" guid="d138a78c-5095-4778-a5a1-6c0e9d9c226e" visible="" /><field column="TemplateDescription" guid="96044a64-f381-440a-b613-673b845278a5" visible="" /><field column="TemplateInlineCSS" guid="8208c709-9f19-487e-b0a7-eb912316b1dd" visible="" /><field column="TemplateThumbnailGUID" guid="0f72ba1b-8b84-44a8-85a6-27107135071d" /><field column="TemplateIconClass" guid="b885071c-c113-44f1-8a94-d77a2f019cd9" /><field column="TemplateCode" guid="55b5079a-5163-4606-baeb-40e59c8f8aae" visible="true"><settings><AutoSize>False</AutoSize><controlname>MacroEditor</controlname><EnablePositionMember>False</EnablePositionMember><EnableSections>False</EnableSections><EnableViewState>False</EnableViewState><Height>600</Height><Language>7</Language><ResolverName ismacro="true">{%
if (TemplateType == "I") /* using I as email Issue, this is defined in EmailTemplateTypeEnum */
  { "NewsletterResolver" }
else
  { "NewsletterConfirmationResolver" }
|(identity)GlobalAdministrator|(hash)7c7c10639461cfc02ce1352aaf617fc835cae60a9df72d7d6b97d8b2d220fe8b%}</ResolverName><ShowBookmarks>False</ShowBookmarks><ShowLineNumbers>True</ShowLineNumbers><SingleLineMode>False</SingleLineMode><SingleMacroMode>False</SingleMacroMode><SupportPasteImages>False</SupportPasteImages><Width>100%</Width></settings></field><field column="TemplateSiteID" guid="e8548e32-9ba1-4093-b00e-b6ab09d374e2" /><field column="TemplateType" guid="721c9b4a-60e2-4e9e-beef-8ca0e5612a89" visible="" /><field column="TemplateGUID" guid="4bf16188-eaa3-4b2a-bc44-897706226bae" /><field column="TemplateLastModified" guid="951b6ddb-4c52-4d94-a7dd-601f67b3658c" /><field column="TemplateSubject" guid="0eaddd8f-5a59-4873-afb1-80a7156918a6" /></form>',
		1);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_AlternativeForm] SET
	[FormDefinition] = '<form version="2"><field column="TemplateID" guid="1fc8d3e4-5b6f-4a8b-9266-42cfdd739d2d" /><field column="TemplateDisplayName" guid="d3505546-d312-4dda-aacc-cf1dfcb7bab3" visible="" /><field column="TemplateName" guid="d138a78c-5095-4778-a5a1-6c0e9d9c226e" visible="" /><field column="TemplateDescription" guid="96044a64-f381-440a-b613-673b845278a5" visible="" /><field column="TemplateInlineCSS" guid="8208c709-9f19-487e-b0a7-eb912316b1dd" visible="" /><field column="TemplateThumbnailGUID" guid="0f72ba1b-8b84-44a8-85a6-27107135071d" /><field column="TemplateIconClass" guid="b885071c-c113-44f1-8a94-d77a2f019cd9" /><field column="TemplateCode" guid="55b5079a-5163-4606-baeb-40e59c8f8aae" visible="true"><settings><AutoSize>False</AutoSize><controlname>MacroEditor</controlname><EnablePositionMember>False</EnablePositionMember><EnableSections>False</EnableSections><EnableViewState>False</EnableViewState><Height>600</Height><Language>7</Language><ResolverName ismacro="true">{%
if (TemplateType == "I") /* using I as email Issue, this is defined in EmailTemplateTypeEnum */
  { "NewsletterResolver" }
else
  { "NewsletterConfirmationResolver" }
|(identity)GlobalAdministrator|(hash)7c7c10639461cfc02ce1352aaf617fc835cae60a9df72d7d6b97d8b2d220fe8b%}</ResolverName><ShowBookmarks>False</ShowBookmarks><ShowLineNumbers>True</ShowLineNumbers><SingleLineMode>False</SingleLineMode><SingleMacroMode>False</SingleMacroMode><SupportPasteImages>False</SupportPasteImages><Width>100%</Width></settings></field><field column="TemplateSiteID" guid="e8548e32-9ba1-4093-b00e-b6ab09d374e2" /><field column="TemplateType" guid="721c9b4a-60e2-4e9e-beef-8ca0e5612a89" visible="" /><field column="TemplateGUID" guid="4bf16188-eaa3-4b2a-bc44-897706226bae" /><field column="TemplateLastModified" guid="951b6ddb-4c52-4d94-a7dd-601f67b3658c" /><field column="TemplateSubject" guid="0eaddd8f-5a59-4873-afb1-80a7156918a6" /></form>'
WHERE [FormGUID] = '93574C8A-F8A4-4E95-9751-B2D73E2DAFEF';
END

END
GO

DECLARE @REFRESHVERSION INT = 16;

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESHVERSION
BEGIN
    UPDATE CMS_Class
    SET ClassFormDefinition = '<form version="2"><field column="ClassID" columntype="integer" guid="15a00747-3ff0-470a-ae7a-cc99c8a8259f" isPK="true" system="true"><properties><fieldcaption>ClassID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="ClassDisplayName" columnsize="100" columntype="text" guid="b622e4bc-00e4-4ddd-bc24-952579b9812a" system="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><validationerrormessage>{$sysdev.class_edit_gen.displayname$}</validationerrormessage></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ClassName" columnsize="100" columntype="text" guid="11b3b0bd-6161-4ea6-b714-2249e4710ff3" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fieldcssclass>form-group</fieldcssclass><validationerrormessage>{$sysdev.class_edit_gen.name$}</validationerrormessage></properties><settings><AllowEditPrefix>True</AllowEditPrefix><controlname>codenamewithprefix</controlname><ResourcePrefix>class.edit</ResourcePrefix><ShowAdditionalInfo>True</ShowAdditionalInfo></settings></field><field column="ClassUsesVersioning" columntype="boolean" guid="2783d609-e427-4a6a-b58f-11309c662557" system="true"><properties><defaultvalue ismacro="true">false</defaultvalue><fieldcaption>ClassUsesVersioning</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ClassIsDocumentType" columntype="boolean" guid="9644486f-782f-4582-9b94-06d82ec99cd4" system="true"><properties><defaultvalue ismacro="true">false</defaultvalue><fieldcaption>ClassIsDocumentType</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ClassIsCoupledClass" columntype="boolean" guid="60b11243-38b5-40a5-b3e1-d722e717b11b" system="true"><properties><defaultvalue ismacro="true">false</defaultvalue><fieldcaption>ClassIsCoupledClass</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ClassXmlSchema" columntype="longtext" guid="fa1ff4fd-b445-494b-9b34-538b978011c7" system="true"><properties><fieldcaption>ClassXmlSchema</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field column="ClassFormDefinition" columntype="longtext" guid="0e36af3b-04b5-477b-86d9-e4fedbb6acfd" system="true"><properties><fieldcaption>ClassFormDefinition</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field column="ClassNodeNameSource" columnsize="100" columntype="text" guid="ce45ef8a-ba6d-40da-b437-88221a134f0a" system="true"><properties><fieldcaption>ClassNodeNameSource</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassTableName" columnsize="100" columntype="text" guid="b211147b-2e77-4f0d-9546-e18990108532" system="true" visible="true"><properties><fieldcaption>{$general.tablename$}</fieldcaption><validationerrormessage>{$sysdev.class_edit_gen.tablename$}</validationerrormessage></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ClassFormLayout" columntype="longtext" guid="32425d42-712b-48ad-92f2-ca7be3493456" system="true"><properties><fieldcaption>ClassFormLayout</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field allowempty="true" column="ClassShowAsSystemTable" columntype="boolean" guid="ad5fbd45-77ac-4ef6-8df7-823392ea0357" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>{$sysdev.class_edit_general.classissys$}</fieldcaption><validationerrormessage>{$sysdev.class_edit_gen.tablename$}</validationerrormessage></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassUsePublishFromTo" columntype="boolean" guid="f6c7434d-b4f5-4788-878b-af4b7a011066" system="true"><properties><fieldcaption>ClassUsePublishFromTo</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassShowTemplateSelection" columntype="boolean" guid="9d6a6d71-0f1a-49f3-810c-40b830a5cba9" system="true"><properties><fieldcaption>ClassShowTemplateSelection</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSKUMappings" columntype="longtext" guid="db0a08d0-ec66-45e4-bd0a-c3d1f86ffb6a" system="true"><properties><fieldcaption>ClassSKUMappings</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field allowempty="true" column="ClassIsMenuItemType" columntype="boolean" guid="de9eca79-f828-4a86-8df6-72d4b2e36265" system="true"><properties><fieldcaption>ClassIsMenuItemType</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassNodeAliasSource" columnsize="100" columntype="text" guid="9db135ca-2256-4812-96d3-c9bbc1b458d1" system="true"><properties><fieldcaption>ClassNodeAliasSource</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field column="ClassLastModified" columntype="datetime" guid="b0efc357-062e-4db3-a772-4761673faa81" system="true"><properties><fieldcaption>ClassLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="ClassGUID" columntype="guid" guid="155ef725-c6a5-434f-90e6-f9a91f70d6cb" system="true"><properties><fieldcaption>ClassGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="ClassCreateSKU" columntype="boolean" guid="087f9b36-6d29-4336-8fed-567b370935eb" system="true"><properties><fieldcaption>ClassCreateSKU</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassIsProduct" columntype="boolean" guid="90f0e42e-40a8-4d74-a144-482dade5a01a" system="true"><properties><fieldcaption>ClassIsProduct</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ClassIsCustomTable" columntype="boolean" guid="9d94c00d-128b-4ebb-b019-05c591605f79" system="true"><properties><defaultvalue ismacro="true">false</defaultvalue><fieldcaption>ClassIsCustomTable</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassShowColumns" columnsize="1000" columntype="text" guid="95ac260b-5d66-4bf5-a16b-af7313b642e0" system="true"><properties><fieldcaption>ClassShowColumns</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSearchTitleColumn" columnsize="200" columntype="text" guid="0ca33adc-5951-43e0-883b-2900618012f6" system="true"><properties><fieldcaption>ClassSearchTitleColumn</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSearchContentColumn" columnsize="200" columntype="text" guid="c01c8c30-6ad8-4e78-89ff-4444f30a39f2" system="true"><properties><fieldcaption>ClassSearchContentColumn</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSearchImageColumn" columnsize="200" columntype="text" guid="bc7d25ab-93cf-4613-ab30-1ed8fd2fb380" system="true"><properties><fieldcaption>ClassSearchImageColumn</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSearchCreationDateColumn" columnsize="200" columntype="text" guid="9e93f0c7-0ca3-427c-9fcd-0b268d042848" system="true"><properties><fieldcaption>ClassSearchCreationDateColumn</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSearchIndexDataSource" columntype="integer" guid="263618d8-1a6a-47f4-82a4-5fd4ccc5dec5" system="true" /><field allowempty="true" column="ClassSearchSettings" columntype="longtext" guid="b9ce15ef-d968-4341-b39b-569fe442cb54" system="true"><properties><fieldcaption>ClassSearchSettings</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field allowempty="true" column="ClassInheritsFromClassID" columntype="integer" guid="794296ec-5b04-40a2-a9ea-a802629e6839" system="true"><properties><fieldcaption>ClassInheritsFromClassID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassConnectionString" columnsize="100" columntype="text" guid="81f850e0-0dbd-4298-aebf-3a73bdc3b8e4" system="true" visible="true"><properties><fieldcaption>{$connectionstring.title$}</fieldcaption></properties><settings><controlname>connection_string_selector</controlname></settings></field><field allowempty="true" column="ClassSearchEnabled" columntype="boolean" guid="befeb58a-0af5-4775-8f92-b1a35b2a4917" system="true"><properties><fieldcaption>Search enabled</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSKUDefaultDepartmentName" columnsize="200" columntype="text" guid="0d3e0544-4d03-46ca-ac2b-5121a526b5ae" system="true"><properties><fieldcaption>ClassSKUDefaultDepartmentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSKUDefaultDepartmentID" columntype="integer" guid="e3bb4e99-5d76-4936-957b-ec8379e5c6fe" system="true"><properties><fieldcaption>ClassSKUDefaultDepartmentID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassContactMapping" columntype="longtext" guid="fa0aa943-e3ef-42a0-ade2-179a27fc184b" system="true"><properties><fieldcaption>ClassContactMapping</fieldcaption></properties><settings><controlname>textareacontrol</controlname><IsTextArea>True</IsTextArea></settings></field><field allowempty="true" column="ClassContactOverwriteEnabled" columntype="boolean" guid="04b3aee9-b470-45b2-9c5e-90932d09cc19" system="true"><properties><fieldcaption>ClassContactOverwriteEnabled</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassSKUDefaultProductType" columnsize="50" columntype="text" guid="7fdff914-9f78-4512-ab6e-ce640de4cb3b" system="true"><properties><fieldcaption>ClassSKUDefaultProductType</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassIsProductSection" columntype="boolean" guid="2ef6ca34-511f-4894-a139-9e5d74e8f82d" system="true"><properties><fieldcaption>ClassIsProductSection</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassFormLayoutType" columnsize="50" columntype="text" guid="1197ae53-0087-4e94-9b62-b8d4f3c46919" system="true"><properties><fieldcaption>ClassFormLayoutType</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassVersionGUID" columnsize="50" columntype="text" guid="f27eb613-419e-48d4-9046-6828e5d8caab" system="true"><properties><fieldcaption>ClassVersionGUID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassDefaultObjectType" columnsize="100" columntype="text" guid="87954ccc-9d86-4dcc-8e05-90dc7bbdfeb6" system="true"><properties><fieldcaption>ClassDefaultObjectType</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassIsForm" columntype="boolean" guid="1dd5c069-4856-48dd-9938-030db613fe0b" system="true"><properties><fieldcaption>ClassIsForm</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="ClassResourceID" columntype="integer" guid="e8581cf4-a56e-4daf-9dd4-ee3f0d8a15b2" system="true" visible="true"><properties><fieldcaption>Class module</fieldcaption></properties><settings><controlname>moduleselector</controlname><DisplayAllModules>True</DisplayAllModules><DisplayNone>False</DisplayNone></settings></field><field allowempty="true" column="ClassCustomizedColumns" columnsize="400" columntype="text" guid="aac1c1dd-6965-49a8-8e30-05a652fbbbe7" system="true"><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="ClassCodeGenerationSettings" columntype="longtext" guid="5a8428f9-3212-4ad6-be4e-7fd96928f699" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>htmlareacontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide></settings></field><field allowempty="true" column="ClassIconClass" columnsize="200" columntype="text" guid="6db7bd4c-3a91-4f98-8540-a82a070677ff" system="true" /><field allowempty="true" column="ClassURLPattern" columnsize="200" columntype="text" guid="00c00c0d-1627-4bab-864c-1a6b371b8636" system="true"><properties><fieldcaption>URL pattern</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ClassUsesPageBuilder" columntype="boolean" guid="2462fa2a-d236-4a96-8b1e-a8b72d645290" system="true"><properties><defaultvalue>False</defaultvalue></properties></field><field column="ClassIsNavigationItem" columntype="boolean" guid="21ad165c-3970-4270-9fbc-f8ec98c2d3c2" system="true"><properties><defaultvalue>False</defaultvalue></properties></field><field column="ClassHasURL" columntype="boolean" guid="38ca89b0-abfb-482e-a0d7-be1ee50de0f9" system="true"><properties><defaultvalue>False</defaultvalue></properties></field><field column="ClassHasMetadata" columntype="boolean" guid="31ebdec9-9b2c-4d09-bd01-437195b27654" system="true"><properties><defaultvalue>False</defaultvalue></properties></field></form>',
        ClassXmlSchema = '<?xml version="1.0" encoding="utf-8"?>  <xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">    <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true">      <xs:complexType>        <xs:choice minOccurs="0" maxOccurs="unbounded">          <xs:element name="CMS_Class">            <xs:complexType>              <xs:sequence>                <xs:element name="ClassID" msdata:ReadOnly="true" msdata:AutoIncrement="true" type="xs:int" />                <xs:element name="ClassDisplayName">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassName">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassUsesVersioning" type="xs:boolean" />                <xs:element name="ClassIsDocumentType" type="xs:boolean" />                <xs:element name="ClassIsCoupledClass" type="xs:boolean" />                <xs:element name="ClassXmlSchema">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassFormDefinition">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassNodeNameSource">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassTableName" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassFormLayout" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassShowAsSystemTable" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassUsePublishFromTo" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassShowTemplateSelection" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassSKUMappings" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassIsMenuItemType" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassNodeAliasSource" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassLastModified" type="xs:dateTime" />                <xs:element name="ClassGUID" msdata:DataType="System.Guid, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" type="xs:string" />                <xs:element name="ClassCreateSKU" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassIsProduct" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassIsCustomTable" type="xs:boolean" />                <xs:element name="ClassShowColumns" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="1000" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSearchTitleColumn" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSearchContentColumn" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSearchImageColumn" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSearchCreationDateColumn" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSearchSettings" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassInheritsFromClassID" type="xs:int" minOccurs="0" />                <xs:element name="ClassSearchEnabled" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassSKUDefaultDepartmentName" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassSKUDefaultDepartmentID" type="xs:int" minOccurs="0" />                <xs:element name="ClassContactMapping" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassContactOverwriteEnabled" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassSKUDefaultProductType" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="50" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassConnectionString" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassIsProductSection" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassFormLayoutType" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="50" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassVersionGUID" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="50" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassDefaultObjectType" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="100" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassIsForm" type="xs:boolean" minOccurs="0" />                <xs:element name="ClassResourceID" type="xs:int" minOccurs="0" />                <xs:element name="ClassCustomizedColumns" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="400" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassCodeGenerationSettings" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="2147483647" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassIconClass" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassURLPattern" minOccurs="0">                  <xs:simpleType>                    <xs:restriction base="xs:string">                      <xs:maxLength value="200" />                    </xs:restriction>                  </xs:simpleType>                </xs:element>                <xs:element name="ClassUsesPageBuilder" type="xs:boolean" />                <xs:element name="ClassIsNavigationItem" type="xs:boolean" />                <xs:element name="ClassHasURL" type="xs:boolean" />                <xs:element name="ClassHasMetadata" type="xs:boolean" />                <xs:element name="ClassSearchIndexDataSource" type="xs:int" minOccurs="0" />              </xs:sequence>            </xs:complexType>          </xs:element>        </xs:choice>      </xs:complexType>      <xs:unique name="Constraint1" msdata:PrimaryKey="true">        <xs:selector xpath=".//CMS_Class" />        <xs:field xpath="ClassID" />      </xs:unique>    </xs:element>  </xs:schema>'
    WHERE ClassGUID = 'D7E91104-201B-4B11-9550-E93AD9A4D81F'

    ALTER TABLE CMS_Class
        ADD ClassSearchIndexDataSource INT NULL;

    EXEC('
    DECLARE @XMLSettings TABLE
    (
        Settings XML,
        IndexType NVARCHAR(100),
        SiteID INT
    )

    DECLARE @ClassNames TABLE
    (
        IndexType NVARCHAR(100),
        ClassName NVARCHAR(100)
    )

    INSERT INTO @XMLSettings
    SELECT CAST(IndexSettings AS XML) AS SettingsXML, IndexType, IndexSiteID
    FROM CMS_SearchIndex SI
    INNER JOIN CMS_SearchIndexSite SIS ON SIS.IndexID = SI.IndexID
    WHERE IndexType = ''cms.document'' OR IndexType = ''DOCUMENTS_CRAWLER_INDEX'';

    WITH classNames AS (
        SELECT IndexType, Items.classNames.value(''@classnames'', ''nvarchar(max)'') AS [classNames], SiteID
        FROM @XMLSettings AS S CROSS APPLY S.Settings.nodes(''/index/item'') AS Items(classNames)
    ),

    paths AS (
    SELECT S.IndexType, Items.classNames.value(''@path'', ''nvarchar(max)'') AS [path], SiteID
    FROM @XMLSettings AS S CROSS APPLY S.Settings.nodes(''/index/item'') AS Items(classNames)
    WHERE Items.classNames.value(''@classnames'', ''nvarchar(max)'') = '''')

    INSERT INTO @ClassNames
    SELECT DISTINCT IndexType, Split.ClassName.value(''.'', ''VARCHAR(100)'') AS ClassName
    FROM (
        SELECT IndexType, CAST (''<M>'' + REPLACE(C.classNames, '';'', ''</M><M>'') + ''</M>'' AS XML) AS XMLClassNames
        FROM classNames C
        WHERE [classNames] <> ''''
    ) AS A CROSS APPLY XMLClassNames.nodes (''/M'') AS Split(ClassName)
    UNION
    SELECT DISTINCT IndexType, C.ClassName
    FROM paths P
        INNER JOIN CMS_Tree T ON T.NodeAliasPath LIKE P.[path] AND P.SiteID = T.NodeSiteID
        INNER JOIN CMS_Class C ON T.NodeClassID = C.ClassID
    WHERE C.ClassSearchEnabled = 1;

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 1
    WHERE ClassName IN (SELECT ClassName FROM @ClassNames WHERE IndexType = ''cms.document'')

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 0
    WHERE ClassName IN (SELECT ClassName FROM @ClassNames WHERE IndexType = ''DOCUMENTS_CRAWLER_INDEX'')

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 2
    WHERE ClassName IN (
        SELECT ClassName FROM @ClassNames CN
        WHERE CN.IndexType = ''cms.document'' AND EXISTS (SELECT 1 FROM @ClassNames CN2 WHERE CN2.IndexType = ''DOCUMENTS_CRAWLER_INDEX'' AND CN2.ClassName = CN.ClassName))

    -- Update page types that are not part of any index but have search feature enabled

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 2
    WHERE ClassSearchEnabled = 1 AND ClassSearchIndexDataSource IS NULL AND ClassIsCoupledClass = 1 AND ClassUsesPageBuilder = 1 AND ClassIsDocumentType = 1

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 1
    WHERE ClassSearchEnabled = 1 AND ClassSearchIndexDataSource IS NULL AND ClassIsCoupledClass = 1 AND ClassUsesPageBuilder = 0 AND ClassIsDocumentType = 1

    UPDATE CMS_Class
    SET ClassSearchIndexDataSource = 0
    WHERE ClassSearchEnabled = 1 AND ClassSearchIndexDataSource IS NULL AND ClassIsCoupledClass = 0 AND ClassIsDocumentType = 1')

    -- Update Pages crawler index type to Pages type

    UPDATE CMS_SearchIndex
    SET IndexType = 'cms.document'
    WHERE IndexType = 'DOCUMENTS_CRAWLER_INDEX'

    UPDATE CMS_SearchIndex
    SET IndexIsOutdated = 1
    WHERE IndexType = 'cms.document'
END

SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESHVERSION
BEGIN
    UPDATE CMS_Class
    SET ClassSearchSettings = '<search><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="True" azuresortable="False" content="True" id="000919be-e176-433d-aaaf-bce66c1b6680" name="DocumentTags" searchable="True" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="0325c6b3-d194-44cc-a574-6e764ec6af32" name="DocumentGUID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="05c20f85-7283-4fcd-b946-df0f824f49aa" name="DocumentLastPublished" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="0da7a8a8-7304-4f1b-a779-48f5d8c22f3c" name="SKUReorderAt" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="0f2ecf6b-6be7-4805-aa60-15233b392127" name="DocumentSKUDescription" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="177d279c-5648-40de-a531-1cb1e26249a7" name="NodeParentID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="19411933-6ac1-4a4c-b14c-5ae37dc9be32" name="SKUValidFor" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="198ddf0a-1ef4-4c48-a927-6d80c014bc8f" name="DocumentSKUName" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="1b21baf5-0ef6-450c-8fb6-ebc5eff6d903" name="NodeOwner" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="1e9d6b2f-0315-4584-87e6-65c23d6a8d8c" name="DocumentCreatedWhen" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="1fe06506-e12f-4e80-ac38-00802bdd62c9" name="SKUManufacturerID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="2322f467-6d57-4514-9abe-dbbe0a13c7a0" name="SKUWidth" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="241e5e2d-3bdb-46c2-aa22-981d2c248604" name="NodeHasChildren" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="28ddd9c9-233b-4241-9881-fdd2e565b117" name="DocumentCheckedOutVersionHistoryID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="29dc8ea6-c1c1-4ef0-b991-6173e96d1dbd" name="SKUShortDescription" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="2e369591-a992-4d87-98b2-05fba25e0f95" name="SKULastModified" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="2e750254-277c-4200-9496-b5975a823df4" name="DocumentPageBuilderWidgets" searchable="False" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="30847e29-7ab7-47ac-a8ba-1024464bb9b0" name="SKURetailPrice" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="313fac85-bc2c-4043-a0bf-01cb828e697b" name="SKUValidUntil" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="33b41e70-df78-49ed-9bd4-4db368432efe" name="SKUInStoreFrom" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="352adc36-2fd8-41bd-98b3-cc089d283bbc" name="NodeLinkedNodeSiteID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="357e40ff-9a0e-4637-a438-210d86a179a3" name="SKUValidity" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="387e14d4-13c5-46ec-b9c1-96f0536a3398" name="SKUCreated" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="39d13da9-82b3-47e8-990f-990d01b55d66" name="NodeCustomData" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="42fdd1a2-bac2-4c16-bf2e-9b1bc48efb80" name="SKUPublicStatusID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="43f0e056-3268-46b7-a4e9-e2c2a707f1a3" name="SKUID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="4967a750-b268-4b8f-9e1a-b6ef4816aaa0" name="DocumentWorkflowCycleGUID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="4a558b79-f4e8-4a38-8d49-21c049a8477f" name="NodeClassID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="4d72ac6b-a1e5-41d2-8901-59170b4eced6" name="SKUWeight" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="542af074-e88e-499e-85e5-21b818080e33" name="SKUMaxItemsInOrder" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="True" id="544030da-2b4b-480a-b152-fa9f14286496" name="SKUImagePath" searchable="False" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="5880691d-0716-4aaf-8232-14d6ddfe1b83" name="DocumentCreatedByUserID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="58932d8d-e3a5-4bb3-84a2-cc7a55a49650" name="DocumentIsArchived" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="True" id="58e9d5bb-5907-4119-a223-fb8b782df4fc" name="SKUDescription" searchable="False" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="58fae381-7dca-418f-b043-f5d0fbe6a5b5" name="DocumentWorkflowStepID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="True" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="5930175a-83bc-4f12-bcd9-7b372a664e8f" name="NodeID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="59673b90-ea77-46c3-843e-b81166b8c7d7" name="NodeName" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="5c3d2228-d8f7-4ab9-908c-e12649b29645" name="SKUMinItemsInOrder" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="5e16ea49-6e58-4d7c-849e-9256fdea6941" name="DocumentLastVersionNumber" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="5f7091d1-843d-4a1e-8c98-818bd5947886" name="SKUOrder" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="60260dd6-318b-4e5d-b439-d58cd8a6d846" name="SKUTaxClassID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="6045c62b-af75-4ce4-8a50-4ca7046661b6" name="SKUBundleItemsCount" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="64a56ab7-6a19-41c9-b333-30ef1a82d311" name="DocumentIsWaitingForTranslation" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="6a0f859c-e0d4-4574-b769-50df12a7dd13" name="NodeLevel" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="6afc7dd9-f115-4b82-acdd-1f185c5d4132" name="DocumentWorkflowActionStatus" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="6d999348-8f8c-40ea-8900-b5e7787bc2dc" name="NodeAlias" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="6e60b8a7-5111-40f9-9ce5-a8ba7d7d6b01" name="SKUAvailableItems" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="6e68be2a-60d2-4c00-ae4d-20137f6895b0" name="SKUNeedsShipping" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="True" azuresortable="False" content="False" id="6fec5897-024a-42dd-8b87-85c146f24afe" name="DocumentCulture" searchable="True" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="7208e9e6-1a4e-4110-b23b-f123b1a8af58" name="SKUTrackInventory" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="75004db4-329f-4cc0-b192-a412da04334f" name="SKUHeight" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="7677e13f-9d37-4626-bf1a-a8441d2cb112" name="NodeGUID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="77f14e5b-af6c-4a39-898e-25c4a5f27a03" name="DocumentNodeID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="77f38e40-012e-42b0-8c27-510d8fb896da" name="IsSecuredNode" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="True" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="79f1c993-af05-4317-b5f8-69e3b25f0182" name="NodeAliasPath" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="807c9187-231c-4fe3-80a0-2e01897a0ce5" name="DocumentCheckedOutWhen" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="80950d11-c35a-4835-a698-ab0019f907f2" name="SKUSellOnlyAvailable" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="81319199-ac4f-473d-a8d7-50862e9d5515" name="NodeSKUID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="8396ba4f-84de-4498-916c-69d930a83382" name="DocumentPublishedVersionHistoryID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="883db0d9-d71b-4262-a6a1-a1d14b4f0994" name="NodeHasLinks" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="8b3886fd-435f-4918-9ec9-abcf78b337ec" name="SKUMembershipGUID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="8dba8241-4ed6-4503-8904-8b8e77c70d5f" name="NodeACLID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="8e986ef4-8ac6-4984-8c19-5aabd80dbc5e" name="SKUNumber" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="8f104432-0fa6-4483-a34d-fa8067cb774c" name="SKUCollectionID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="92240017-35fc-4212-963e-b4de983c4305" name="DocumentModifiedWhen" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="935b5f7b-04db-4d3d-bf72-245d162521b5" name="SKUBrandID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="96634737-e0b2-418b-b4e0-e891c0177b2f" name="SKUProductType" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="96de9337-749e-4e75-843a-52e2332d318b" name="SKUOptionCategoryID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="9b1cacfb-fbe8-4f1a-bd11-9b407c61d82e" name="DocumentName" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="9b46dc04-d51c-4b45-a51c-2e9a8346b67f" name="DocumentABTestConfiguration" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="9c281449-4762-4d13-a2cb-8eab772af205" name="NodeOrder" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="9d2b93c4-6d29-443e-b84e-b76db4f475d9" name="DocumentPageKeyWords" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="a0066448-ced6-4698-bb09-ff9f71a851b6" name="NodeSiteID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="a05dfe5d-c1cf-426b-8561-9a2498f0c0db" name="DocumentPublishTo" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="a4f55883-0f1a-4474-8fea-5bf1e55764f7" name="DocumentTagGroupID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="a5988e87-43c8-4b85-ae0c-484950795a8b" name="DocumentCanBePublished" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="a88e8c28-11b0-4177-a64e-36b32e381183" name="DocumentPageTemplateConfiguration" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="aef6cc97-91d8-4e03-98db-ad6f74b4e5b8" name="SKUDepth" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="b3d44239-754e-4319-b8d2-9eae2714615d" name="NodeIsACLOwner" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="b3dba69b-14c1-4deb-950f-b8ead728832c" name="DocumentCheckedOutByUserID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="b49c26ee-5e1f-44da-9fd1-5606f4f9e43e" name="SKUEnabled" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="b79745a3-e895-4e90-9c79-ed02fa14ac9c" name="DocumentSearchExcluded" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="bdee2172-7ec1-4fda-8f4b-26e6aee04580" name="DocumentForeignKeyValue" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="c228a1b7-e510-42ec-9e4f-0958e8bc7f0e" name="DocumentPageTitle" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="True" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="c5b1f4b4-7b8a-4756-9b92-9fde8a4464ae" name="DocumentID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="c9618d8e-fbb1-43d4-a495-c896465e04cb" name="NodeOriginalNodeID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="ca7096ae-710e-4b3b-8357-9349a8608a47" name="DocumentSKUShortDescription" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="cffa338a-4d92-43e1-942d-814a6859ca50" name="SKUAvailableInDays" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="d1c91684-0517-439e-a1f3-ab75a202786b" name="SKUParentSKUID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="d1de9bdc-2387-4d8b-83f6-4f0d40ba9dba" name="SKUEproductFilesCount" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="d277395e-ecb4-4802-8b44-2feb37374dbf" name="DocumentShowInMenu" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="True" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="d3d99f72-7006-4172-a626-6a5158517651" name="NodeLinkedNodeID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="d5010740-f570-4f1e-b2fa-8f9cf332d918" name="SKUSiteID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="d6d7d917-d227-4152-b345-a64dd9a75ad0" name="DocumentPublishFrom" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="d96bf80e-6766-4ff4-acb7-6f9fb45bcd81" name="SKUCustomData" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="db3522eb-18dd-4a89-b681-afe59ed4c457" name="SKUDepartmentID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="dc43b6cd-07fe-49af-a472-9db971b56941" name="SKUInternalStatusID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="e7fb1be4-d559-49c8-835d-3cc7e56f52d1" name="SKUBundleInventoryType" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="ee87c740-8c09-4a89-948b-bf5daf01c16e" name="DocumentPageDescription" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="False" azuresortable="False" content="False" id="ef4e23e9-2163-4146-8bee-947117a6c8ae" name="DocumentCustomData" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="f290b950-60ba-4e02-8f7d-e49adfb1017f" name="SKUPrice" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="False" azuresearchable="True" azuresortable="False" content="True" id="f8dac096-16ee-4d5f-b70b-0e03ee9c88ab" name="DocumentContent" searchable="False" tokenized="True" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="f963eeca-c615-4e63-bfc4-bb18bdac20b2" name="DocumentModifiedByUserID" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="fa68ba6f-39fb-46b7-87b2-f052619a5197" name="SKUGUID" searchable="False" tokenized="False" updatetrigger="False" /><item azurecontent="True" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="True" azuresortable="True" content="True" id="fceb1f51-396b-4e9c-996d-c6ce8df0a0d2" name="SKUName" searchable="True" tokenized="False" updatetrigger="True" /><item azurecontent="False" azurefacetable="False" azurefilterable="False" azureretrievable="True" azuresearchable="False" azuresortable="False" content="False" id="fdec187d-fb7b-48fb-8861-c8839032e3ae" name="SKUSupplierID" searchable="True" tokenized="False" updatetrigger="True" /></search>'
    WHERE ClassName = 'cms.document' AND ClassCustomizedColumns NOT LIKE '%ClassSearchSettings%'
END
GO

DECLARE @REFRESHVERSION INT = 16;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESHVERSION
BEGIN
    DECLARE @keyID int;
    DECLARE @keyCategoryID int;
    SET @keyID = (SELECT TOP 1 [KeyID] FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSCMLegitimateInterestActivitiesEnabled')
    SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.OnlineMarketing.Activities.General')

    IF @keyCategoryID IS NOT NULL AND @keyID IS NULL
    BEGIN
        INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
        VALUES ('CMSCMLegitimateInterestActivitiesEnabled', '{$settingskey.cmscmlegitimateinterestactivitiesenabled$}', '{$settingskey.cmscmlegitimateinterestactivitiesenabled.description$}', 'False', 'boolean', @keyCategoryID, NULL, '78becb3e-78f0-4246-85d8-1557e313756e', getDate(), 2, 'False', NULL, NULL, 0, NULL, 0, NULL, '')
    END
END
GO

DECLARE @REFRESHVERSION INT = 16;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESHVERSION
BEGIN
    -- KX-33 - Live site debugs
    DECLARE @elementParentID int;
    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '45bfb5b2-9840-4f7a-988e-0a87458b72a1')
    IF @elementParentID IS NOT NULL BEGIN

    DECLARE @elementResourceID int;
    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('SQL queries - Live site', 'SQLQueriesLiveSite', '{$administration-system.debuglivesite$}', '~/CMSModules/System/Debug/Log.aspx?name=sqlqueries&livesitelogs=true', @elementResourceID, @elementParentID, 0, 1, 5, '', '', 0, getDate(), 'c6b39eee-1f2a-4f9a-ae1a-c4906fa6f0f1', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("sqlqueries")|(identity)GlobalAdministrator|(hash)6d8f9e8cd6d0ff159959f47867b2fa3de307e74711201cd8175c12406ff788ce%}', 0)

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('SQL queries - Admin', 'SQLQueriesAdmin', '{$administration-system.debugadmin$}', '~/CMSModules/System/Debug/Log.aspx?name=sqlqueries', @elementResourceID, @elementParentID, 0, 2, 5, '', '', 0, getDate(), 'bf376057-c0a2-4e7d-8bed-f64ba5509b3b', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("sqlqueries") && (Settings.CMSDebugAllSQLQueries || Settings.CMSDebugEverythingEverywhere)|(identity)GlobalAdministrator|(hash)fbd9acdef15e46d949b5bae27c33e001aca536b6aacfa316039340f819fd17b3%}', 0)

    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '5143d751-b421-452b-9a50-4b37c0fe89dd')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Cache items - Live site', 'CacheItemsLiveSite', '{$administration-system.debuglivesite$}', '~/CMSModules/System/Debug/System_DebugCacheItems.aspx?livesitelogs=true', @elementResourceID, @elementParentID, 0, 1, 5, '', '', 0, getDate(), '078fc1dc-3989-4ab3-8c4d-9dcd6a447063', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '', 0)

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Cache items - Admin', 'CacheItemsAdmin', '{$administration-system.debugadmin$}', '~/CMSModules/System/Debug/System_DebugCacheItems.aspx?livesitelogs=false', @elementResourceID, @elementParentID, 0, 2, 5, '', '', 0, getDate(), 'c8ff79b4-ba85-4d92-8616-13f16aa88a54', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '', 0)

    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '7e2c1ae4-e39d-4903-ae63-cbf693685c02')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Macros (K#) - Live site', 'MacrosLiveSite', '{$administration-system.debuglivesite$}', '~/CMSModules/System/Debug/Log.aspx?name=macros&livesitelogs=true', @elementResourceID, @elementParentID, 0, 1, 5, '', '', 0, getDate(), 'fdc2ec83-ffe5-41be-8d11-edc89a8950f1', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("macros")|(identity)GlobalAdministrator|(hash)f8a56d7ee7223ec5dafef72e0d23ddca16726e132e815dfd792c8319376ca61b%}', 0)

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Macros (K#) - Admin', 'MacrosAdmin', '{$administration-system.debugadmin$}', '~/CMSModules/System/Debug/Log.aspx?name=macros', @elementResourceID, @elementParentID, 0, 2, 5, '', '', 0, getDate(), 'bdf7db28-1007-4d15-9454-271a96166e8a', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("macros") && (Settings.CMSDebugAllMacros || Settings.CMSDebugEverythingEverywhere)|(identity)GlobalAdministrator|(hash)06714ae7db6e8ae30def5cf55501dbcbb865c1523b2cc8c536267a7b6123e917%}', 0)

    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = 'f817574e-91e1-46ad-a2fb-8c7a24b049f4')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Cache access - Live site', 'CacheAccessLiveSite', '{$administration-system.debuglivesite$}', '~/CMSModules/System/Debug/Log.aspx?name=cache&livesitelogs=true', @elementResourceID, @elementParentID, 0, 1, 5, '', '', 0, getDate(), '8e0711ab-0b89-4b10-b848-acecc29fc4f6', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("cache")|(identity)GlobalAdministrator|(hash)65a903d6a974c51bba5213b58f0c3d4f3ea2248366828f158f21d803db13f5c7%}', 0)

    INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
    VALUES ('Cache access - Admin', 'CacheAccessAdmin', '{$administration-system.debugadmin$}', '~/CMSModules/System/Debug/Log.aspx?name=cache', @elementResourceID, @elementParentID, 0, 2, 5, '', '', 0, getDate(), 'ce714c56-6347-454f-ada8-00762ae03826', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '{%Debug.IsDebugEnabled("cache") && (Settings.CMSDebugAllCache || Settings.CMSDebugEverythingEverywhere)|(identity)GlobalAdministrator|(hash)af74b4832dccedf23e7fb795d974dfde10ec6f8a657b0a0bb141148252c51498%}', 0)

    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '3abfac77-95b9-4a3b-a0be-3539abca35d8')
    IF @elementParentID IS NOT NULL BEGIN

    DECLARE @elementPageTemplateID int;
    SET @elementPageTemplateID = (SELECT TOP 1 [PageTemplateID] FROM [CMS_PageTemplate] WHERE [PageTemplateGUID] = '8136b750-a785-438f-a412-32212cd4dde6')
    IF @elementPageTemplateID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    UPDATE [CMS_UIElement] SET
            [ElementTargetURL] = '',
            [ElementPageTemplateID] = @elementPageTemplateID,
            [ElementType] = 'PageTemplate',
            [ElementProperties] = '<Data><AllowSubTabs>true</AllowSubTabs><category_name_header>False</category_name_header><displaybreadcrumbs>False</displaybreadcrumbs><DisplayTitleInTabs>false</DisplayTitleInTabs><includejquery>False</includejquery></Data>'
        WHERE [ElementGUID] = '5143d751-b421-452b-9a50-4b37c0fe89dd'

    UPDATE [CMS_UIElement] SET
            [ElementTargetURL] = '',
            [ElementPageTemplateID] = @elementPageTemplateID,
            [ElementType] = 'PageTemplate',
            [ElementProperties] = '<Data><AllowSubTabs>true</AllowSubTabs><category_name_header>False</category_name_header><displaybreadcrumbs>False</displaybreadcrumbs><DisplayTitleInTabs>false</DisplayTitleInTabs><includejquery>False</includejquery></Data>'
        WHERE [ElementGUID] = 'f817574e-91e1-46ad-a2fb-8c7a24b049f4'

    UPDATE [CMS_UIElement] SET
            [ElementTargetURL] = '',
            [ElementOrder] = 6,
            [ElementPageTemplateID] = @elementPageTemplateID,
            [ElementType] = 'PageTemplate',
            [ElementProperties] = '<Data><AllowSubTabs>true</AllowSubTabs><category_name_header>False</category_name_header><displaybreadcrumbs>False</displaybreadcrumbs><DisplayTitleInTabs>false</DisplayTitleInTabs><includejquery>False</includejquery></Data>'
        WHERE [ElementGUID] = '45bfb5b2-9840-4f7a-988e-0a87458b72a1'

    END
    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '3abfac77-95b9-4a3b-a0be-3539abca35d8')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 7
        WHERE [ElementGUID] = 'ea73614e-6a9a-487b-9675-bda6ae3eaed3'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 8
        WHERE [ElementGUID] = 'e9468499-ecc6-4fb7-b34a-ae8f0621bf85'

    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '3abfac77-95b9-4a3b-a0be-3539abca35d8')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementPageTemplateID = (SELECT TOP 1 [PageTemplateID] FROM [CMS_PageTemplate] WHERE [PageTemplateGUID] = '8136b750-a785-438f-a412-32212cd4dde6')
    IF @elementPageTemplateID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    UPDATE [CMS_UIElement] SET
            [ElementTargetURL] = '',
            [ElementOrder] = 9,
            [ElementPageTemplateID] = @elementPageTemplateID,
            [ElementType] = 'PageTemplate',
            [ElementProperties] = '<Data><AllowSubTabs>true</AllowSubTabs><category_name_header>False</category_name_header><displaybreadcrumbs>False</displaybreadcrumbs><DisplayTitleInTabs>false</DisplayTitleInTabs><includejquery>False</includejquery></Data>'
        WHERE [ElementGUID] = '7e2c1ae4-e39d-4903-ae63-cbf693685c02'

    END
    END
    END


    SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '3abfac77-95b9-4a3b-a0be-3539abca35d8')
    IF @elementParentID IS NOT NULL BEGIN

    SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
    IF @elementResourceID IS NOT NULL BEGIN

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 10
        WHERE [ElementGUID] = '77862fa7-765d-47e8-8343-a29b21c252f9'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 11
        WHERE [ElementGUID] = 'd8237e42-f77f-4ac3-a202-dd79ce0dbdb9'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 12
        WHERE [ElementGUID] = 'fb583819-fb8a-4bc5-97e5-29e6eaa18c35'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 13
        WHERE [ElementGUID] = 'eda92ccf-916e-461e-a573-9b4628d47a17'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 14
        WHERE [ElementGUID] = '242ffe21-1cd0-4667-b1e3-85306b7d003a'

    UPDATE [CMS_UIElement] SET
            [ElementOrder] = 15
        WHERE [ElementGUID] = 'da7f18d9-f9ec-4b13-8f1a-157142059223'

    END
    END
END
GO

DECLARE @REFRESHVERSION INT = 16;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESHVERSION
BEGIN
    -- [LAST] Recalculate IDPath and ChildCount for UI_Element

    DECLARE @elementCursor CURSOR;
    SET @elementCursor = CURSOR FOR SELECT [ElementID], [ElementParentID] FROM [CMS_UIElement] ORDER BY [ElementLevel], [ElementID]

    DECLARE @elementID int;
    DECLARE @elementParentID int;

    OPEN @elementCursor

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID;
    WHILE @@FETCH_STATUS = 0
    BEGIN

    UPDATE [CMS_UIElement] SET

        [ElementChildCount] = (SELECT COUNT(*)
                                FROM [CMS_UIElement] AS [Children]
                                WHERE [Children].[ElementParentID] = @elementID),

        [ElementIDPath] = COALESCE((SELECT TOP 1 [ElementIDPath] FROM [CMS_UIElement] AS [Parent] WHERE [Parent].ElementID = @elementParentID), '')
                            + '/'
                            + REPLICATE('0', 8 - LEN([ElementID]))
                            + CAST([ElementID] AS NVARCHAR(8))

    WHERE [ElementID] = @elementID

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID;
    END

    CLOSE @elementCursor;
    DEALLOCATE @elementCursor;
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 19
BEGIN

INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
VALUES ('cms.SearchIndex',
		'<form version="2"><field column="IndexID" columntype="integer" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isPK="true" system="true"><properties><fieldcaption>IndexID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="General.General"><properties><caption>{$General.General$}</caption><visible>true</visible></properties></category><field column="IndexProvider" columnsize="200" columntype="text" guid="4584a254-c55a-433f-957f-ca3420494258" system="true" /><field allowempty="true" column="IndexSearchServiceName" columnsize="200" columntype="text" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" system="true" /><field allowempty="true" column="IndexAdminKey" columnsize="200" columntype="text" guid="5a148650-ff4b-48a5-8118-d9c748c93284" system="true" /><field allowempty="true" column="IndexQueryKey" columnsize="200" columntype="text" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" system="true" /><field column="IndexDisplayName" columnsize="200" columntype="text" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$general.displayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="IndexName" columnsize="200" columntype="text" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$general.codename.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field column="IndexType" columnsize="200" columntype="text" guid="e196f557-21ab-4b65-8977-d5b14d33d333" system="true" visible="true"><properties><fieldcaption>{$srch.index.type$}</fieldcaption><fielddescription>{$srch.index.type.description$}</fielddescription></properties><settings><controlname>searchindextypeselector</controlname></settings></field><field allowempty="true" column="IndexAnalyzerType" columnsize="200" columntype="text" guid="38f0655c-0b92-4436-915f-8a2545ee548a" hasdependingfields="true" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$srch.index.analyzer$}</fieldcaption><fielddescription>{$srch.index.analyzer.description$}</fielddescription></properties><settings><AssemblyName>CMS.DataEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.DataEngine.SearchAnalyzerTypeEnum</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="IndexSettings" columntype="longtext" guid="6baa44c0-892e-4136-be2e-2e625347981f" system="true"><properties><fieldcaption>IndexSettings</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea></settings></field><field column="IndexGUID" columntype="guid" guid="7b121874-5f4d-44e1-a652-26273df5f674" system="true"><properties><fieldcaption>IndexGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="IndexLastModified" columntype="datetime" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" system="true"><properties><fieldcaption>IndexLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexLastRebuildTime" columntype="datetime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" system="true"><properties><fieldcaption>IndexLastRebuildTime</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexStopWordsFile" columnsize="200" columntype="text" dependsonanotherfield="true" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.stopwords$}</fieldcaption><fielddescription>{$srch.index.stopwords.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "standard" || IndexAnalyzerType.ToString() == "stop" || IndexAnalyzerType.ToString() == "stopwithstemming"|(identity)GlobalAdministrator|(hash)fc113d0920d58431700eb23adac2227dd44428bdf2f3da7800fd38112b2acff5%}</visiblemacro></properties><settings><controlname>stopwordsselector</controlname></settings></field><field allowempty="true" column="IndexCustomAnalyzerAssemblyName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" system="true" visible="true"><properties><fieldcaption>{$srch.index.customanalyzerassembly$}</fieldcaption><fielddescription>{$srch.index.customanalyzerassembly.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "custom"|(identity)GlobalAdministrator|(hash)6af80669e60a5a07a3a044b1c845be4b6257f46c44284b860b5a0cf09c22a01b%}</visiblemacro></properties><settings><BaseClassName>Lucene.Net.Analysis.Analyzer, Lucene.Net ; Lucene.Net.Analysis.Analyzer, Lucene.Net.v3</BaseClassName><ClassNameColumnName>IndexCustomAnalyzerClassName</ClassNameColumnName><controlname>assemblyclassselector</controlname><ShowClasses>True</ShowClasses><ShowEnumerations>False</ShowEnumerations><ShowInterfaces>False</ShowInterfaces><ValidateAssembly>True</ValidateAssembly></settings></field><field allowempty="true" column="IndexCustomAnalyzerClassName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" spellcheck="false" system="true"><properties><fieldcaption>Class name</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="IndexBatchSize" columntype="integer" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.batchsize$}</fieldcaption><fielddescription>{$srch.index.batchsize.description$}</fielddescription></properties><settings><controlname>dropdownlistcontrol</controlname><EditText>True</EditText><Options>100;100
500;500
1000;1000
5000;5000
10000;10000
50000;50000
100000;100000</Options><SortItems>False</SortItems></settings></field><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="mainform" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Insert|(identity)GlobalAdministrator|(hash)6da73e7e4232a90c342ee49067cdad67d10d7865620d90fd7aecb68edba902be%}</visiblemacro></properties><settings><controlname>AssignToSite</controlname></settings></field><field allowempty="true" column="IndexCrawlerUser" columnsize="200" columntype="text" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" system="true" /><field allowempty="true" column="IndexStatus" columnsize="10" columntype="text" guid="4dee1752-a984-4385-b1e0-0187a0289441" system="true"><settings><controlname>checkboxlistcontrol</controlname></settings></field><field allowempty="true" column="IndexIsOutdated" columntype="boolean" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" system="true" /><field allowempty="true" column="IndexLastUpdate" columntype="datetime" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field></form>',
		0),
		('cms.SearchIndex.EditForm',
		'<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" /><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" /><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" /><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" /><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333"><settings><controlname>labelcontrol</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}


</OutputFormat></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc"><properties><controlcssclass>TextBoxFieldSmall</controlcssclass></properties></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" /></form>',
		1),
		('cms.SearchIndex.EditAzureSearchIndexForm',
		'<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" order="2" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" order="3"><settings><RequireIdentifier>False</RequireIdentifier></settings><properties><enabledmacro ismacro="true">{%false%}</enabledmacro><fielddescription>{$srch.azure.name.description$}</fielddescription></properties></field><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333" order="4"><settings><controlname>LabelControl</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}</OutputFormat><ResolveMacros>True</ResolveMacros></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" visible="" order="5" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" order="6" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" order="7" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" order="8" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" order="9" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" order="10" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" order="11" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" order="12" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" order="13" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" order="14"><settings><controlname>DropDownListControl</controlname><DisplayActualValueAsItem>False</DisplayActualValueAsItem><Options>100
500
1000</Options></settings></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" order="15" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true" order="16"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><category dummy="true" name="srch.azure.searchserviceapikeys" order="17"><properties><caption>{$srch.azure.searchservicesettings$}</caption><visible>True</visible></properties></category><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" visible="true" allowempty="" order="18"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.servicename$}</fieldcaption><fielddescription>{$srch.azure.servicename.description$}</fielddescription></properties></field><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" visible="true" allowempty="" order="19"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.adminkey$}</fieldcaption><fielddescription>{$srch.azure.adminkey.description$}</fielddescription></properties></field><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" visible="true" order="20"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.querykey$}</fieldcaption><fielddescription>{$srch.azure.querykey.description$}</fielddescription></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" order="21" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" order="22" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" order="23" /></form>',
		1);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="IndexID" columntype="integer" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isPK="true" system="true"><properties><fieldcaption>IndexID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="General.General"><properties><caption>{$General.General$}</caption><visible>true</visible></properties></category><field column="IndexProvider" columnsize="200" columntype="text" guid="4584a254-c55a-433f-957f-ca3420494258" system="true" /><field allowempty="true" column="IndexSearchServiceName" columnsize="200" columntype="text" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" system="true" /><field allowempty="true" column="IndexAdminKey" columnsize="200" columntype="text" guid="5a148650-ff4b-48a5-8118-d9c748c93284" system="true" /><field allowempty="true" column="IndexQueryKey" columnsize="200" columntype="text" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" system="true" /><field column="IndexDisplayName" columnsize="200" columntype="text" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$general.displayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="IndexName" columnsize="200" columntype="text" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$general.codename.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field column="IndexType" columnsize="200" columntype="text" guid="e196f557-21ab-4b65-8977-d5b14d33d333" system="true" visible="true"><properties><fieldcaption>{$srch.index.type$}</fieldcaption><fielddescription>{$srch.index.type.description$}</fielddescription></properties><settings><controlname>searchindextypeselector</controlname></settings></field><field allowempty="true" column="IndexAnalyzerType" columnsize="200" columntype="text" guid="38f0655c-0b92-4436-915f-8a2545ee548a" hasdependingfields="true" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$srch.index.analyzer$}</fieldcaption><fielddescription>{$srch.index.analyzer.description$}</fielddescription></properties><settings><AssemblyName>CMS.DataEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.DataEngine.SearchAnalyzerTypeEnum</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="IndexSettings" columntype="longtext" guid="6baa44c0-892e-4136-be2e-2e625347981f" system="true"><properties><fieldcaption>IndexSettings</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea></settings></field><field column="IndexGUID" columntype="guid" guid="7b121874-5f4d-44e1-a652-26273df5f674" system="true"><properties><fieldcaption>IndexGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="IndexLastModified" columntype="datetime" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" system="true"><properties><fieldcaption>IndexLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexLastRebuildTime" columntype="datetime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" system="true"><properties><fieldcaption>IndexLastRebuildTime</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexStopWordsFile" columnsize="200" columntype="text" dependsonanotherfield="true" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.stopwords$}</fieldcaption><fielddescription>{$srch.index.stopwords.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "standard" || IndexAnalyzerType.ToString() == "stop" || IndexAnalyzerType.ToString() == "stopwithstemming"|(identity)GlobalAdministrator|(hash)fc113d0920d58431700eb23adac2227dd44428bdf2f3da7800fd38112b2acff5%}</visiblemacro></properties><settings><controlname>stopwordsselector</controlname></settings></field><field allowempty="true" column="IndexCustomAnalyzerAssemblyName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" system="true" visible="true"><properties><fieldcaption>{$srch.index.customanalyzerassembly$}</fieldcaption><fielddescription>{$srch.index.customanalyzerassembly.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "custom"|(identity)GlobalAdministrator|(hash)6af80669e60a5a07a3a044b1c845be4b6257f46c44284b860b5a0cf09c22a01b%}</visiblemacro></properties><settings><BaseClassName>Lucene.Net.Analysis.Analyzer, Lucene.Net ; Lucene.Net.Analysis.Analyzer, Lucene.Net.v3</BaseClassName><ClassNameColumnName>IndexCustomAnalyzerClassName</ClassNameColumnName><controlname>assemblyclassselector</controlname><ShowClasses>True</ShowClasses><ShowEnumerations>False</ShowEnumerations><ShowInterfaces>False</ShowInterfaces><ValidateAssembly>True</ValidateAssembly></settings></field><field allowempty="true" column="IndexCustomAnalyzerClassName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" spellcheck="false" system="true"><properties><fieldcaption>Class name</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="IndexBatchSize" columntype="integer" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.batchsize$}</fieldcaption><fielddescription>{$srch.index.batchsize.description$}</fielddescription></properties><settings><controlname>dropdownlistcontrol</controlname><EditText>True</EditText><Options>100;100
500;500
1000;1000
5000;5000
10000;10000
50000;50000
100000;100000</Options><SortItems>False</SortItems></settings></field><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="mainform" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Insert|(identity)GlobalAdministrator|(hash)6da73e7e4232a90c342ee49067cdad67d10d7865620d90fd7aecb68edba902be%}</visiblemacro></properties><settings><controlname>AssignToSite</controlname></settings></field><field allowempty="true" column="IndexCrawlerUser" columnsize="200" columntype="text" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" system="true" /><field allowempty="true" column="IndexStatus" columnsize="10" columntype="text" guid="4dee1752-a984-4385-b1e0-0187a0289441" system="true"><settings><controlname>checkboxlistcontrol</controlname></settings></field><field allowempty="true" column="IndexIsOutdated" columntype="boolean" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" system="true" /><field allowempty="true" column="IndexLastUpdate" columntype="datetime" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field></form>' 
	WHERE [ClassName] = 'cms.SearchIndex';

UPDATE [CMS_AlternativeForm] SET 
	[FormDefinition] = '<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" /><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" /><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" /><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" /><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333"><settings><controlname>labelcontrol</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}


</OutputFormat></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc"><properties><controlcssclass>TextBoxFieldSmall</controlcssclass></properties></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" /></form>'
	WHERE [FormGUID] = '0B6230F4-8336-4228-9515-2E3379D7F774';

UPDATE [CMS_AlternativeForm] SET 
	[FormDefinition] = '<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" order="2" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" order="3"><settings><RequireIdentifier>False</RequireIdentifier></settings><properties><enabledmacro ismacro="true">{%false%}</enabledmacro><fielddescription>{$srch.azure.name.description$}</fielddescription></properties></field><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333" order="4"><settings><controlname>LabelControl</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}</OutputFormat><ResolveMacros>True</ResolveMacros></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" visible="" order="5" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" order="6" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" order="7" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" order="8" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" order="9" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" order="10" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" order="11" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" order="12" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" order="13" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" order="14"><settings><controlname>DropDownListControl</controlname><DisplayActualValueAsItem>False</DisplayActualValueAsItem><Options>100
500
1000</Options></settings></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" order="15" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true" order="16"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><category dummy="true" name="srch.azure.searchserviceapikeys" order="17"><properties><caption>{$srch.azure.searchservicesettings$}</caption><visible>True</visible></properties></category><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" visible="true" allowempty="" order="18"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.servicename$}</fieldcaption><fielddescription>{$srch.azure.servicename.description$}</fielddescription></properties></field><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" visible="true" allowempty="" order="19"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.adminkey$}</fieldcaption><fielddescription>{$srch.azure.adminkey.description$}</fielddescription></properties></field><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" visible="true" order="20"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.querykey$}</fieldcaption><fielddescription>{$srch.azure.querykey.description$}</fielddescription></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" order="21" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" order="22" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" order="23" /></form>'
	WHERE [FormGUID] = '087E00E6-C58E-43B3-B1A2-BC6BD68CB9FA';
END

END
GO

DECLARE @REFRESH_2_VERSION INT = 31;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_2_VERSION
BEGIN
	-- Add new settings categories
	DECLARE @categoryParentID int;
	SET @categoryParentID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Content')
	IF @categoryParentID IS NOT NULL BEGIN

	DECLARE @categoryResourceID int;
	SET @categoryResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = '98c6ee00-230a-4207-a6d3-03677b83b245')
	IF @categoryResourceID IS NOT NULL BEGIN

	INSERT [CMS_SettingsCategory] ([CategoryDisplayName], [CategoryOrder], [CategoryName], [CategoryParentID], [CategoryIDPath], [CategoryLevel], [CategoryChildCount], [CategoryIconPath], [CategoryIsGroup], [CategoryIsCustom], [CategoryResourceID])
	 VALUES ('{$settingscategory.cmstextanalytics$}', 4, 'CMS.Content.TextAnalytics', @categoryParentID, '', 2, 1, '', 0, 0, @categoryResourceID)

	END

	END

	SET @categoryParentID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Content.TextAnalytics')
	IF @categoryParentID IS NOT NULL BEGIN

	IF @categoryResourceID IS NOT NULL BEGIN

	INSERT [CMS_SettingsCategory] ([CategoryDisplayName], [CategoryOrder], [CategoryName], [CategoryParentID], [CategoryIDPath], [CategoryLevel], [CategoryChildCount], [CategoryIconPath], [CategoryIsGroup], [CategoryIsCustom], [CategoryResourceID])
	 VALUES ('{$general.general$}', 0, 'CMS.TextAnalytics.General', @categoryParentID, '', 3, 0, '', 1, 0, @categoryResourceID)

	END

	END

	SET @categoryParentID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Content')
	IF @categoryParentID IS NOT NULL BEGIN

	SET @categoryResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = '1ab44056-7cc1-4ad2-bc49-3adae489654f')
	IF @categoryResourceID IS NOT NULL BEGIN

	UPDATE [CMS_SettingsCategory] SET
			[CategoryOrder] = 3
		WHERE [CategoryName] = 'CMS.Content.TranslationServices' AND [CategoryParentID] = @categoryParentID

	END

	END


	-- Recalculate IDPath and ChildCount for CMS_SettingsCategory
	DECLARE @categoryCursor CURSOR;
	SET @categoryCursor = CURSOR FOR SELECT [CategoryID], [CategoryParentID] FROM [CMS_SettingsCategory] WHERE [CategoryName] IN ('CMS.Content', 'CMS.Content.TextAnalytics', 'CMS.TextAnalytics.General') ORDER BY [CategoryLevel], [CategoryID]

	DECLARE @categoryID int;

	OPEN @categoryCursor

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	WHILE @@FETCH_STATUS = 0
	BEGIN

	UPDATE [CMS_SettingsCategory] SET

		[CategoryChildCount] = (SELECT COUNT(*)
										FROM [CMS_SettingsCategory] AS [Children]
										WHERE [Children].[CategoryParentID] = @categoryID),

		[CategoryIDPath] = COALESCE((SELECT TOP 1 [CategoryIDPath] FROM [CMS_SettingsCategory] AS [Parent] WHERE [Parent].CategoryID = @categoryParentID), '')
							  + '/'
							  + REPLICATE('0', 8 - LEN(@categoryID))
							  + CAST(@categoryID AS NVARCHAR(8))

	WHERE [CategoryID] = @categoryID

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	END

	CLOSE @categoryCursor;
	DEALLOCATE @categoryCursor;


	-- Add new settings keys
	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.TextAnalytics.General')
	IF @keyCategoryID IS NOT NULL BEGIN

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSAzureTextAnalyticsAPIEndpoint', '{$settingskey.cmsazuretextanalyticsapiendpoint$}', '{$settingskey.cmsazuretextanalyticsapiendpoint.description$}', NULL, 'string', @keyCategoryID, NULL, '4d84b483-161e-4eca-9c4b-1cf59b79c7e9', getDate(), 2, NULL, NULL, NULL, 0, 0, 0, NULL, '')

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSAzureTextAnalyticsAPIKey', '{$settingskey.cmsazuretextanalyticsapikey$}', '{$settingskey.cmsazuretextanalyticsapikey.description$}', NULL, 'string', @keyCategoryID, NULL, '0d4a2fda-a2d4-4dc3-914c-7cfa81cb0978', getDate(), 3, NULL, NULL, NULL, 0, 0, 0, NULL, '')

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSEnableSentimentAnalysis', '{$settingskey.CMSEnableSentimentAnalysis$}', '{$settingskey.cmsenablesentimentanalysis.description$}', 'False', 'boolean', @keyCategoryID, NULL, '7b28d858-a7a5-4c68-9422-2ba8fbc27486', getDate(), 1, 'False', NULL, NULL, 0, 0, 0, NULL, '')

	END
END
GO

DECLARE @REFRESH_2_VERSION INT = 31;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_2_VERSION
BEGIN
	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.URL.ContentTreeRouting')
	IF @keyCategoryID IS NOT NULL
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSUseCultureAliasAsLanguagePrefixInUrl' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID)
			BEGIN
				INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
				VALUES ('CMSUseCultureAliasAsLanguagePrefixInUrl', '{$settingskey.cmsuseculturealiasaslanguageprefixinurl$}', '{$settingskey.cmsuseculturealiasaslanguageprefixinurl.description$}', 'False', 'boolean', @keyCategoryID, NULL, '097676e8-23d6-4d42-8f04-94943483918c', getDate(), 5, 'False', NULL, NULL, 0, 0, 0, NULL, '')

				UPDATE [CMS_SettingsKey] SET [KeyOrder] = 6
				WHERE [KeyName] = 'CMSLowercaseURLs' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID

				UPDATE [CMS_SettingsKey] SET [KeyOrder] = 8
				WHERE [KeyName] = 'CMSStoreFormerUrls' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID

				UPDATE [CMS_SettingsKey] SET [KeyOrder] = 7
				WHERE [KeyName] = 'CMSUseURLsWithTrailingSlash' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID
			END
	END

    IF NOT EXISTS (SELECT 1 FROM sys.types WHERE is_table_type = 1 AND name = 'Type_CMS_PageUrlPathCultureAliasesTable')
		BEGIN
			CREATE TYPE [Type_CMS_PageUrlPathCultureAliasesTable] AS TABLE(
			[CultureCode] [nvarchar](50) NOT NULL,
			[CultureAlias] [nvarchar](100))
		END

	EXEC('ALTER PROCEDURE [Proc_CMS_PageUrlPath_ChangeUrlCultureFormat]
	@SiteID INT,
	@CultureCode NVARCHAR(50) = NULL,
	@ModifyCulturePrefix INT,
	@DefaultCultureCode NVARCHAR(50),
	@HidePrefixForDefaultCulture BIT,
	@UseCultureAliasAsCulturePrefix BIT,
	@PageUrlPathCultureAliases Type_CMS_PageUrlPathCultureAliasesTable READONLY
AS
BEGIN
    BEGIN TRANSACTION
		BEGIN TRY
			UPDATE [CMS_PageUrlPath]
			SET [PageUrlPathUrlPath] =
				-- Do not modify default culture prefix if is set to be hidden.
				CASE WHEN @CultureCode IS NULL AND [PageUrlPathCulture] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
					THEN [PageUrlPathUrlPath]
				ELSE
					-- Add, remove or modify language prefix.
					CASE @ModifyCulturePrefix
						WHEN 1 THEN
							-- Add prefix to URL. Use culture code or culture alias as prefix (based on @UseCultureAliasAsCulturePrefix flag and culture alias value).
							CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) IS NOT NULL THEN
								(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) + ''/'' + [PageUrlPathUrlPath]
							ELSE
								[PageUrlPathCulture] + ''/'' + [PageUrlPathUrlPath]
							END
						WHEN 2 THEN
							-- Change URL language prefix to culture code or culture alias (based on @UseCultureAliasAsCulturePrefix flag and culture alias value).
							CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) IS NOT NULL THEN
								-- Remove original prefix (first segment) and add culture alias as replacement.
								(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) + ''/'' + SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath]))
							ELSE
								-- Remove original prefix (first segment) and add culture code as replacement.
								[PageUrlPathCulture] + ''/'' + SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath]))
							END
						ELSE
							-- Remove prefix (first segment) of the URL.
							SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath]))
					END
				END,
				[PageUrlPathUrlPathHash] =
					CASE WHEN @CultureCode IS NULL AND [PageUrlPathCulture] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
						THEN CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([PageUrlPathUrlPath])), 2)
					ELSE
						CASE @ModifyCulturePrefix
							WHEN 1 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) IS NOT NULL THEN
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER((SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) + ''/'' + [PageUrlPathUrlPath])), 2)
								ELSE
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([PageUrlPathCulture] + ''/'' + [PageUrlPathUrlPath])), 2)
								END
							WHEN 2 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) IS NOT NULL THEN
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER((SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [PageUrlPathCulture]) + ''/'' + SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath])))), 2)
								ELSE
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([PageUrlPathCulture] + ''/'' + SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath])))), 2)
								END
							ELSE
								CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER(SUBSTRING([PageUrlPathUrlPath], CHARINDEX(''/'', [PageUrlPathUrlPath]) + 1, LEN([PageUrlPathUrlPath])))), 2)
						END
					END
			WHERE [PageUrlPathSiteID] = @SiteID AND (@CultureCode IS NULL OR [PageUrlPathCulture] = @CultureCode)
		END TRY
		BEGIN CATCH
			IF XACT_STATE() = 1
			BEGIN
				DECLARE @CollisionPaths TABLE(
					[PathID] INT NOT NULL,
					[NewPath] NVARCHAR(2000) NOT NULL,
					[OldPath] NVARCHAR(2000) NOT NULL,
					[Culture] NVARCHAR(50) NOT NULL)

				DECLARE @AltUrl TABLE(
					[AlternativeUrl] NVARCHAR(450) NOT NULL
				)

				INSERT INTO @AltUrl
					SELECT [AlternativeUrlUrl]
					FROM [CMS_AlternativeUrl] [A1]
					WHERE NOT EXISTS
						(SELECT 1 FROM [CMS_AlternativeUrl] [A2]
							WHERE [A1].[AlternativeUrlUrl] LIKE [A2].[AlternativeUrlUrl] + ''/%''
								AND [A1].[AlternativeUrlSiteID] = [A2].[AlternativeUrlSiteID])
						AND [A1].[AlternativeUrlSiteID] = @SiteID;

				INSERT INTO @CollisionPaths
					SELECT
						[PageUrlPathID] AS [PathID],
						[PageUrlPathUrlPath] + ''-'' + LOWER(CONVERT(VARCHAR(32), HASHBYTES(''MD5'', LOWER([PageUrlPathUrlPath] + [PageUrlPathCulture] + CONVERT(NVARCHAR(36), [NodeGUID]))), 2)) AS [NewPath],
						[PageUrlPathUrlPath] AS [OldPath],
						[PageUrlPathCulture] AS [Culture]
					FROM [CMS_PageUrlPath] [P]
					INNER JOIN [CMS_Tree] ON [NodeID] = [PageUrlPathNodeID]
					INNER JOIN @AltUrl [A] ON [A].[AlternativeUrl] =
						CASE WHEN @CultureCode IS NULL AND [P].[PageUrlPathCulture] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
							THEN [P].[PageUrlPathUrlPath]
						ELSE
							CASE @ModifyCulturePrefix
								WHEN 1 THEN
									CASE @UseCultureAliasAsCulturePrefix WHEN 1 THEN
										(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) + ''/'' + [P].[PageUrlPathUrlPath]
									ELSE
										[P].[PageUrlPathCulture] + ''/'' + [P].[PageUrlPathUrlPath]
									END
								WHEN 2 THEN
									CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) IS NOT NULL THEN
										(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) + ''/'' + SUBSTRING([P].[PageUrlPathUrlPath], CHARINDEX(''/'', [P].[PageUrlPathUrlPath]) + 1, LEN([P].[PageUrlPathUrlPath]))
									ELSE
										[P].[PageUrlPathCulture] + ''/'' + SUBSTRING([P].[PageUrlPathUrlPath], CHARINDEX(''/'', [P].[PageUrlPathUrlPath]) + 1, LEN([P].[PageUrlPathUrlPath]))
									END
								ELSE
									SUBSTRING([P].[PageUrlPathUrlPath], CHARINDEX(''/'', [P].[PageUrlPathUrlPath]) + 1, LEN([P].[PageUrlPathUrlPath]))
								END
						END
					WHERE [PageUrlPathSiteID] = @SiteID AND (@CultureCode IS NULL OR [PageUrlPathCulture] = @CultureCode)

				INSERT INTO @CollisionPaths
					SELECT
						[P].[PageUrlPathID] AS [PathID],
						[C].[NewPath] + SUBSTRING([P].[PageUrlPathUrlPath], LEN([C].[OldPath]) + 1, LEN([P].[PageUrlPathUrlPath])) AS [NewPath],
						[P].[PageUrlPathUrlPath] AS [OldPath],
						[P].[PageUrlPathCulture] AS [Culture]
					FROM @CollisionPaths [C]
					INNER JOIN [CMS_PageUrlPath] [P] ON [P].[PageUrlPathUrlPath] LIKE [C].[OldPath] + ''/%''
					WHERE [P].[PageUrlPathSiteID] = @SiteID  AND (@CultureCode IS NULL OR [P].[PageUrlPathCulture] = @CultureCode) AND [C].[Culture] = [P].[PageUrlPathCulture]

				UPDATE [P]
				SET [P].[PageUrlPathUrlPath] =
						CASE WHEN @CultureCode IS NULL AND [P].[PageUrlPathCulture] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
							THEN COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])
						ELSE
							CASE @ModifyCulturePrefix
							WHEN 1 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) IS NOT NULL THEN
									(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) + ''/'' + COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])
								ELSE
									[P].[PageUrlPathCulture] + ''/'' + COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])
								END
							WHEN 2 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) IS NOT NULL THEN
									(SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) + ''/'' + SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]) , CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])))
								ELSE
									[P].[PageUrlPathCulture] + ''/'' + SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]), CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])))
								END
							ELSE
								SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]), CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])))
							END
						END,
					[P].[PageUrlPathUrlPathHash] =
						CASE WHEN @CultureCode IS NULL AND [P].[PageUrlPathCulture] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
							THEN CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))), 2)
						ELSE
							CASE @ModifyCulturePrefix
							WHEN 1 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) IS NOT NULL THEN
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER((SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) + ''/'' + COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))), 2)
								ELSE
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([P].[PageUrlPathCulture] + ''/'' + COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))), 2)
								END
							WHEN 2 THEN
								CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND (SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] = [P].[PageUrlPathCulture]) IS NOT NULL THEN
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER((SELECT [CultureAlias] FROM @PageUrlPathCultureAliases WHERE [CultureCode] =[P].[PageUrlPathCulture]) + ''/'' + SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]), CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))))), 2)
								ELSE
									CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([P].[PageUrlPathCulture] + ''/'' + SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]), CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))))), 2)
								END
							ELSE
								CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER(SUBSTRING(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]), CHARINDEX(''/'', COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath])) + 1, LEN(COALESCE([C].[NewPath], [P].[PageUrlPathUrlPath]))))), 2)
							END
						END
				FROM [CMS_PageUrlPath] [P]
				LEFT JOIN @CollisionPaths [C] ON [P].[PageUrlPathID] = [C].[PathID]
				WHERE [P].[PageUrlPathSiteID] = @SiteID AND (@CultureCode IS NULL OR [P].[PageUrlPathCulture] = @CultureCode)
			END
			ELSE
			BEGIN
				ROLLBACK TRANSACTION
			END
		END CATCH
	COMMIT TRANSACTION
END')

	EXEC('ALTER PROCEDURE [Proc_CMS_PageUrlPath_GenerateUrlPaths]
	@StartingNodeID INT = NULL,
	@SiteID INT,
	@CultureCodes Type_CMS_StringTable READONLY,
	@LastModified DATETIME,
	@UseCulturePrefix BIT,
	@DefaultCultureCode NVARCHAR(50),
	@HidePrefixForDefaultCulture BIT,
	@UseCultureAliasAsCulturePrefix BIT,
	@PageUrlPathCultureAliases Type_CMS_PageUrlPathCultureAliasesTable READONLY
AS
BEGIN
	DECLARE @PageTypes TABLE(
		[ID] INT NOT NULL,
		[HasUrl] BIT NOT NULL)

	INSERT INTO @PageTypes ([ID], [HasUrl])
		SELECT
			[ClassID],
			[ClassHasURL]
		FROM [CMS_Class]
		WHERE [ClassID] IN (SELECT [ClassID] FROM [CMS_ClassSite] WHERE [SiteID] = @SiteID)

	IF OBJECT_ID(N''tempdb..#PreparedPaths'') IS NOT NULL
	BEGIN
		DROP TABLE #PreparedPaths
	END

	CREATE TABLE #PreparedPaths (
		[ID] INT IDENTITY(1,1),
		[CultureCode] NVARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
		[NodeID] INT NOT NULL,
		[NodeGUID] UNIQUEIDENTIFIER NOT NULL,
		[UrlPath] NVARCHAR(2000) COLLATE DATABASE_DEFAULT NOT NULL,
		[NodeSiteID] INT NOT NULL,
		[IsRootPath] BIT NOT NULL,
		[NodeAliasPath] NVARCHAR(450) COLLATE DATABASE_DEFAULT NOT NULL,
		[NodeLevel] INT NOT NULL,
		[PathHash] NVARCHAR(64) COLLATE DATABASE_DEFAULT NOT NULL
	)

	DECLARE @PrefixPath NVARCHAR(2000) = ''''

	-- Builds parent URL path prefix from node aliases.
	-- In the prefix participate only node aliases of pages having URL
	IF @StartingNodeID IS NOT NULL
	BEGIN
		;WITH ParentPaths AS (
			SELECT
				[NodeID],
				[NodeParentID],
				[NodeSiteID],
				[NodeAliasPath],
				CAST('''' AS NVARCHAR(2000)) AS ParentPath		-- Current path does not participate in prefix
			FROM [CMS_Tree]
			WHERE
				[NodeID] = @StartingNodeID

			UNION ALL

			SELECT
				[T].[NodeID],
				[T].[NodeParentID],
				[T].[NodeSiteID],
				[T].[NodeAliasPath],
				CAST(CASE HasUrl
					 WHEN 1 THEN CASE [P].[ParentPath] WHEN '''' THEN [T].[NodeAlias] ELSE [T].[NodeAlias] + ''/'' + [P].[ParentPath] END
					 ELSE [P].[ParentPath] END AS NVARCHAR(2000))
					 AS ParentPath
			FROM
				[CMS_Tree] AS [T]
					INNER JOIN ParentPaths [P] ON [T].[NodeID] = [P].[NodeParentID]
					INNER JOIN @PageTypes ON [T].[NodeClassID] = [ID]
		)
		SELECT TOP 1 @PrefixPath = [ParentPath] FROM ParentPaths
		WHERE [NodeParentID] IS NULL
	END

	-- Use temporary table with optimized index for building the paths
	IF OBJECT_ID(N''tempdb..#Nodes'') IS NOT NULL
	BEGIN
		DROP TABLE #Nodes
	END

	CREATE TABLE #Nodes (
		[NodeID] INT NOT NULL,
		[NodeGUID] UNIQUEIDENTIFIER NOT NULL,
		[NodeParentID] INT NULL,
		[NodeSiteID] INT NOT NULL,
		[NodeAlias] NVARCHAR(50) COLLATE DATABASE_DEFAULT NOT NULL,
		[NodeAliasPath] NVARCHAR(450) COLLATE DATABASE_DEFAULT NOT NULL,
		[NodeLevel] INT NOT NULL,
		[HasUrl] BIT NOT NULL
	)

	INSERT INTO #Nodes ([NodeID], [NodeGUID], [NodeParentID], [NodeSiteID], [NodeAlias], [NodeAliasPath], [NodeLevel], [HasUrl])
	SELECT [NodeID], [NodeGUID], [NodeParentID], [NodeSiteID], [NodeAlias], [NodeAliasPath], [NodeLevel], [P].[HasUrl]
	FROM [CMS_Tree] INNER JOIN @PageTypes as [P] ON [NodeClassID] = [ID]

	CREATE NONCLUSTERED INDEX [IX_Nodes_NodeParentID] ON #Nodes ([NodeParentID])
	INCLUDE ([NodeID], [NodeGUID], [NodeSiteID], [NodeAlias], [NodeAliasPath], [NodeLevel], [HasUrl])

	-- Build culture paths for all descendants having URL
	;WITH paths AS (
		SELECT
			[NodeID],
			[NodeGUID],
			CAST(CASE HasUrl
			     WHEN 1 THEN CASE @PrefixPath WHEN '''' THEN [NodeAlias] ELSE @PrefixPath + ''/'' + [NodeAlias] END
				 ELSE @PrefixPath END AS NVARCHAR(2000))
				 AS Suffix,
			[NodeParentID],
			[NodeSiteID],
			[HasUrl],
			[HasUrl] AS IsRootPath,
			[NodeAliasPath],
			[NodeLevel]
		FROM
			#Nodes
		WHERE
			(@StartingNodeID IS NULL AND [NodeParentID] IS NULL AND [NodeSiteID] = @SiteID)
			OR (@StartingNodeID IS NOT NULL AND [NodeID] = @StartingNodeID)

		UNION ALL

		SELECT
			[T].[NodeID],
			[T].[NodeGUID],
			CAST(CASE [T].[HasUrl]
				 WHEN 1 THEN CASE [P].[Suffix] WHEN '''' THEN [T].[NodeAlias] ELSE [P].[Suffix] + ''/'' + [T].[NodeAlias] END
				 ELSE [P].[Suffix] END AS NVARCHAR(2000))
				 AS Suffix,
			[T].[NodeParentID],
			[T].[NodeSiteID],
			[T].[HasUrl],
			CAST(CASE WHEN [T].[HasUrl] = 1 AND [P].[Suffix] = '''' THEN 1 ELSE 0 END AS BIT) AS IsRootPath,
			[T].[NodeAliasPath],
			[T].[NodeLevel]
		FROM
			#Nodes AS [T] INNER JOIN paths [P] ON [P].[NodeID] = [T].[NodeParentID]
	)
	INSERT INTO #PreparedPaths ([CultureCode] , [NodeID], [NodeGUID], [UrlPath], [NodeSiteID], [IsRootPath], [NodeAliasPath], [NodeLevel], [PathHash])
		SELECT
			[CultureCode],
			[NodeID],
			[NodeGUID],
			CASE @UseCulturePrefix
			WHEN 1 THEN
				CASE WHEN [CultureCode] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
				THEN [Suffix]
				ELSE
					CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND [CultureAlias] IS NOT NULL
					THEN [CultureAlias] + ''/'' + [Suffix]
					ELSE [CultureCode] + ''/'' + [Suffix] END
				END
			ELSE [Suffix] END AS UrlPath,
			[NodeSiteID],
			[IsRootPath],
			[NodeAliasPath],
			[NodeLevel],
			CASE @UseCulturePrefix
			WHEN 1 THEN
				CASE WHEN [CultureCode] = @DefaultCultureCode AND @HidePrefixForDefaultCulture = 1
				THEN CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([Suffix])), 2)
				ELSE
					CASE WHEN @UseCultureAliasAsCulturePrefix = 1 AND [CultureAlias] IS NOT NULL
					THEN CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([CultureAlias] + ''/'' + [Suffix] )), 2)
					ELSE CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([CultureCode] + ''/'' + [Suffix] )), 2) END
				END
			ELSE CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([Suffix])), 2) END AS [PathHash]
		FROM
		(
			SELECT [NodeID], [NodeGUID], [Suffix], [NodeSiteID], [C].[Value] as [CultureCode], [A].[CultureAlias] as [CultureAlias], [IsRootPath], [NodeAliasPath], [NodeLevel]
			FROM paths CROSS JOIN @CultureCodes AS C
			LEFT JOIN @PageUrlPathCultureAliases AS A ON [A].[CultureCode] = [C].[Value] WHERE [HasUrl] = 1
		) AS S

	-- Index allows quickly to find collision paths inside the table with prepared data
	CREATE NONCLUSTERED INDEX [IX_PreparedPaths_PathHash_CultureCode] ON #PreparedPaths (
		[PathHash] ASC,
		[CultureCode] ASC
	)

    BEGIN TRANSACTION
		BEGIN TRY

			IF ((SELECT COUNT(*)
				FROM #PreparedPaths
				GROUP BY [PathHash], [CultureCode]
				HAVING COUNT(*) > 1) > 0
			)
				THROW 50001, ''Collision found'', 1

			INSERT INTO [CMS_PageUrlPath]([PageUrlPathGUID], [PageUrlPathCulture], [PageUrlPathNodeID], [PageUrlPathUrlPath], [PageUrlPathUrlPathHash], [PageUrlPathSiteID], [PageUrlPathLastModified])
				SELECT
					NEWID(),
					[CultureCode],
					[NodeID],
					[UrlPath],
					[PathHash],
					[NodeSiteID],
					@LastModified
				FROM #PreparedPaths
		END TRY
		BEGIN CATCH
			IF XACT_STATE() = 1
			BEGIN

				DECLARE @CollidingPathGroups TABLE (
					[CultureCode] NVARCHAR(50) NOT NULL,
					[PathHash] NVARCHAR(64) NOT NULL
				)

				-- Table for paths that are in a collision with other paths in the prepared data
				DECLARE @CollidingPaths TABLE (
					[CultureCode] NVARCHAR(50) NOT NULL,
					[NodeGUID] UNIQUEIDENTIFIER NOT NULL,
					[UrlPath] NVARCHAR(2000) NOT NULL,
					[NodeAliasPath] NVARCHAR(450) NOT NULL,
					[NodeLevel] INT NOT NULL
				)

				DECLARE @CollidingUrlPath NVARCHAR(2000)
				DECLARE @CollidingCultureCode NVARCHAR(50)
				DECLARE @CollidingNodeGUID uniqueidentifier
				DECLARE @CollidingNodeAliasPath NVARCHAR(450)

				WHILE (1 = 1)
				BEGIN
					INSERT INTO @CollidingPathGroups([PathHash], [CultureCode])
					SELECT [PathHash], [CultureCode]
						FROM #PreparedPaths
						GROUP BY [PathHash], [CultureCode]
						HAVING COUNT(*) > 1

					INSERT INTO @CollidingPaths([UrlPath], [CultureCode], [NodeGUID], [NodeAliasPath], [NodeLevel])
					SELECT [P].[UrlPath], [P].[CultureCode], [P].[NodeGUID], [P].[NodeAliasPath], [P].[NodeLevel]
						FROM #PreparedPaths [P]
						INNER JOIN @CollidingPathGroups [C] ON [P].[PathHash] = [C].[PathHash] AND [P].[CultureCode] = [C].[CultureCode]

					IF ((SELECT COUNT([UrlPath]) FROM @CollidingPaths) = 0)
						BREAK;

					-- Order colliding items by NodeLevel to ensure that parent paths will be processed first
					SELECT TOP (1) @CollidingUrlPath = [UrlPath], @CollidingCultureCode = [CultureCode], @CollidingNodeGUID = [NodeGUID], @CollidingNodeAliasPath = [NodeAliasPath]
					FROM @CollidingPaths
					ORDER BY [NodeLevel], [NodeAliasPath]

					DECLARE @nonColisionUrlPath NVARCHAR(2000)
					SET @nonColisionUrlPath = @CollidingUrlPath + ''-'' + LOWER(CONVERT(VARCHAR(32), HASHBYTES(''MD5'', LOWER(@CollidingUrlPath + @CollidingCultureCode + CONVERT(NVARCHAR(36), @CollidingNodeGUID))), 2))

					UPDATE #PreparedPaths
					SET [UrlPath] = @nonColisionUrlPath + SUBSTRING(UrlPath, LEN(@CollidingUrlPath) + 1, LEN([UrlPath])),
						[PathHash] = CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER(@nonColisionUrlPath + SUBSTRING(UrlPath, LEN(@CollidingUrlPath) + 1, LEN([UrlPath])))), 2)
					WHERE ([NodeAliasPath] = @CollidingNodeAliasPath OR [NodeAliasPath] LIKE @CollidingNodeAliasPath + ''/%'') AND [CultureCode] = @CollidingCultureCode

					DELETE FROM @CollidingPathGroups
					DELETE FROM @CollidingPaths
				END

				DECLARE @ParentsWithUrl TABLE(
					[CultureCode] NVARCHAR(50),
					[UrlPath] NVARCHAR(2000),
					[UrlPathWithHash] NVARCHAR(2000),
					[NodeAliasPath] NVARCHAR(450) NOT NULL
				)
				INSERT INTO @ParentsWithUrl ([CultureCode], [UrlPath], [UrlPathWithHash], [NodeAliasPath])
				SELECT
					[CultureCode],
					[UrlPath],
					CASE WHEN
						EXISTS (
							SELECT TOP 1 [PageUrlPathID] FROM [CMS_PageUrlPath] WHERE ([PageUrlPathUrlPath] = [UrlPath] OR [PageUrlPathUrlPath] LIKE [UrlPath] + ''/%'') AND [PageUrlPathCulture] = [CultureCode] AND [PageUrlPathSiteID] = @SiteID
							UNION
							SELECT TOP 1 [AlternativeUrlID] FROM [CMS_AlternativeUrl] WHERE ([AlternativeUrlUrl] = [UrlPath] OR [AlternativeUrlUrl] LIKE [UrlPath] + ''/%'') AND [AlternativeUrlSiteID] = @SiteID
						)
						THEN [UrlPath] + ''-'' + LOWER(CONVERT(VARCHAR(32), HASHBYTES(''MD5'', LOWER([UrlPath] + [CultureCode] + CONVERT(NVARCHAR(36), [NodeGUID]))), 2))
						ELSE [UrlPath]
					END,
					[NodeAliasPath]
				FROM #PreparedPaths [PreparedPath]
				WHERE [IsRootPath] = 1

				INSERT INTO [CMS_PageUrlPath]([PageUrlPathGUID], [PageUrlPathCulture], [PageUrlPathNodeID], [PageUrlPathUrlPath], [PageUrlPathUrlPathHash], [PageUrlPathSiteID], [PageUrlPathLastModified])
					SELECT
						NEWID(),
						[CultureCode],
						[NodeID],
						[UrlPathWithHash],
						CONVERT(VARCHAR(64), HASHBYTES(''SHA2_256'', LOWER([UrlPathWithHash])), 2),	-- recompute hash since the UrlPath may be changed because of collisions
						[NodeSiteID],
						@LastModified
					FROM
					(
						SELECT
							[PreparedPath].[CultureCode],
							[PreparedPath].[NodeID],
							[Parent].[UrlPathWithHash] + SUBSTRING([PreparedPath].[UrlPath] , LEN([Parent].[UrlPath])  + 1, LEN([PreparedPath].[UrlPath]) - LEN([Parent].[UrlPath])) AS UrlPathWithHash,
							[PreparedPath].[NodeSiteID]
						FROM #PreparedPaths [PreparedPath]
						INNER JOIN @ParentsWithUrl [Parent]
							ON ([PreparedPath].[UrlPath] = [Parent].[UrlPath] OR [PreparedPath].[UrlPath] LIKE [Parent].[UrlPath] + ''/%'')
							AND [PreparedPath].[CultureCode] = [Parent].[CultureCode]
					) AS S
			END
			ELSE
			BEGIN
				ROLLBACK TRANSACTION
			END
		END CATCH
	COMMIT TRANSACTION
END')
END
GO

-- KX-2033
DECLARE @REFRESH_4_VERSION INT = 52;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_4_VERSION
BEGIN
	-- Rename settings categories
	UPDATE [CMS_SettingsCategory] SET
			[CategoryName] = 'CMS.Content.CognitiveServices',
			[CategoryDisplayName] = '{$settingscategory.cmscognitiveservices$}'
		WHERE [CategoryName] = 'CMS.Content.TextAnalytics'

	UPDATE [CMS_SettingsCategory] SET
			[CategoryName] = 'CMS.CognitiveServices.TextAnalytics',
			[CategoryDisplayName] = '{$settingscategory.cmstextanalytics$}'
		WHERE [CategoryName] = 'CMS.TextAnalytics.General'

	-- Add new settings categories
	DECLARE @categoryParentID int;
	SET @categoryParentID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Content.CognitiveServices')
	IF @categoryParentID IS NOT NULL BEGIN

	DECLARE @categoryResourceID int;
	SET @categoryResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = '98c6ee00-230a-4207-a6d3-03677b83b245')
	IF @categoryResourceID IS NOT NULL BEGIN

	INSERT [CMS_SettingsCategory] ([CategoryDisplayName], [CategoryOrder], [CategoryName], [CategoryParentID], [CategoryIDPath], [CategoryLevel], [CategoryChildCount], [CategoryIconPath], [CategoryIsGroup], [CategoryIsCustom], [CategoryResourceID])
	 VALUES ('{$settingscategory.cmscognitiveservicesimagerecognition$}', 1, 'CMS.CognitiveServices.ImageRecognition', @categoryParentID, '', 3, 0, '', 1, 0, @categoryResourceID)

	END

	END

	-- Recalculate IDPath and ChildCount for CMS_SettingsCategory
	DECLARE @categoryCursor CURSOR;
	SET @categoryCursor = CURSOR FOR SELECT [CategoryID], [CategoryParentID] FROM [CMS_SettingsCategory] WHERE [CategoryName] IN ('CMS.Content.CognitiveServices', 'CMS.CognitiveServices.ImageRecognition') ORDER BY [CategoryLevel], [CategoryID]

	DECLARE @categoryID int;

	OPEN @categoryCursor

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	WHILE @@FETCH_STATUS = 0
	BEGIN

	UPDATE [CMS_SettingsCategory] SET

		[CategoryChildCount] = (SELECT COUNT(*)
										FROM [CMS_SettingsCategory] AS [Children]
										WHERE [Children].[CategoryParentID] = @categoryID),

		[CategoryIDPath] = COALESCE((SELECT TOP 1 [CategoryIDPath] FROM [CMS_SettingsCategory] AS [Parent] WHERE [Parent].CategoryID = @categoryParentID), '')
							  + '/'
							  + REPLICATE('0', 8 - LEN(@categoryID))
							  + CAST(@categoryID AS NVARCHAR(8))

	WHERE [CategoryID] = @categoryID

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	END

	CLOSE @categoryCursor;
	DEALLOCATE @categoryCursor;

	-- Add new settings keys
	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.CognitiveServices.ImageRecognition')
	IF @keyCategoryID IS NOT NULL BEGIN

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSEnableImageRecognition', '{$settingskey.cmsenableimagerecognition$}', '{$settingskey.cmsenableimagerecognition.description$}', 'False', 'boolean', @keyCategoryID, NULL, 'ef4fdc8e-798c-4d48-bc9d-4271e3fec427', getDate(), 1, 'False', NULL, NULL, 0, 0, 0, NULL, '')

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSAzureComputerVisionAPIEndpoint', '{$settingskey.cmsazurecomputervisionendpoint$}', '{$settingskey.cmsazurecomputervisionendpoint.description$}', NULL, 'string', @keyCategoryID, NULL, '4d84b483-161e-4eca-9c4b-1cf59b79c7e9', getDate(), 2, NULL, NULL, NULL, 0, 0, 0, NULL, '')

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSAzureComputerVisionAPIKey', '{$settingskey.cmsazurecomputervisionapikey$}', '{$settingskey.cmsazurecomputervisionapikey.description$}', NULL, 'string', @keyCategoryID, NULL, '0d4a2fda-a2d4-4dc3-914c-7cfa81cb0978', getDate(), 3, NULL, NULL, NULL, 0, 0, 0, NULL, '')

	INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
	 VALUES ('CMSAzureComputerVisionConfidence', '{$settingskey.cmsazurecomputervisionconfidence$}', '{$settingskey.cmsazurecomputervisionconfidence.description$}', '0.25', 'double', @keyCategoryID, NULL, '3ed09beb-7c57-4ea5-87e5-3891544e8d7a', getDate(), 4, '0.25', '0(\.\d+)?|1(\.0)?', NULL, 0, 0, 0, NULL, '')

	END
END
GO

DECLARE @REFRESH_5_VERSION INT = 64;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_5_VERSION
BEGIN
	INSERT INTO [CMS_SearchIndex]
			   ([IndexName]
			   ,[IndexDisplayName]
			   ,[IndexAnalyzerType]
			   ,[IndexSettings]
			   ,[IndexGUID]
			   ,[IndexLastModified]
			   ,[IndexLastRebuildTime]
			   ,[IndexType]
			   ,[IndexStopWordsFile]
			   ,[IndexCustomAnalyzerAssemblyName]
			   ,[IndexCustomAnalyzerClassName]
			   ,[IndexBatchSize]
			   ,[IndexStatus]
			   ,[IndexLastUpdate]
			   ,[IndexIsOutdated]
			   ,[IndexProvider]
			   ,[IndexSearchServiceName]
			   ,[IndexAdminKey]
			   ,[IndexQueryKey]
			   ,[IndexCrawlerUser])
		 VALUES
			   ('MediaFilesUsage'
			   ,'Media files usage'
			   ,'simple'
			   ,NULL
			   ,'5CFC7F00-10F8-4AD4-A50F-93D7AE2003DD'
			   ,GETDATE()
			   ,GETDATE()
			   ,'SYSTEM_SEARCH_INDEX'
			   ,NULL
			   ,NULL
			   ,NULL
			   ,NULL
			   ,NULL
			   ,NULL
			   ,0
			   ,'Lucene'
			   ,NULL
			   ,NULL
			   ,NULL
			   ,NULL)
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 72
BEGIN
	IF NOT EXISTS (SELECT 1 FROM [CMS_Query] WHERE QueryGUID = '7edb717f-26b3-45b7-9d65-ead7ff95e55a')
	BEGIN
		DECLARE @CLASSID INT;
		SET @CLASSID = (SELECT [ClassID] FROM [CMS_Class] WHERE [ClassGUID] = '92305212-5BA4-4DC7-A34E-BC8397B16B9E')
		INSERT INTO [CMS_Query] ([ClassID], [QueryConnectionString], [QueryGUID], [QueryIsCustom], [QueryIsLocked], [QueryName], [QueryRequiresTransaction], [QueryText], [QueryTypeID], [QueryLastModified])
		VALUES (@CLASSID, 'CMSConnectionString', '7edb717f-26b3-45b7-9d65-ead7ff95e55a', 0, 0, 'GetPathPrefixes', 0, 'Proc_CMS_PageUrlPath_GetPathPrefixes', 1, GETDATE())
	END

	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P' AND [object_id] = OBJECT_ID('Proc_CMS_PageUrlPath_GetPathPrefixes'))
	BEGIN
		EXEC('CREATE PROCEDURE Proc_CMS_PageUrlPath_GetPathPrefixes
		AS
		BEGIN
			SELECT CASE WHEN CHARINDEX(''/'', PageUrlPathUrlPath) > 0 
				THEN
					SUBSTRING(PageUrlPathUrlPath, 0, CHARINDEX(''/'', PageUrlPathUrlPath))
				ELSE
					PageUrlPathUrlPath
				END AS Prefix
			FROM CMS_PageUrlPath
			UNION
			SELECT CASE WHEN CHARINDEX(''/'', PageFormerUrlPathUrlPath) > 0 
				THEN
					SUBSTRING(PageFormerUrlPathUrlPath, 0, CHARINDEX(''/'', PageFormerUrlPathUrlPath))
				ELSE
					PageFormerUrlPathUrlPath
				END AS Prefix
			FROM CMS_PageFormerUrlPath
		END')
	END
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 73
BEGIN
	IF EXISTS (SELECT 1 FROM [CMS_Query] WHERE QueryGUID = '7edb717f-26b3-45b7-9d65-ead7ff95e55a')
	BEGIN		
		DELETE FROM [CMS_Query] WHERE QueryGUID = '7edb717f-26b3-45b7-9d65-ead7ff95e55a'
	END

	IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P' AND [object_id] = OBJECT_ID('Proc_CMS_PageUrlPath_GetPathPrefixes'))
	BEGIN
		DROP PROCEDURE Proc_CMS_PageUrlPath_GetPathPrefixes
	END
END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 80
BEGIN

	-- Create table [CMS_EmailOAuthCredentials]
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U' AND [object_id] = OBJECT_ID('CMS_EmailOAuthCredentials'))
	BEGIN
		CREATE TABLE [CMS_EmailOAuthCredentials]
		(
			[EmailOAuthCredentialsID] [int] NOT NULL IDENTITY (1, 1),
			[EmailOAuthCredentialsGuid] [uniqueidentifier] NOT NULL,
			[EmailOAuthCredentialsLastModified] [datetime2] (7) NOT NULL,
			[EmailOAuthCredentialsClientID] [nvarchar] (max) NOT NULL,
			[EmailOAuthCredentialsClientSecret] [nvarchar] (max) NOT NULL,
			[EmailOAuthCredentialsTenantID] [nvarchar] (200) NULL,
			[EmailOAuthCredentialsProviderAssemblyName] [nvarchar] (200) NOT NULL,
			[EmailOAuthCredentialsProviderClass] [nvarchar] (200) NOT NULL,
			[EmailOAuthCredentialsAccessToken] [nvarchar] (max) NULL,
			[EmailOAuthCredentialsTokenExpirationUtc] [datetime2] (7) NULL,
			[EmailOAuthCredentialsRefreshToken] [nvarchar] (max) NULL,
			[EmailOAuthCredentialsDisplayName] [nvarchar] (200) NOT NULL
		) ON [PRIMARY];

		ALTER TABLE [CMS_EmailOAuthCredentials] ADD

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsClientID]
			DEFAULT (N'') FOR [EmailOAuthCredentialsClientID],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsClientSecret]
			DEFAULT (N'') FOR [EmailOAuthCredentialsClientSecret],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsDisplayName]
			DEFAULT (N'') FOR [EmailOAuthCredentialsDisplayName],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsGuid]
			DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [EmailOAuthCredentialsGuid],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsLastModified]
			DEFAULT ('1/1/0001 12:00:00 AM') FOR [EmailOAuthCredentialsLastModified],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsProviderAssemblyName]
			DEFAULT (N'') FOR [EmailOAuthCredentialsProviderAssemblyName],

		CONSTRAINT [DEFAULT_CMS_EmailOAuthCredentials_EmailOAuthCredentialsProviderClass]
			DEFAULT (N'') FOR [EmailOAuthCredentialsProviderClass],

		CONSTRAINT [PK_CMS_EmailOAuthCredentials]
			PRIMARY KEY CLUSTERED ([EmailOAuthCredentialsID])

	END


	-- Update table [CMS_SMTPServer]
	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('CMS_SMTPServer') AND name = 'ServerAuthenticationType')
	BEGIN
		ALTER TABLE [CMS_SMTPServer]
		ADD
			[ServerAuthenticationType] [nvarchar] (50) NULL

		ALTER TABLE [CMS_SMTPServer]
		ADD
			CONSTRAINT [DEFAULT_CMS_SMTPServer_ServerAuthenticationType]
				DEFAULT (N'basic') FOR [ServerAuthenticationType];
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('CMS_SMTPServer') AND name = 'ServerOAuthCredentials')
	BEGIN
		ALTER TABLE [CMS_SMTPServer]
		ADD
			[ServerOAuthCredentials] [uniqueidentifier] NULL
	END


	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('CMS.SMTPServer',
			'<form version="2"><field column="ServerID" columntype="integer" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" isPK="true" system="true"><properties><fieldcaption>ServerID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="general.general"><properties><caption>{$general.general$}</caption><visible>True</visible></properties></category><field column="ServerName" columnsize="200" columntype="text" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.servernamelabel$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerPriority" columntype="integer" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$general.priority$}</fieldcaption></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerPriorityEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field column="ServerEnabled" columntype="boolean" guid="0b471c96-3f09-480e-92fa-d110d7602889" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><category name="general.advanced"><properties><caption>{$general.advanced$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ServerDeliveryMethod" columntype="integer" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$smtpserver.deliverymethod$}</fieldcaption><fielddescription>{$smtpserver.deliverymethoddesc$}</fielddescription><visiblemacro ismacro="true">{%!SystemContext.IsRunningOnAzure|(user)administrator|(hash)79ffbfda7c068c14fe46d3f7bd4af6714a5fc0fe547a40b7abca66cfe0a8a520%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerDeliveryEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field allowempty="true" column="ServerUserName" columnsize="50" columntype="text" dependsonanotherfield="true" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.serverusernamelabel$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(user)administrator|(hash)167ca82a36c88bd86472080d819d74489fb458294ed0411429fe1593f3bb1db9%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerAuthenticationType" columnsize="50" columntype="text" dependsonanotherfield="true" guid="040826ee-b601-4d84-b38d-aad86453fda2" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>basic</defaultvalue><fieldcaption>{$smtpserver.authenticationtype$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(identity)GlobalAdministrator|(hash)df6a2c4ebc3b089135fda42c6c1b45ab32a1acbe2f55a59e59fa2626604de4a2%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>1</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.EmailServerAuthenticationType</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="ServerPassword" columnsize="200" columntype="text" dependsonanotherfield="true" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$general.password$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "basic"|(identity)GlobalAdministrator|(hash)4e9a505cbbdcb52e6aa8d72cbd23fb4361b61a0349055b76429817519b098a78%}</visiblemacro></properties><settings><controlname>encryptedpassword</controlname></settings></field><field allowempty="true" column="ServerOAuthCredentials" columntype="guid" dependsonanotherfield="true" guid="c13da517-d1c4-41a5-8247-978889d1f18c" system="true" visible="true"><properties><fieldcaption>{$smtpserver.oauthcredentials$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "oauth"|(identity)GlobalAdministrator|(hash)662f45908b21f07226527d008208464ef378aa298d87045d31cdd1143689747b%}</visiblemacro></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>False</AllowEmpty><controlname>EmailOAuthCredentialsSelector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><DisplayNameFormat>{%EmailOAuthCredentialsDisplayName%} ({%EmailOAuthCredentialsProviderClass%})</DisplayNameFormat><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><OrderBy>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</OrderBy><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>EmailOAuthCredentialsGUID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>0</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings></field><field column="ServerUseSSL" columntype="boolean" guid="73f0a42d-78ad-4d62-981a-403f29295f56" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$system_email.ssl$}</fieldcaption><visiblemacro ismacro="true">{%false%}</visiblemacro></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="ServerPickupDirectory" columnsize="450" columntype="text" dependsonanotherfield="true" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver.pickupdirectory$}</fieldcaption><fielddescription>{$smtpserver.pickupdirectorydesc$}</fielddescription><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 1|(user)administrator|(hash)c96fbc172b7bf9448dbf0efcb3751a84ce16eead8351ed95024334c628d621bc%}</visiblemacro></properties><settings><AllowManage>False</AllowManage><controlname>filesystemselector</controlname><ShowFolders>True</ShowFolders></settings></field><field column="ServerIsGlobal" columntype="boolean" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$general.isglobal$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ServerGUID" columntype="guid" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="ServerLastModified" columntype="datetime" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field></form>',
			0),
			('CMS.SMTPServer.Insert',
			'<form version="2"><field column="ServerID" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" /><field column="ServerName" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" /><field column="ServerPriority" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" /><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="altform" guid="7451f4aa-1b8a-4d79-909b-581f2409956b" system="true" visible="true" order="4"><properties><defaultvalue>true</defaultvalue></properties><settings><controlname>AssignToSite</controlname></settings></field><field column="ServerEnabled" guid="0b471c96-3f09-480e-92fa-d110d7602889" visible="" order="5"><settings><controlname /></settings></field><category name="general.advanced" order="6" /><field column="ServerDeliveryMethod" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" order="7" /><field column="ServerUserName" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" order="8" /><field column="ServerAuthenticationType" guid="040826ee-b601-4d84-b38d-aad86453fda2" order="9" /><field column="ServerPassword" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" order="10" /><field column="ServerOAuthCredentials" guid="c13da517-d1c4-41a5-8247-978889d1f18c" order="11" /><field column="ServerUseSSL" guid="73f0a42d-78ad-4d62-981a-403f29295f56" order="12" /><field column="ServerPickupDirectory" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" order="13" /><field column="ServerIsGlobal" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" order="14" /><field column="ServerGUID" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" order="15" /><field column="ServerLastModified" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" order="16" /></form>',
			1)

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="ServerID" columntype="integer" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" isPK="true" system="true"><properties><fieldcaption>ServerID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="general.general"><properties><caption>{$general.general$}</caption><visible>True</visible></properties></category><field column="ServerName" columnsize="200" columntype="text" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.servernamelabel$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerPriority" columntype="integer" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$general.priority$}</fieldcaption></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerPriorityEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field column="ServerEnabled" columntype="boolean" guid="0b471c96-3f09-480e-92fa-d110d7602889" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><category name="general.advanced"><properties><caption>{$general.advanced$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ServerDeliveryMethod" columntype="integer" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$smtpserver.deliverymethod$}</fieldcaption><fielddescription>{$smtpserver.deliverymethoddesc$}</fielddescription><visiblemacro ismacro="true">{%!SystemContext.IsRunningOnAzure|(user)administrator|(hash)79ffbfda7c068c14fe46d3f7bd4af6714a5fc0fe547a40b7abca66cfe0a8a520%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerDeliveryEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field allowempty="true" column="ServerUserName" columnsize="50" columntype="text" dependsonanotherfield="true" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.serverusernamelabel$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(user)administrator|(hash)167ca82a36c88bd86472080d819d74489fb458294ed0411429fe1593f3bb1db9%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerAuthenticationType" columnsize="50" columntype="text" dependsonanotherfield="true" guid="040826ee-b601-4d84-b38d-aad86453fda2" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>basic</defaultvalue><fieldcaption>{$smtpserver.authenticationtype$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(identity)GlobalAdministrator|(hash)df6a2c4ebc3b089135fda42c6c1b45ab32a1acbe2f55a59e59fa2626604de4a2%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>1</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.EmailServerAuthenticationType</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="ServerPassword" columnsize="200" columntype="text" dependsonanotherfield="true" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$general.password$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "basic"|(identity)GlobalAdministrator|(hash)4e9a505cbbdcb52e6aa8d72cbd23fb4361b61a0349055b76429817519b098a78%}</visiblemacro></properties><settings><controlname>encryptedpassword</controlname></settings></field><field allowempty="true" column="ServerOAuthCredentials" columntype="guid" dependsonanotherfield="true" guid="c13da517-d1c4-41a5-8247-978889d1f18c" system="true" visible="true"><properties><fieldcaption>{$smtpserver.oauthcredentials$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "oauth"|(identity)GlobalAdministrator|(hash)662f45908b21f07226527d008208464ef378aa298d87045d31cdd1143689747b%}</visiblemacro></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>False</AllowEmpty><controlname>EmailOAuthCredentialsSelector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><DisplayNameFormat>{%EmailOAuthCredentialsDisplayName%} ({%EmailOAuthCredentialsProviderClass%})</DisplayNameFormat><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><OrderBy>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</OrderBy><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>EmailOAuthCredentialsGUID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>0</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings></field><field column="ServerUseSSL" columntype="boolean" guid="73f0a42d-78ad-4d62-981a-403f29295f56" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$system_email.ssl$}</fieldcaption><visiblemacro ismacro="true">{%false%}</visiblemacro></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="ServerPickupDirectory" columnsize="450" columntype="text" dependsonanotherfield="true" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver.pickupdirectory$}</fieldcaption><fielddescription>{$smtpserver.pickupdirectorydesc$}</fielddescription><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 1|(user)administrator|(hash)c96fbc172b7bf9448dbf0efcb3751a84ce16eead8351ed95024334c628d621bc%}</visiblemacro></properties><settings><AllowManage>False</AllowManage><controlname>filesystemselector</controlname><ShowFolders>True</ShowFolders></settings></field><field column="ServerIsGlobal" columntype="boolean" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$general.isglobal$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ServerGUID" columntype="guid" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="ServerLastModified" columntype="datetime" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field></form>'
	WHERE [ClassName] = 'CMS.SMTPServer';

UPDATE [CMS_AlternativeForm] SET 
	[FormDefinition] = '<form version="2"><field column="ServerID" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" /><field column="ServerName" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" /><field column="ServerPriority" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" /><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="altform" guid="7451f4aa-1b8a-4d79-909b-581f2409956b" system="true" visible="true" order="4"><properties><defaultvalue>true</defaultvalue></properties><settings><controlname>AssignToSite</controlname></settings></field><field column="ServerEnabled" guid="0b471c96-3f09-480e-92fa-d110d7602889" visible="" order="5"><settings><controlname /></settings></field><category name="general.advanced" order="6" /><field column="ServerDeliveryMethod" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" order="7" /><field column="ServerUserName" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" order="8" /><field column="ServerAuthenticationType" guid="040826ee-b601-4d84-b38d-aad86453fda2" order="9" /><field column="ServerPassword" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" order="10" /><field column="ServerOAuthCredentials" guid="c13da517-d1c4-41a5-8247-978889d1f18c" order="11" /><field column="ServerUseSSL" guid="73f0a42d-78ad-4d62-981a-403f29295f56" order="12" /><field column="ServerPickupDirectory" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" order="13" /><field column="ServerIsGlobal" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" order="14" /><field column="ServerGUID" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" order="15" /><field column="ServerLastModified" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" order="16" /></form>'
	WHERE [FormGUID] = '82F42997-34EE-4AB2-A628-7F79C72B918A';
END

	-- INSERT new class
	DECLARE @classResourceID int;
	SET @classResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = '7675c4a8-a792-4d4c-b83e-38ed24b64eab')
	IF @classResourceID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_Class] WHERE [ClassName] = 'CMS.EmailOAuthCredentials')
		BEGIN
			INSERT [CMS_Class] ([ClassDisplayName], [ClassName], [ClassUsesVersioning], [ClassIsDocumentType], [ClassIsCoupledClass], [ClassXmlSchema], [ClassFormDefinition], [ClassNodeNameSource], [ClassTableName], [ClassFormLayout], [ClassShowAsSystemTable], [ClassUsePublishFromTo], [ClassShowTemplateSelection], [ClassSKUMappings], [ClassIsMenuItemType], [ClassNodeAliasSource], [ClassLastModified], [ClassGUID], [ClassCreateSKU], [ClassIsProduct], [ClassIsCustomTable], [ClassShowColumns], [ClassSearchTitleColumn], [ClassSearchContentColumn], [ClassSearchImageColumn], [ClassSearchCreationDateColumn], [ClassSearchSettings], [ClassInheritsFromClassID], [ClassSearchEnabled], [ClassSKUDefaultDepartmentName], [ClassSKUDefaultDepartmentID], [ClassContactMapping], [ClassContactOverwriteEnabled], [ClassSKUDefaultProductType], [ClassConnectionString], [ClassIsProductSection], [ClassFormLayoutType], [ClassVersionGUID], [ClassDefaultObjectType], [ClassIsForm], [ClassResourceID], [ClassCustomizedColumns], [ClassCodeGenerationSettings], [ClassIconClass], [ClassURLPattern], [ClassUsesPageBuilder], [ClassIsNavigationItem], [ClassHasURL], [ClassHasMetadata], [ClassSearchIndexDataSource])
			 VALUES ('Email OAuth credentials', 'CMS.EmailOAuthCredentials', 0, 0, 1, '<?xml version="1.0" encoding="utf-8"?>
<xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
  <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="CMS_EmailOAuthCredentials">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="EmailOAuthCredentialsID" msdata:ReadOnly="true" msdata:AutoIncrement="true" type="xs:int" />
              <xs:element name="EmailOAuthCredentialsGuid" msdata:DataType="System.Guid, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" type="xs:string" />
              <xs:element name="EmailOAuthCredentialsLastModified" type="xs:dateTime" />
              <xs:element name="EmailOAuthCredentialsClientID">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="2147483647" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsClientSecret">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="2147483647" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsTenantID" minOccurs="0">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="200" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsProviderAssemblyName">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="200" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsProviderClass">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="200" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsAccessToken" minOccurs="0">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="2147483647" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsTokenExpirationUtc" type="xs:dateTime" minOccurs="0" />
              <xs:element name="EmailOAuthCredentialsRefreshToken" minOccurs="0">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="2147483647" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
              <xs:element name="EmailOAuthCredentialsDisplayName">
                <xs:simpleType>
                  <xs:restriction base="xs:string">
                    <xs:maxLength value="200" />
                  </xs:restriction>
                </xs:simpleType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:choice>
    </xs:complexType>
    <xs:unique name="Constraint1" msdata:PrimaryKey="true">
      <xs:selector xpath=".//CMS_EmailOAuthCredentials" />
      <xs:field xpath="EmailOAuthCredentialsID" />
    </xs:unique>
  </xs:element>
</xs:schema>', '<form version="2"><field column="EmailOAuthCredentialsID" columntype="integer" guid="923c1567-38f3-4f7d-8c65-3e69ca38fd9b" isPK="true" system="true"><properties><fieldcaption>EmailOAuthCredentialsID</fieldcaption></properties></field><field column="EmailOAuthCredentialsDisplayName" columnsize="200" columntype="text" guid="b77e8683-701b-46b9-9bfa-eb73310225d0" system="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="EmailOAuthCredentialsClientID" columntype="longtext" guid="94e19576-9b16-4bd2-be4e-60f72156d1a7" system="true" visible="true"><properties><fieldcaption>{$emailoauthcredentials.clientid$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="EmailOAuthCredentialsClientSecret" columntype="longtext" guid="15a12761-8e7f-41ac-8c77-173c59d52f44" system="true" visible="true"><properties><fieldcaption>{$emailoauthcredentials.clientsecret$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="EmailOAuthCredentialsTenantID" columnsize="200" columntype="text" guid="cccbad60-ca47-4379-a36e-3a9f0f117b18" system="true" visible="true"><properties><fieldcaption>{$emailoauthcredentials.tenantid$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="EmailOAuthCredentialsProviderAssemblyName" columnsize="200" columntype="text" guid="de2f12fc-4010-4fe2-bdce-3c9152fb932b" system="true" visible="true"><properties><fieldcaption>{$emailoauthcredentials.oauthprovider$}</fieldcaption></properties><settings><BaseClassName>CMS.EmailEngine.IEmailOAuthProvider</BaseClassName><CheckAutoCreation>False</CheckAutoCreation><ClassNameColumnName>EmailOAuthCredentialsProviderClass</ClassNameColumnName><controlname>AssemblyClassSelector</controlname><ShowClasses>True</ShowClasses><ShowEnumerations>False</ShowEnumerations><ShowInterfaces>False</ShowInterfaces><ValidateAssembly>True</ValidateAssembly></settings></field><field column="EmailOAuthCredentialsProviderClass" columnsize="200" columntype="text" guid="52f8a31b-8dda-4269-98db-1e71f16db301" system="true" /><field allowempty="true" column="EmailOAuthCredentialsAccessToken" columntype="longtext" guid="76996842-8770-4891-b06b-dde89d7ab895" system="true" /><field allowempty="true" column="EmailOAuthCredentialsTokenExpirationUtc" columnprecision="7" columntype="datetime" guid="8b765f00-ac29-44bd-9597-1b1825836e74" system="true" /><field allowempty="true" column="EmailOAuthCredentialsRefreshToken" columntype="longtext" guid="4189c9d6-ed39-4b9d-8e9f-51977f9e735c" system="true" /><field column="EmailOAuthCredentialsGuid" columntype="guid" guid="098d9fdb-18c0-42c5-8020-e094abc11d77" system="true"><properties><fieldcaption>GUID</fieldcaption></properties></field><field column="EmailOAuthCredentialsLastModified" columnprecision="7" columntype="datetime" guid="ee9e99d9-1dce-489f-bfe1-3a4e676a31a3" system="true"><properties><fieldcaption>Last modified</fieldcaption></properties></field></form>', '', 'CMS_EmailOAuthCredentials', NULL, 0, 0, 0, NULL, 0, NULL, getDate(), 'bed3cafe-d6c7-4b51-abfe-b52d10497269', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, @classResourceID, '', '<Data><DisplayNameColumn>EmailOAuthCredentialsDisplayName</DisplayNameColumn><GUIDColumn>EmailOAuthCredentialsGuid</GUIDColumn><LastModifiedColumn>EmailOAuthCredentialsLastModified</LastModifiedColumn><NameSpace>CMS.EmailEngine</NameSpace><ObjectType>cms.emailoauthcredentials</ObjectType><UseGuidHashtable>True</UseGuidHashtable><UseIdHashtable>True</UseIdHashtable><UseNameHashtable>False</UseNameHashtable></Data>', NULL, NULL, 0, 0, 0, 0, NULL)
		END

	END


	-- INSERT new alt form
	DECLARE @formClassID int;
	SET @formClassID = (SELECT TOP 1 [ClassID] FROM [CMS_Class] WHERE [ClassGUID] = 'bed3cafe-d6c7-4b51-abfe-b52d10497269')
	IF @formClassID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_AlternativeForm] WHERE [FormName] = 'insert' AND [FormClassID] = @formClassID)
		BEGIN
			INSERT [CMS_AlternativeForm] ([FormDisplayName], [FormName], [FormClassID], [FormDefinition], [FormLayout], [FormGUID], [FormLastModified], [FormCoupledClassID], [FormHideNewParentFields], [FormLayoutType], [FormVersionGUID], [FormCustomizedColumns], [FormIsCustom])
			 VALUES ('insert', 'Insert', @formClassID, '<form version="2"><field column="EmailOAuthCredentialsID" guid="923c1567-38f3-4f7d-8c65-3e69ca38fd9b" /><field column="EmailOAuthCredentialsDisplayName" guid="b77e8683-701b-46b9-9bfa-eb73310225d0" /><field column="EmailOAuthCredentialsProviderAssemblyName" guid="de2f12fc-4010-4fe2-bdce-3c9152fb932b" order="2" /><field column="EmailOAuthCredentialsClientID" guid="94e19576-9b16-4bd2-be4e-60f72156d1a7" order="3" /><field column="EmailOAuthCredentialsClientSecret" guid="15a12761-8e7f-41ac-8c77-173c59d52f44" order="4" /><field column="EmailOAuthCredentialsTenantID" guid="cccbad60-ca47-4379-a36e-3a9f0f117b18" visible="" order="5" /><field column="EmailOAuthCredentialsProviderClass" guid="52f8a31b-8dda-4269-98db-1e71f16db301" /><field column="EmailOAuthCredentialsAccessToken" guid="76996842-8770-4891-b06b-dde89d7ab895" /><field column="EmailOAuthCredentialsTokenExpirationUtc" guid="8b765f00-ac29-44bd-9597-1b1825836e74" /><field column="EmailOAuthCredentialsRefreshToken" guid="4189c9d6-ed39-4b9d-8e9f-51977f9e735c" /><field column="EmailOAuthCredentialsGuid" guid="098d9fdb-18c0-42c5-8020-e094abc11d77" /><field column="EmailOAuthCredentialsLastModified" guid="ee9e99d9-1dce-489f-bfe1-3a4e676a31a3" /></form>', NULL, 'a06cdf29-e592-47fb-a685-e23bdc997d0d', getDate(), NULL, 0, NULL, '', '', 0)
		END
	END
	
	
	--- Insert new form user control
	DECLARE @userControlParentID int;
	SET @userControlParentID = (SELECT TOP 1 [UserControlID] FROM [CMS_FormUserControl] WHERE [UserControlGUID] = '958dd5fb-44a7-4f08-8e95-acecf029ac93')
	IF @userControlParentID IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_FormUserControl] WHERE [UserControlCodeName] = 'EmailOAuthCredentialsSelector')
		BEGIN
			INSERT [CMS_FormUserControl] ([UserControlDisplayName], [UserControlCodeName], [UserControlFileName], [UserControlForText], [UserControlForLongText], [UserControlForInteger], [UserControlForDecimal], [UserControlForDateTime], [UserControlForBoolean], [UserControlForFile], [UserControlShowInDocumentTypes], [UserControlShowInSystemTables], [UserControlShowInWebParts], [UserControlShowInReports], [UserControlGUID], [UserControlLastModified], [UserControlForGuid], [UserControlShowInCustomTables], [UserControlParameters], [UserControlForDocAttachments], [UserControlResourceID], [UserControlParentID], [UserControlDescription], [UserControlPriority], [UserControlIsSystem], [UserControlForBinary], [UserControlForDocRelationships], [UserControlAssemblyName], [UserControlClassName])
			 VALUES ('Email OAuth credentials selector', 'EmailOAuthCredentialsSelector', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'd782c2d7-551a-4b3a-86c4-aa53a56e364f', getDate(), 1, 0, '<form version="2"><category name="General_settings"><properties><visible>True</visible></properties></category><field column="ObjectType" guid="f5be74ee-d6c4-47ec-af56-9264eee4c124" visible=""><properties><defaultvalue>cms.emailoauthcredentials</defaultvalue></properties></field><field column="ReturnColumnName" guid="b7e71d57-0f04-4969-9660-b464da775424" resolvedefaultvalue="False"><settings><controlname>TextBoxControl</controlname></settings><properties><defaultvalue>EmailOAuthCredentialsGUID</defaultvalue></properties></field><field column="ObjectSiteName" guid="ab862c63-78e3-448e-9862-9032d7d142fd" /><field column="DisplayNameFormat" guid="20a19c61-2abc-4e71-b17a-97fc65c1aa16" resolvedefaultvalue="False"><settings><controlname>TextBoxControl</controlname></settings><properties><defaultvalue>{%EmailOAuthCredentialsDisplayName%} ({%EmailOAuthCredentialsProviderClass%})</defaultvalue></properties></field><field column="SelectionMode" guid="b4133a1f-4fe5-46c6-8753-a520b2dccb47" resolvedefaultvalue="False"><settings><controlname>DropDownListControl</controlname><DisplayActualValueAsItem>False</DisplayActualValueAsItem></settings><properties><defaultvalue>0</defaultvalue></properties></field><field column="AdditionalColumns" guid="6d481cdf-3fcb-4707-a80e-b07716346737" /><field column="WhereCondition" guid="0a042fda-a566-4816-bb10-a334b9575d89" resolvedefaultvalue="False"><settings><controlname>TextAreaControl</controlname></settings></field><field column="OrderBy" guid="097c1756-491a-4e31-9776-ffbe0eaff84a" resolvedefaultvalue="False"><settings><controlname>TextBoxControl</controlname></settings><properties><defaultvalue>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</defaultvalue></properties></field><field column="EnabledColumnName" guid="5238b63a-8aea-4a68-820d-4c5b88304743" /><field column="ValuesSeparator" guid="0cbdb22a-5b22-41f3-9251-b6eb49d7ad74" /><field column="AllowEditTextBox" guid="3fa07128-a38a-4f5f-b638-6f820cc7de58" /><field column="UseAutocomplete" guid="e7bbc193-89b1-4690-9798-d069ea96ad1f" /><field column="Transformation" guid="5b14798f-a731-4477-8b90-287a9e32874d" resolvedefaultvalue="False"><settings><controlname>TextAreaControl</controlname></settings></field><field column="NoDataTransformation" guid="a46a2b55-6021-4aa1-b700-4b30e2ea949f" /><field column="EncodeOutput" guid="5ef3dfaf-b40d-4ed3-a61d-52aa44b3ed6e" /><field column="AllowEmpty" guid="f54fba5e-dc55-4f14-ab31-40cf850d4b5e" resolvedefaultvalue="False"><settings><controlname>CheckBoxControl</controlname></settings><properties><defaultvalue>true</defaultvalue></properties></field><field column="AllowDefault" guid="549f2223-53d3-4685-8f88-b90045ec02c1" /><field column="AllowAll" guid="1137b73b-30bf-45e3-8349-80ab7749f1b4" resolvedefaultvalue="False"><settings><controlname>CheckBoxControl</controlname></settings></field><field column="SpecialFields" guid="44ad2654-5ec5-4512-b9dd-cafa69fcd240" /><field column="IconPath" guid="9aa88a79-3f75-4920-b2ec-f4dbb1ca0528" /><field column="ResourcePrefix" guid="ca7a81c9-aa4d-42fd-b145-5255ffcb56f6" /><field column="LocalizeItems" guid="73305053-2ff0-4293-b395-dfcc0a8ed85d" /><field column="MaxDisplayedTotalItems" guid="6cc83a6f-7a70-43f5-acb0-ab70c721cbc3" /><field column="MaxDisplayedItems" guid="2165a3ad-d5aa-4446-a50d-68f6e6f8638e" /><field column="ItemsPerPage" guid="b5cd93ea-9595-43d1-9b15-12499aa4a19e" /><field column="AddGlobalObjectNamePrefix" guid="49c24e35-ad41-4a9f-9631-b90fd289c91c" /><field column="AddGlobalObjectSuffix" guid="3ff19253-229a-4471-a7b1-2d53c6e85907" /><field column="GlobalObjectSuffix" guid="1c00ae88-d7b4-4252-91bf-de70ffdbc562" /><field column="EmptyReplacement" guid="84ed4dbc-ee3e-4d4a-839b-e389bbe53a07" /><field column="RemoveMultipleCommas" guid="dda88ed1-4be5-4e00-9dba-f1056d180cc5" /><field column="DisabledItems" guid="790d7367-8b1e-48d9-b3be-5186e48a0d04" /><field column="DisabledAddButtonExplanationText" guid="47ff4767-a262-4f2f-a630-2c678afb47f7" /><field column="AdditionalUrlParameters" guid="e5fbb417-eab7-4714-b434-628fbbd30f50" /><field column="RemoveConfirmation" guid="35ed31a8-b269-4906-9cbe-b8caf03b5df4" /><field column="ButtonImage" guid="7a31f0ed-4fb6-4fc4-8d84-c0dc6b81c7d7" /><field column="NewItemPageUrl" guid="e8fb2679-8c52-4500-a96c-55630aea483b" /><field column="EditItemPageUrl" guid="8ae4a2c1-d55a-4e15-bafe-a9f6a85e6ecc" /><field column="SelectItemPageUrl" guid="76227390-bf5a-447b-8b86-13dd03120a06" /><field column="NewItemElementName" guid="ee7c4924-9b25-4790-a65c-025ca02c2ef7" /><field column="EditItemElementName" guid="48869e86-7bb7-49b2-a424-37c58a7baec8" /><field column="ElementResourceName" guid="b16b9854-eeec-48ab-b24f-2f785f8b9ea1" /><field column="ReturnColumnType" guid="adb269e5-854e-484c-8849-198806212a68" /><field column="FilterControl" guid="d6056b3e-b36a-445e-af8f-0bc59ad523dd" /><field column="UseDefaultNameFilter" guid="9fd52fe8-0444-4233-b49b-18479b593522" /><field column="DialogWindowName" guid="de81d67f-e3f5-4f25-a50a-dcf283505c77" /><field column="DialogWindowWidth" guid="65fb2309-4b3d-4169-849d-9e6b401acfdf" /><field column="DialogWindowHeight" guid="56f1ec0c-a46d-46b0-a971-a76fb8f9b789" /><field column="EditWindowName" guid="c8001d52-b7ef-4a22-ae4d-c2327657e73a" /><field column="EditDialogWindowWidth" guid="af8e7e1e-f5ba-4c43-81e4-ce641e366e7e" /><field column="EditDialogWindowHeight" guid="2739869f-7aa1-48ed-93ba-98b553668968" /><field column="EditDialogWindowOpenInFullscreen" guid="7a068322-6103-4cef-ad66-0da73a958c5d" /><field column="GridName" guid="5d3e5a3a-03f0-4463-94a6-b14129d4cfc4" /><field column="DialogGridName" guid="80dd8116-6787-4c9b-ad8f-fe89db3c0cb7" /><field column="CallbackMethod" guid="0b5394c3-d8d3-40f7-95c9-fd82c005ef3a" /><field column="OnBeforeClientChanged" guid="ef566c62-44b9-43bb-ac01-5f49b563ae23" /><field column="OnAfterClientChanged" guid="76896de4-8c0c-4bda-947c-d9dbb9434c19" /></form>', 0, NULL, @userControlParentID, '', NULL, 0, 0, 0, NULL, '')
		END

	END

	
	
	-- insert new UI elements
	
	DECLARE @elementParentID int;
	SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '506f9619-daa6-40a7-a104-2e414d22e19f')
	IF @elementParentID IS NOT NULL BEGIN

	DECLARE @elementPageTemplateID int;
	SET @elementPageTemplateID = (SELECT TOP 1 [PageTemplateID] FROM [CMS_PageTemplate] WHERE [PageTemplateGUID] = '226b13a3-97c2-4895-99e4-39ea6247a399')
	IF @elementPageTemplateID IS NOT NULL BEGIN

	DECLARE @elementResourceID int;
	SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
	IF @elementResourceID IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_UIElement] WHERE [ElementName] = 'Configuration.EmailOAuthCredentials' AND [ElementParentID] = @elementParentID)
		BEGIN
			INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
			 VALUES ('{$emailoauthcredentials.app.name$}', 'Configuration.EmailOAuthCredentials', '{$emailoauthcredentials.app.name$}', '', @elementResourceID, @elementParentID, 0, 39, 3, '', '', 0, getDate(), '7169a512-4024-4d70-8888-b78817148cc3', 0, '{$emailoauthcredentials.app.description$}', '13.0', @elementPageTemplateID, 'PageTemplate', '<Data><category_name_Header>False</category_name_Header><DescriptionLink>email_servers_oauth</DescriptionLink><DisplayBreadcrumbs>False</DisplayBreadcrumbs><EditInDialog>False</EditInDialog><ObjectType>cms.emailoauthcredentials</ObjectType><OpenInDialog>False</OpenInDialog></Data>', 0, '', 'icon-key', 1, 1, '', '', 1)
		END

	END

	END

	END


	DECLARE @elementParentID2 int;
	SET @elementParentID2 = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '7169a512-4024-4d70-8888-b78817148cc3')
	IF @elementParentID2 IS NOT NULL BEGIN

	DECLARE @elementPageTemplateID2 int;
	SET @elementPageTemplateID2 = (SELECT TOP 1 [PageTemplateID] FROM [CMS_PageTemplate] WHERE [PageTemplateGUID] = '8136b750-a785-438f-a412-32212cd4dde6')
	IF @elementPageTemplateID2 IS NOT NULL BEGIN

	DECLARE @elementResourceID2 int;
	SET @elementResourceID2 = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
	IF @elementResourceID2 IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_UIElement] WHERE [ElementName] = 'EditOAuthCredentials' AND [ElementParentID] = @elementParentID2)
		BEGIN
			INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
			 VALUES ('Edit OAuth credentials', 'EditOAuthCredentials', '', '', @elementResourceID2, @elementParentID2, 0, 2, 4, '', '', 0, getDate(), '89156cbf-d28d-41a8-886c-7d9fb1e57f25', 0, '', '13.0', @elementPageTemplateID2, 'PageTemplate', '<Data><AllowSubTabs>True</AllowSubTabs><category_name_Breadcrumbs>False</category_name_Breadcrumbs><category_name_Header>False</category_name_Header><DisplayBreadcrumbs>True</DisplayBreadcrumbs><DisplayTitleInTabs>False</DisplayTitleInTabs><RememberSelectedTab>False</RememberSelectedTab></Data>', 0, '', '', 0, 1, '', '', 0)
		END
		
	

	END

	END

	END


	DECLARE @elementParentID3 int;
	SET @elementParentID3 = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '7169a512-4024-4d70-8888-b78817148cc3')
	IF @elementParentID3 IS NOT NULL BEGIN

	DECLARE @elementPageTemplateID3 int;
	SET @elementPageTemplateID3 = (SELECT TOP 1 [PageTemplateID] FROM [CMS_PageTemplate] WHERE [PageTemplateGUID] = 'bc86a286-996d-4445-ac8a-68ed45d115b3')
	IF @elementPageTemplateID3 IS NOT NULL BEGIN

	DECLARE @elementResourceID3 int;
	SET @elementResourceID3 = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
	IF @elementResourceID3 IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_UIElement] WHERE [ElementName] = 'NewEmailOAuthCredentials' AND [ElementParentID] = @elementParentID3)
		BEGIN
			INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
			 VALUES ('{$emailoauthcredentials_edit.newitemcaption$}', 'NewEmailOAuthCredentials', '{$emailoauthcredentials_edit.newitemcaption$}', '', @elementResourceID3, @elementParentID3, 0, 1, 4, '', '', 0, getDate(), 'b66c1fbf-e4e2-4da6-97c7-015ef9a34e02', 0, '', '13.0', @elementPageTemplateID3, 'PageTemplate', '<Data><AlternativeFormName>insert</AlternativeFormName><DefaultFieldLayout>twocolumns</DefaultFieldLayout><DefaultFormLayout>Divs</DefaultFormLayout><DisplayBreadcrumbs>True</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '', 0)
		END
	

	END

	END

	END


	DECLARE @elementParentID4 int;
	SET @elementParentID4 = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '89156cbf-d28d-41a8-886c-7d9fb1e57f25')
	IF @elementParentID4 IS NOT NULL BEGIN

	DECLARE @elementResourceID4 int;
	SET @elementResourceID4 = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
	IF @elementResourceID4 IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_UIElement] WHERE [ElementName] = 'EditEmailOAuthCredentials.General' AND [ElementParentID] = @elementParentID4)
		BEGIN
			INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
			 VALUES ('{$general.general$}', 'EditEmailOAuthCredentials.General', '{$general.general$}', '~/CMSModules/EmailEngine/Pages/EmailOAuthCredentials_Edit.aspx', @elementResourceID4, @elementParentID4, 0, 1, 5, '', '', 0, getDate(), 'ff4b574b-5f92-4449-97f7-b7d610b65649', 0, '', '13.0', NULL, 'Url', '<Data><category_name_Breadcrumbs>False</category_name_Breadcrumbs><category_name_Header>False</category_name_Header><DefaultFieldLayout>twocolumns</DefaultFieldLayout><DefaultFormLayout>Divs</DefaultFormLayout><DisplayBreadcrumbs>True</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '', 0)
		END
	

	END

	END


	-- insert new settings and update existing

	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Email.SMTP')
	IF @keyCategoryID IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSSMTPServerAuthenticationType')
		BEGIN
			INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
			 VALUES ('CMSSMTPServerAuthenticationType', '{$settingskey.cmssmtpserverauthenticationtype$}', '{$settingskey.cmssmtpserverauthenticationtype.description$}', 'basic', 'string', @keyCategoryID, NULL, 'e0f9d42c-086f-41a6-b90e-912e0afae85e', getDate(), 3, 'basic', NULL, 'EnumSelector', 0, NULL, 0, '<settings><AssemblyName>CMS.EmailEngine</AssemblyName><DisplayType>1</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.EmailServerAuthenticationType</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings>', '')
		END
	
		IF NOT EXISTS (SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSSMTPServerOAuthCredentials')
		BEGIN
			INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
			 VALUES ('CMSSMTPServerOAuthCredentials', '{$settingskey.cmssmtpserveroauthcredentials$}', '{$settingskey.cmssmtpserveroauthcredentials.description$}', NULL, 'string', @keyCategoryID, NULL, '86d46ddd-6d0d-40e6-adb6-ea46bc66c459', getDate(), 6, NULL, NULL, 'EmailOAuthCredentialsSelector', 0, NULL, 0, '<settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>True</AllowEmpty><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><OrderBy>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</OrderBy><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>EmailOAuthCredentialsGUID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>0</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings>', '')
		END

	END


	DECLARE @keyCategoryID2 int;
	SET @keyCategoryID2 = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Newsletters.POP3Settings')
	IF @keyCategoryID2 IS NOT NULL BEGIN

		IF NOT EXISTS (SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSPOP3AuthenticationType')
		BEGIN
			INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
			 VALUES ('CMSPOP3AuthenticationType', '{$settingskey.cmspop3authenticationtype$}', '{$settingskey.cmspop3authenticationtype.description$}', 'basic', 'string', @keyCategoryID2, NULL, 'ae20eeb0-eb86-4fcc-9529-fc34f14fb430', getDate(), 4, 'basic', NULL, 'EnumSelector', 0, NULL, 0, '<settings><AssemblyName>CMS.EmailEngine</AssemblyName><DisplayType>1</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.EmailServerAuthenticationType</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings>', '')
		END
		
		IF NOT EXISTS (SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSPOP3OAuthCredentials')
		BEGIN
			INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
			 VALUES ('CMSPOP3OAuthCredentials', '{$settingskey.cmspop3oauthcredentials$}', '{$settingskey.cmspop3oauthcredentials.description$}', NULL, 'string', @keyCategoryID2, NULL, 'ad1fb169-8b23-4489-a390-242e120c8242', getDate(), 8, NULL, NULL, 'EmailOAuthCredentialsSelector', 0, NULL, 0, '<settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>True</AllowEmpty><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><OrderBy>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</OrderBy><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>EmailOAuthCredentialsGUID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>0</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings>', '')
		END
		

	END


	DECLARE @keyCategoryID3 int;
	SET @keyCategoryID3 = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Email.SMTP')
	IF @keyCategoryID3 IS NOT NULL BEGIN

	UPDATE [CMS_SettingsKey] SET 
			[KeyOrder] = 5
		WHERE [KeyName] = 'CMSSMTPServerPassword' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID3

	UPDATE [CMS_SettingsKey] SET 
			[KeyOrder] = 7
		WHERE [KeyName] = 'CMSSMTPServerTip' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID3

	UPDATE [CMS_SettingsKey] SET 
			[KeyIsHidden] = 1
		WHERE [KeyName] = 'CMSUseSSL' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID3


	END


	DECLARE @keyCategoryID4 int;
	SET @keyCategoryID4 = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Newsletters.POP3Settings')
	IF @keyCategoryID4 IS NOT NULL BEGIN

	UPDATE [CMS_SettingsKey] SET 
			[KeyIsHidden] = 1
		WHERE [KeyName] = 'CMSPOP3AuthenticationMethod' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID4

	UPDATE [CMS_SettingsKey] SET 
			[KeyOrder] = 7
		WHERE [KeyName] = 'CMSPOP3Password' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID4

	UPDATE [CMS_SettingsKey] SET 
			[KeyIsHidden] = 1
		WHERE [KeyName] = 'CMSPOP3UseSSL' AND [SiteID] IS NULL AND [KeyCategoryID] = @keyCategoryID4

	END

	 -- [LAST] Recalculate IDPath and ChildCount for UI_Element

    DECLARE @elementCursor CURSOR;
    SET @elementCursor = CURSOR FOR SELECT [ElementID], [ElementParentID] FROM [CMS_UIElement] ORDER BY [ElementLevel], [ElementID]

    DECLARE @elementID int;
    DECLARE @elementParentID5 int;

    OPEN @elementCursor

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID5;
    WHILE @@FETCH_STATUS = 0
    BEGIN

    UPDATE [CMS_UIElement] SET

        [ElementChildCount] = (SELECT COUNT(*)
                                FROM [CMS_UIElement] AS [Children]
                                WHERE [Children].[ElementParentID] = @elementID),

        [ElementIDPath] = COALESCE((SELECT TOP 1 [ElementIDPath] FROM [CMS_UIElement] AS [Parent] WHERE [Parent].ElementID = @elementParentID5), '')
                            + '/'
                            + REPLICATE('0', 8 - LEN([ElementID]))
                            + CAST([ElementID] AS NVARCHAR(8))

    WHERE [ElementID] = @elementID

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID5;
    END

    CLOSE @elementCursor;
    DEALLOCATE @elementCursor;
END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 85
BEGIN
	DECLARE @REFRESH_5_VERSION INT = 64;
	DECLARE @KeyValue NVARCHAR(20);
	
	IF @HOTFIXVERSION < @REFRESH_5_VERSION
	BEGIN
		SET @KeyValue = 'False';
	END
	ELSE
	BEGIN
		SET @KeyValue = 'True';
	END

	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.MediaLibraries.General');
	IF @keyCategoryID IS NOT NULL 
	BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_SettingsKey] WHERE [KeyName] = 'CMSMediaLibraryEnableUsageTracking')
		BEGIN
			INSERT [CMS_SettingsKey] ([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
			 VALUES ('CMSMediaLibraryEnableUsageTracking', '{$settingskey.cmsmedialibraryenableusagetracking$}', '{$settingskey.cmsmedialibraryenableusagetracking.description$}', @KeyValue, 'boolean', @keyCategoryID, NULL, '283df5ca-d895-4407-afee-c013033f712c', getDate(), 9, 'False', NULL, NULL, 1, 0, 0, NULL, '')
		END
	END
END
GO

-- KX-5318
DECLARE @REFRESH_8_VERSION INT = 94;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_8_VERSION
BEGIN

INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
VALUES ('cms.document',
        '<form version="2"><field column="DocumentID" columntype="integer" guid="04c53ea8-89c6-45fe-b9f8-11c869742937" isPK="true" system="true" visible="true"><properties><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentGUID" columntype="guid" guid="b0dc7e57-96dd-4e5b-829a-4ba9bd84ac0f" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field column="DocumentName" columnsize="100" columntype="text" guid="1e0f27f5-f59a-4fa1-871f-5c2d946453ca" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedWhen" columntype="datetime" guid="d86fd91f-9650-459d-a6a9-f101ec936cdf" system="true" visible="true"><properties><fieldcaption>DocumentModifiedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedByUserID" columntype="integer" guid="3db3f1c9-02b4-4d37-abd5-1298a9068ac1" system="true" visible="true"><properties><fieldcaption>DocumentModifiedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentForeignKeyValue" columntype="integer" guid="1ab4dfd9-6e8c-4b4d-9526-528890bc9c47" system="true" visible="true"><properties><fieldcaption>DocumentForeignKeyValue</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedByUserID" columntype="integer" guid="89690d5f-2c54-4788-8926-b38692719e0e" system="true" visible="true"><properties><fieldcaption>DocumentCreatedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedWhen" columntype="datetime" guid="82f0e9c1-9dfa-42a1-9b4a-a0090bbfad73" system="true" visible="true"><properties><fieldcaption>DocumentCreatedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutByUserID" columntype="integer" guid="d561f437-cf47-4681-a94e-085d9632b926" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutWhen" columntype="datetime" guid="65160c58-f425-4370-baf6-b47dc987611d" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutVersionHistoryID" columntype="integer" guid="31bf940c-d22c-4bf8-a430-776b6d4488c7" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishedVersionHistoryID" columntype="integer" guid="8229ebd2-c4d2-43bd-82e9-ae9af6146c97" system="true" visible="true"><properties><fieldcaption>DocumentPublishedVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowStepID" columntype="integer" guid="b7238cf1-94ac-4c59-87f4-f472f78245b2" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowStepID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishFrom" columntype="datetime" guid="5998e7fe-a503-4c5a-8711-9a4cbe77d8a3" system="true" visible="true"><properties><fieldcaption>DocumentPublishFrom</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishTo" columntype="datetime" guid="75b22166-d757-485f-901a-6636cabe930e" system="true" visible="true"><properties><fieldcaption>DocumentPublishTo</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentUnpublishedRedirectUrl" columnsize="450" columntype="text" guid="5112f255-bc7d-42b2-b24a-a9008ba2564d" system="true"><properties><fieldcaption>DocumentUnpublishedRedirectUrl</fieldcaption></properties><settings><controlname>URLSelector</controlname></settings></field><field column="DocumentCulture" columnsize="50" columntype="text" guid="e123ee40-049c-48b6-9dd8-a51b1e7da6b1" system="true" visible="true"><properties><fieldcaption>DocumentCulture</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field column="DocumentNodeID" columntype="integer" guid="3bc79b36-ba8f-4fea-85a4-c72fdbc315d2" system="true" visible="true"><properties><fieldcaption>DocumentNodeID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPageTitle" columntype="longtext" guid="a2df3057-5b8d-481b-9247-88b970c57a0b" system="true" visible="true"><properties><fieldcaption>DocumentPageTitle</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageKeyWords" columntype="longtext" guid="e6a709b2-d460-4f13-9abf-c0f100e97033" system="true" visible="true"><properties><fieldcaption>DocumentPageKeyWords</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageDescription" columntype="longtext" guid="4af8a60e-4d17-42c6-a830-1f6655aa807e" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentPageDescription</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentContent" columntype="longtext" guid="7cc90d0b-19c9-49fa-a7ce-14104dd32586" system="true" visible="true"><properties><fieldcaption>DocumentContent</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentCustomData" columntype="longtext" guid="8c76cc14-a486-44f9-a1f2-1947192ca6a2" system="true" visible="true"><properties><fieldcaption>DocumentCustomData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTags" columntype="longtext" guid="6a33a0ff-ffd9-4615-a1c8-5e1bba780964" system="true" visible="true"><properties><fieldcaption>DocumentTags</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTagGroupID" columntype="integer" guid="82d94a1c-a0e9-4496-bad0-6192217212bf" system="true" visible="true"><properties><fieldcaption>DocumentTagGroupID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentLastPublished" columntype="datetime" guid="834785f6-f532-435f-b76f-c20dfd9399f6" system="true" visible="true"><properties><fieldcaption>DocumentLastPublished</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentSearchExcluded" columntype="boolean" guid="05110f5f-a8dd-4e30-828c-ef767cfdb1e4" spellcheck="false" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>Page search excluded</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentLastVersionNumber" columnsize="50" columntype="text" guid="88338d99-7f91-4c20-8c84-a3dd97cb53a1" spellcheck="false" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsArchived" columntype="boolean" guid="41cad1db-9aa7-4818-ae85-a9651578e554" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowCycleGUID" columntype="guid" guid="7a8dbf8e-a387-4068-b255-247eff08351a" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsWaitingForTranslation" columntype="boolean" guid="ab09e46a-07b9-4bc2-be12-7c5c54840ba9" system="true"><properties><defaultvalue>false</defaultvalue></properties><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUName" columnsize="440" columntype="text" guid="32f0a3cf-cb9f-490e-a737-362123ec3cd4" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUDescription" columntype="longtext" guid="1f04c541-6ebe-412f-94ee-ddd370c46044" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentSKUShortDescription" columntype="longtext" guid="6a14a367-6f85-4da9-9430-5aa4a6f037c4" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentWorkflowActionStatus" columnsize="450" columntype="text" guid="11d7b5dd-fae8-4f61-af02-ca3a196abcb3" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowActionStatus</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="DocumentCanBePublished" columntype="boolean" guid="8d5d0089-266a-4f9d-9810-05cdb52f8cde" system="true"><properties><defaultvalue>True</defaultvalue></properties></field><field allowempty="true" column="DocumentPageBuilderWidgets" columntype="longtext" guid="b3a3768e-3dfa-4f7c-9e62-de84dd322812" system="true" /><field allowempty="true" column="DocumentPageTemplateConfiguration" columntype="longtext" guid="27ca67f3-bdeb-491e-b96b-8d52bac7d57a" system="true" /><field allowempty="true" column="DocumentABTestConfiguration" columntype="longtext" guid="639cb356-b9c0-4714-99a8-faf4924d06da" system="true" /><field column="DocumentShowInMenu" columntype="boolean" guid="480c8c29-fd4f-4e0a-b002-b3674de8c2ca" system="true" visible="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>DocumentShowInMenu</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
        0);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="DocumentID" columntype="integer" guid="04c53ea8-89c6-45fe-b9f8-11c869742937" isPK="true" system="true" visible="true"><properties><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentGUID" columntype="guid" guid="b0dc7e57-96dd-4e5b-829a-4ba9bd84ac0f" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field column="DocumentName" columnsize="100" columntype="text" guid="1e0f27f5-f59a-4fa1-871f-5c2d946453ca" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedWhen" columntype="datetime" guid="d86fd91f-9650-459d-a6a9-f101ec936cdf" system="true" visible="true"><properties><fieldcaption>DocumentModifiedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedByUserID" columntype="integer" guid="3db3f1c9-02b4-4d37-abd5-1298a9068ac1" system="true" visible="true"><properties><fieldcaption>DocumentModifiedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentForeignKeyValue" columntype="integer" guid="1ab4dfd9-6e8c-4b4d-9526-528890bc9c47" system="true" visible="true"><properties><fieldcaption>DocumentForeignKeyValue</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedByUserID" columntype="integer" guid="89690d5f-2c54-4788-8926-b38692719e0e" system="true" visible="true"><properties><fieldcaption>DocumentCreatedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedWhen" columntype="datetime" guid="82f0e9c1-9dfa-42a1-9b4a-a0090bbfad73" system="true" visible="true"><properties><fieldcaption>DocumentCreatedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutByUserID" columntype="integer" guid="d561f437-cf47-4681-a94e-085d9632b926" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutWhen" columntype="datetime" guid="65160c58-f425-4370-baf6-b47dc987611d" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutVersionHistoryID" columntype="integer" guid="31bf940c-d22c-4bf8-a430-776b6d4488c7" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishedVersionHistoryID" columntype="integer" guid="8229ebd2-c4d2-43bd-82e9-ae9af6146c97" system="true" visible="true"><properties><fieldcaption>DocumentPublishedVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowStepID" columntype="integer" guid="b7238cf1-94ac-4c59-87f4-f472f78245b2" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowStepID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishFrom" columntype="datetime" guid="5998e7fe-a503-4c5a-8711-9a4cbe77d8a3" system="true" visible="true"><properties><fieldcaption>DocumentPublishFrom</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishTo" columntype="datetime" guid="75b22166-d757-485f-901a-6636cabe930e" system="true" visible="true"><properties><fieldcaption>DocumentPublishTo</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentUnpublishedRedirectUrl" columnsize="450" columntype="text" guid="5112f255-bc7d-42b2-b24a-a9008ba2564d" system="true"><properties><fieldcaption>DocumentUnpublishedRedirectUrl</fieldcaption></properties><settings><controlname>URLSelector</controlname></settings></field><field column="DocumentCulture" columnsize="50" columntype="text" guid="e123ee40-049c-48b6-9dd8-a51b1e7da6b1" system="true" visible="true"><properties><fieldcaption>DocumentCulture</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field column="DocumentNodeID" columntype="integer" guid="3bc79b36-ba8f-4fea-85a4-c72fdbc315d2" system="true" visible="true"><properties><fieldcaption>DocumentNodeID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPageTitle" columntype="longtext" guid="a2df3057-5b8d-481b-9247-88b970c57a0b" system="true" visible="true"><properties><fieldcaption>DocumentPageTitle</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageKeyWords" columntype="longtext" guid="e6a709b2-d460-4f13-9abf-c0f100e97033" system="true" visible="true"><properties><fieldcaption>DocumentPageKeyWords</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageDescription" columntype="longtext" guid="4af8a60e-4d17-42c6-a830-1f6655aa807e" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentPageDescription</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentContent" columntype="longtext" guid="7cc90d0b-19c9-49fa-a7ce-14104dd32586" system="true" visible="true"><properties><fieldcaption>DocumentContent</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentCustomData" columntype="longtext" guid="8c76cc14-a486-44f9-a1f2-1947192ca6a2" system="true" visible="true"><properties><fieldcaption>DocumentCustomData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTags" columntype="longtext" guid="6a33a0ff-ffd9-4615-a1c8-5e1bba780964" system="true" visible="true"><properties><fieldcaption>DocumentTags</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTagGroupID" columntype="integer" guid="82d94a1c-a0e9-4496-bad0-6192217212bf" system="true" visible="true"><properties><fieldcaption>DocumentTagGroupID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentLastPublished" columntype="datetime" guid="834785f6-f532-435f-b76f-c20dfd9399f6" system="true" visible="true"><properties><fieldcaption>DocumentLastPublished</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentSearchExcluded" columntype="boolean" guid="05110f5f-a8dd-4e30-828c-ef767cfdb1e4" spellcheck="false" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>Page search excluded</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentLastVersionNumber" columnsize="50" columntype="text" guid="88338d99-7f91-4c20-8c84-a3dd97cb53a1" spellcheck="false" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsArchived" columntype="boolean" guid="41cad1db-9aa7-4818-ae85-a9651578e554" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowCycleGUID" columntype="guid" guid="7a8dbf8e-a387-4068-b255-247eff08351a" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsWaitingForTranslation" columntype="boolean" guid="ab09e46a-07b9-4bc2-be12-7c5c54840ba9" system="true"><properties><defaultvalue>false</defaultvalue></properties><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUName" columnsize="440" columntype="text" guid="32f0a3cf-cb9f-490e-a737-362123ec3cd4" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUDescription" columntype="longtext" guid="1f04c541-6ebe-412f-94ee-ddd370c46044" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentSKUShortDescription" columntype="longtext" guid="6a14a367-6f85-4da9-9430-5aa4a6f037c4" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentWorkflowActionStatus" columnsize="450" columntype="text" guid="11d7b5dd-fae8-4f61-af02-ca3a196abcb3" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowActionStatus</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="DocumentCanBePublished" columntype="boolean" guid="8d5d0089-266a-4f9d-9810-05cdb52f8cde" system="true"><properties><defaultvalue>True</defaultvalue></properties></field><field allowempty="true" column="DocumentPageBuilderWidgets" columntype="longtext" guid="b3a3768e-3dfa-4f7c-9e62-de84dd322812" system="true" /><field allowempty="true" column="DocumentPageTemplateConfiguration" columntype="longtext" guid="27ca67f3-bdeb-491e-b96b-8d52bac7d57a" system="true" /><field allowempty="true" column="DocumentABTestConfiguration" columntype="longtext" guid="639cb356-b9c0-4714-99a8-faf4924d06da" system="true" /><field column="DocumentShowInMenu" columntype="boolean" guid="480c8c29-fd4f-4e0a-b002-b3674de8c2ca" system="true" visible="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>DocumentShowInMenu</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>'
	WHERE [ClassName] = 'cms.document';
END

END
GO

-- KX-4923
DECLARE @REFRESH_8_VERSION INT = 94;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_8_VERSION
BEGIN
	--Create new settings categories
	DECLARE @categoryParentID INT;
	SET @categoryParentID = (SELECT [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Membership.Protection')
	DECLARE @categoryResourceID INT
	SET @categoryResourceID = (SELECT [ResourceID] FROM [CMS_Resource] WHERE [ResourceName] = 'CMS.Membership')

	INSERT [CMS_SettingsCategory] ([CategoryDisplayName], [CategoryOrder], [CategoryName], [CategoryParentID], [CategoryIDPath], [CategoryLevel], [CategoryChildCount], [CategoryIconPath], [CategoryIsGroup], [CategoryIsCustom], [CategoryResourceID])
		 VALUES ('{$settingscategory.cmssecurityrecaptchav2$}', 3, 'CMS.Security.reCAPTCHAV2', @categoryParentID, '', 3, 0, '', 1, 0, @categoryResourceID)

	INSERT [CMS_SettingsCategory] ([CategoryDisplayName], [CategoryOrder], [CategoryName], [CategoryParentID], [CategoryIDPath], [CategoryLevel], [CategoryChildCount], [CategoryIconPath], [CategoryIsGroup], [CategoryIsCustom], [CategoryResourceID])
		 VALUES ('{$settingscategory.cmssecurityrecaptchav3$}', 4, 'CMS.Security.reCAPTCHAV3', @categoryParentID, '', 3, 0, '', 1, 0, @categoryResourceID)

	--Fix order of existing reCAPTCHA v2 settings keys, and move them to new cateogry
	DECLARE @keyCategoryIDV2 INT;
	SET @keyCategoryIDV2 = (SELECT [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Security.reCAPTCHAV2')

	IF @keyCategoryIDV2 IS NOT NULL BEGIN
		UPDATE [CMS_SettingsKey] SET 
			[KeyOrder] = 1, 
			[KeyCategoryId] = @keyCategoryIDV2
		WHERE [KeyName] = 'CMSReCaptchaPublicKey'
	
		UPDATE [CMS_SettingsKey] SET
			[KeyOrder] = 2, 
			[KeyCategoryId] = @keyCategoryIDV2
		WHERE [KeyName] = 'CMSReCaptchaPrivateKey'
	END
	
	-- Add new settings keys
	DECLARE @keyCategoryIDV3 int;
	SET @keyCategoryIDV3 = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Security.reCAPTCHAV3')
	IF @keyCategoryIDV3 IS NOT NULL BEGIN
		
		INSERT [CMS_SettingsKey]([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
		 Values ('CMSRecaptchaV3PublicKey', '{$settingskey.ReCAPTCHAV3PublicAPIKey$}', '{$settingskey.ReCAPTCHAV3PublicAPIKey.Description$}', NULL, 'string', @keyCategoryIDV3, NULL, '5c0ee499-a407-4f78-ad4d-73b431c6a252', getDate(), 1, NULL, NULL, NULL, 0, 0, 0, NULL, '')
		 
		INSERT [CMS_SettingsKey]([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
		 Values ('CMSReCaptchaV3PrivateKey', '{$settingskey.ReCAPTCHAV3PrivateAPIKey$}', '{$settingskey.ReCAPTCHAV3PrivateAPIKey.Description$}', NULL, 'string', @keyCategoryIDV3, NULL, 'D881BBFC-94DA-4060-92B2-0A319AC814C6', getDate(), 2, NULL, NULL, NULL, 0, 0, 0, NULL, '')
		 
		INSERT [CMS_SettingsKey]([KeyName], [KeyDisplayName], [KeyDescription], [KeyValue], [KeyType], [KeyCategoryID], [SiteID], [KeyGUID], [KeyLastModified], [KeyOrder], [KeyDefaultValue], [KeyValidation], [KeyEditingControlPath], [KeyIsGlobal], [KeyIsCustom], [KeyIsHidden], [KeyFormControlSettings], [KeyExplanationText])
		 Values ('CMSRecaptchaV3Threshold', '{$settingskey.ReCAPTCHAV3Threshold$}', '{$settingskey.ReCAPTCHAV3Threshold.Description$}', 0.5, 'double', @keyCategoryIDV3, NULL, 'B020D36C-30AB-4D8B-A5B1-44024C315D69', getDate(), 3,	0.5, '^(?:0*(?:\.\d+)?|1(\.0*)?)$', NULL, 0, 0, 0, NULL, '')
	END
END
GO


DECLARE @REFRESH_8_VERSION INT = 94;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_8_VERSION
BEGIN
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CMS_Workflow]') AND type in (N'U'))
	BEGIN
		IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_Workflow]') AND name = 'WorkflowEnabledFrom')
		BEGIN
			ALTER TABLE [CMS_Workflow] ADD [WorkflowEnabledFrom] [datetime2](7) NULL;
		END

		IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_Workflow]') AND name = 'WorkflowEnabledTo')
		BEGIN
			ALTER TABLE [CMS_Workflow] ADD [WorkflowEnabledTo] [datetime2](7) NULL;
		END
	END


    DECLARE @resourceID int;
    SET @resourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = '2b67f370-3df4-4a4d-8734-1974639c5b69')
    IF @resourceID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_ScheduledTask] WHERE [TaskGUID] = 'c95d1ca3-c68b-42c4-a4dc-d0f5c4b54fa2')
		BEGIN
			INSERT [CMS_ScheduledTask]([TaskName], [TaskDisplayName], [TaskAssemblyName], [TaskClass], [TaskInterval], [TaskData], [TaskLastRunTime], [TaskNextRunTime], [TaskLastResult], [TaskSiteID], [TaskDeleteAfterLastRun], [TaskServerName], [TaskGUID], [TaskLastModified], [TaskExecutions], [TaskResourceID], [TaskRunInSeparateThread], [TaskUseExternalService], [TaskAllowExternalService], [TaskLastExecutionReset], [TaskCondition], [TaskRunIndividually], [TaskUserID], [TaskType], [TaskObjectType], [TaskObjectID], [TaskExecutingServerName], [TaskEnabled], [TaskIsRunning], [TaskAvailability])
			VALUES ('EnableOrDisableAutomationProcesses', 'Enable or disable automation processes', 'CMS.Automation', 'CMS.Automation.AutomationProcessActivator', 'minute;10/7/2022 5:19:18 PM;1;00:00:00;23:59:00;Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', 'NOTEXECUTED', NULL, NULL, NULL, NULL, 0, '', 'c95d1ca3-c68b-42c4-a4dc-d0f5c4b54fa2', getDate(), 0, @resourceID, 0, 1, 1, getDate(),'', 0, NULL, NULL, NULL, NULL, '', 1, 0, 0)
		END
	END


	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.workflow',
			'<form version="2"><field column="WorkflowID" columntype="integer" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isPK="true" system="true" visible="true"><properties><fieldcaption>WorkflowID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="WorkflowDisplayName" columnsize="450" columntype="text" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowName" columnsize="450" columntype="text" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowGUID" columntype="file" guid="a7be7df7-232f-4cf4-8446-09df882727bc" system="true" visible="true"><properties><fieldcaption>WorkflowGUID</fieldcaption></properties><settings><controlname>unknown</controlname></settings></field><field column="WorkflowLastModified" columntype="datetime" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" system="true" visible="true"><properties><fieldcaption>WorkflowLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="WorkflowEnabledFrom" columnprecision="7" columntype="datetime" guid="9245a31a-c1bb-43ff-992c-b0e084301987" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledFrom</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowEnabledTo" columnprecision="7" columntype="datetime" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledTo</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowAutoPublishChanges" columntype="boolean" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" system="true" visible="true"><properties><captioncssclass>Wrap Width120</captioncssclass><defaultvalue>false</defaultvalue><fieldcaption>WorkflowAutoPublishChanges</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowUseCheckinCheckout" columntype="boolean" guid="64518cad-820b-425a-9553-3a11fe06a609" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowUseCheckinCheckout</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowType" columntype="integer" guid="23dba236-db4e-4549-8dd9-bb15ae665296" system="true" visible="true"><properties><fieldcaption>WorkflowType</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendEmails" columntype="boolean" guid="772b67c7-150b-48a0-856e-22ca96d9f747" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowSendEmails</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendApproveEmails" columntype="boolean" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendApproveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowApprovedTemplateName" columnsize="200" columntype="text" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" system="true" visible="true"><properties><fieldcaption>WorkflowApprovedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendRejectEmails" columntype="boolean" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendRejectEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowRejectedTemplateName" columnsize="200" columntype="text" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" system="true" visible="true"><properties><fieldcaption>WorkflowRejectedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendPublishEmails" columntype="boolean" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendPublishEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowPublishedTemplateName" columnsize="200" columntype="text" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" system="true" visible="true"><properties><fieldcaption>WorkflowPublishedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendArchiveEmails" columntype="boolean" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendArchiveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowArchivedTemplateName" columnsize="200" columntype="text" guid="5cadd028-def3-4a36-97e8-53075839241c" system="true" visible="true"><properties><fieldcaption>WorkflowArchivedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendReadyForApprovalEmails" columntype="boolean" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendReadyForApprovalEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowReadyForApprovalTemplateName" columnsize="200" columntype="text" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" system="true" visible="true"><properties><fieldcaption>WorkflowReadyForApprovalTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowNotificationTemplateName" columnsize="200" columntype="text" guid="2633af02-6838-4651-872f-ca07c95c3ec1" system="true" visible="true"><properties><fieldcaption>WorkflowNotificationTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowAllowedObjects" columntype="longtext" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" system="true" visible="true"><properties><fieldcaption>Workflow allowed objects</fieldcaption></properties><settings><AllowAll>False</AllowAll><controlname>object_type_selector</controlname></settings></field><field allowempty="true" column="WorkflowRecurrenceType" columntype="integer" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" system="true" visible="true"><properties><fieldcaption>WorkflowRecurrenceType</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowEnabled" columntype="boolean" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
			0);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="WorkflowID" columntype="integer" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isPK="true" system="true" visible="true"><properties><fieldcaption>WorkflowID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="WorkflowDisplayName" columnsize="450" columntype="text" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowName" columnsize="450" columntype="text" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowGUID" columntype="file" guid="a7be7df7-232f-4cf4-8446-09df882727bc" system="true" visible="true"><properties><fieldcaption>WorkflowGUID</fieldcaption></properties><settings><controlname>unknown</controlname></settings></field><field column="WorkflowLastModified" columntype="datetime" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" system="true" visible="true"><properties><fieldcaption>WorkflowLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="WorkflowEnabledFrom" columnprecision="7" columntype="datetime" guid="9245a31a-c1bb-43ff-992c-b0e084301987" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledFrom</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowEnabledTo" columnprecision="7" columntype="datetime" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledTo</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowAutoPublishChanges" columntype="boolean" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" system="true" visible="true"><properties><captioncssclass>Wrap Width120</captioncssclass><defaultvalue>false</defaultvalue><fieldcaption>WorkflowAutoPublishChanges</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowUseCheckinCheckout" columntype="boolean" guid="64518cad-820b-425a-9553-3a11fe06a609" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowUseCheckinCheckout</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowType" columntype="integer" guid="23dba236-db4e-4549-8dd9-bb15ae665296" system="true" visible="true"><properties><fieldcaption>WorkflowType</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendEmails" columntype="boolean" guid="772b67c7-150b-48a0-856e-22ca96d9f747" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowSendEmails</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendApproveEmails" columntype="boolean" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendApproveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowApprovedTemplateName" columnsize="200" columntype="text" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" system="true" visible="true"><properties><fieldcaption>WorkflowApprovedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendRejectEmails" columntype="boolean" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendRejectEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowRejectedTemplateName" columnsize="200" columntype="text" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" system="true" visible="true"><properties><fieldcaption>WorkflowRejectedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendPublishEmails" columntype="boolean" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendPublishEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowPublishedTemplateName" columnsize="200" columntype="text" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" system="true" visible="true"><properties><fieldcaption>WorkflowPublishedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendArchiveEmails" columntype="boolean" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendArchiveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowArchivedTemplateName" columnsize="200" columntype="text" guid="5cadd028-def3-4a36-97e8-53075839241c" system="true" visible="true"><properties><fieldcaption>WorkflowArchivedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendReadyForApprovalEmails" columntype="boolean" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendReadyForApprovalEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowReadyForApprovalTemplateName" columnsize="200" columntype="text" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" system="true" visible="true"><properties><fieldcaption>WorkflowReadyForApprovalTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowNotificationTemplateName" columnsize="200" columntype="text" guid="2633af02-6838-4651-872f-ca07c95c3ec1" system="true" visible="true"><properties><fieldcaption>WorkflowNotificationTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowAllowedObjects" columntype="longtext" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" system="true" visible="true"><properties><fieldcaption>Workflow allowed objects</fieldcaption></properties><settings><AllowAll>False</AllowAll><controlname>object_type_selector</controlname></settings></field><field allowempty="true" column="WorkflowRecurrenceType" columntype="integer" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" system="true" visible="true"><properties><fieldcaption>WorkflowRecurrenceType</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowEnabled" columntype="boolean" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>'
	WHERE [ClassName] = 'cms.workflow';


	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.workflow.MarketingAutomation',
			'<form version="2"><field column="WorkflowDisplayName" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" order="0" /><field column="WorkflowName" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" order="1"><settings><controlname>CodeName</controlname><RequireIdentifier>False</RequireIdentifier><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings></field><field column="WorkflowRecurrenceType" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" order="2"><settings><AssemblyName>CMS.WorkflowEngine</AssemblyName><controlname>AutomationRecurrenceType</controlname><DisplayType>2</DisplayType><ExcludedValues>0</ExcludedValues><Sort>False</Sort><TypeName>CMS.WorkflowEngine.ProcessRecurrenceTypeEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings><properties><contentafter ismacro="true">&lt;br /&gt;&lt;br /&gt;
&lt;div class="js-st-expanded smarttip-expanded" style="width: 40%; min-width: 350px;"&gt;
    &lt;div class="alert-dismissable alert alert-smarttip"&gt;
        &lt;span class="alert-icon"&gt;
            &lt;i class="icon-light-bulb"&gt;&lt;/i&gt;&lt;span class="sr-only"&gt;{$ smarttip.smarttip $}&lt;/span&gt;
        &lt;/span&gt;
        &lt;div class="alert-label"&gt;
            &lt;div class="header"&gt;{$ processrecurrencetypeenum.smarttip.title $}&lt;/div&gt;
            &lt;div class="js-st-content"&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonconcurrentrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonconcurrentrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.recurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.recurring.description $}
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</contentafter><contentbefore>&lt;span class="form-control-inline"&gt;
	{$ processrecurrencetypeenum.textabove $}
&lt;/span&gt;</contentbefore><controlcssclass>column-reverse</controlcssclass><fieldcaption>{$cms.workflow.recurrency$}</fieldcaption></properties></field><field column="WorkflowID" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isunique="true" visible="" order="3" /><field column="WorkflowGUID" guid="a7be7df7-232f-4cf4-8446-09df882727bc" visible="" order="4" /><field column="WorkflowLastModified" columnprecision="7" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" visible="" order="5" /><field column="WorkflowAutoPublishChanges" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" visible="" order="6" /><field column="WorkflowUseCheckinCheckout" guid="64518cad-820b-425a-9553-3a11fe06a609" visible="" order="7" /><field column="WorkflowType" guid="23dba236-db4e-4549-8dd9-bb15ae665296" visible="" order="8" /><field column="WorkflowSendEmails" guid="772b67c7-150b-48a0-856e-22ca96d9f747" visible="" order="9" /><field column="WorkflowSendApproveEmails" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" visible="" order="10" /><field column="WorkflowApprovedTemplateName" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" visible="" order="11" /><field column="WorkflowSendRejectEmails" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" visible="" order="12" /><field column="WorkflowRejectedTemplateName" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" visible="" order="13" /><field column="WorkflowSendPublishEmails" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" visible="" order="14" /><field column="WorkflowPublishedTemplateName" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" visible="" order="15" /><field column="WorkflowSendArchiveEmails" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" visible="" order="16" /><field column="WorkflowArchivedTemplateName" guid="5cadd028-def3-4a36-97e8-53075839241c" visible="" order="17" /><field column="WorkflowSendReadyForApprovalEmails" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" visible="" order="18" /><field column="WorkflowReadyForApprovalTemplateName" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" visible="" order="19" /><field column="WorkflowNotificationTemplateName" guid="2633af02-6838-4651-872f-ca07c95c3ec1" visible="" order="20" /><field column="WorkflowAllowedObjects" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" visible="" order="21" /><field column="WorkflowEnabled" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" visible="" order="22" /><field column="WorkflowEnabledFrom" guid="9245a31a-c1bb-43ff-992c-b0e084301987" visible="" order="23" /><field column="WorkflowEnabledTo" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" visible="" order="24" /></form>',
			1);

UPDATE [CMS_AlternativeForm] SET 
	[FormDefinition] = '<form version="2"><field column="WorkflowDisplayName" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" order="0" /><field column="WorkflowName" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" order="1"><settings><controlname>CodeName</controlname><RequireIdentifier>False</RequireIdentifier><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings></field><field column="WorkflowRecurrenceType" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" order="2"><settings><AssemblyName>CMS.WorkflowEngine</AssemblyName><controlname>AutomationRecurrenceType</controlname><DisplayType>2</DisplayType><ExcludedValues>0</ExcludedValues><Sort>False</Sort><TypeName>CMS.WorkflowEngine.ProcessRecurrenceTypeEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings><properties><contentafter ismacro="true">&lt;br /&gt;&lt;br /&gt;
&lt;div class="js-st-expanded smarttip-expanded" style="width: 40%; min-width: 350px;"&gt;
    &lt;div class="alert-dismissable alert alert-smarttip"&gt;
        &lt;span class="alert-icon"&gt;
            &lt;i class="icon-light-bulb"&gt;&lt;/i&gt;&lt;span class="sr-only"&gt;{$ smarttip.smarttip $}&lt;/span&gt;
        &lt;/span&gt;
        &lt;div class="alert-label"&gt;
            &lt;div class="header"&gt;{$ processrecurrencetypeenum.smarttip.title $}&lt;/div&gt;
            &lt;div class="js-st-content"&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonconcurrentrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonconcurrentrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.recurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.recurring.description $}
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</contentafter><contentbefore>&lt;span class="form-control-inline"&gt;
	{$ processrecurrencetypeenum.textabove $}
&lt;/span&gt;</contentbefore><controlcssclass>column-reverse</controlcssclass><fieldcaption>{$cms.workflow.recurrency$}</fieldcaption></properties></field><field column="WorkflowID" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isunique="true" visible="" order="3" /><field column="WorkflowGUID" guid="a7be7df7-232f-4cf4-8446-09df882727bc" visible="" order="4" /><field column="WorkflowLastModified" columnprecision="7" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" visible="" order="5" /><field column="WorkflowAutoPublishChanges" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" visible="" order="6" /><field column="WorkflowUseCheckinCheckout" guid="64518cad-820b-425a-9553-3a11fe06a609" visible="" order="7" /><field column="WorkflowType" guid="23dba236-db4e-4549-8dd9-bb15ae665296" visible="" order="8" /><field column="WorkflowSendEmails" guid="772b67c7-150b-48a0-856e-22ca96d9f747" visible="" order="9" /><field column="WorkflowSendApproveEmails" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" visible="" order="10" /><field column="WorkflowApprovedTemplateName" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" visible="" order="11" /><field column="WorkflowSendRejectEmails" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" visible="" order="12" /><field column="WorkflowRejectedTemplateName" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" visible="" order="13" /><field column="WorkflowSendPublishEmails" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" visible="" order="14" /><field column="WorkflowPublishedTemplateName" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" visible="" order="15" /><field column="WorkflowSendArchiveEmails" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" visible="" order="16" /><field column="WorkflowArchivedTemplateName" guid="5cadd028-def3-4a36-97e8-53075839241c" visible="" order="17" /><field column="WorkflowSendReadyForApprovalEmails" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" visible="" order="18" /><field column="WorkflowReadyForApprovalTemplateName" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" visible="" order="19" /><field column="WorkflowNotificationTemplateName" guid="2633af02-6838-4651-872f-ca07c95c3ec1" visible="" order="20" /><field column="WorkflowAllowedObjects" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" visible="" order="21" /><field column="WorkflowEnabled" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" visible="" order="22" /><field column="WorkflowEnabledFrom" guid="9245a31a-c1bb-43ff-992c-b0e084301987" visible="" order="23" /><field column="WorkflowEnabledTo" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" visible="" order="24" /></form>'
	WHERE [FormGUID] = '9DAE41A1-0C61-4CF4-85B7-A647957A025F';
END


	DECLARE @formClassID int;
	SET @formClassID = (SELECT TOP 1 [ClassID] FROM [CMS_Class] WHERE [ClassGUID] = 'a80047fb-e386-48ea-b433-bcdd92d131e4')
	IF @formClassID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_AlternativeForm] WHERE [FormName] = 'MarketingAutomationScheduler' AND [FormClassID] = @formClassID)
		BEGIN
			INSERT [CMS_AlternativeForm] ([FormDisplayName], [FormName], [FormClassID], [FormDefinition], [FormLayout], [FormGUID], [FormLastModified], [FormCoupledClassID], [FormHideNewParentFields], [FormLayoutType], [FormVersionGUID], [FormCustomizedColumns], [FormIsCustom])
			VALUES ('MarketingAutomationScheduler', 'MarketingAutomationScheduler', @formClassID, '<form version="2"><field column="WorkflowID" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isunique="true" visible="" /><field column="WorkflowDisplayName" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" visible="" /><field column="WorkflowName" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" visible="" /><field column="WorkflowGUID" guid="a7be7df7-232f-4cf4-8446-09df882727bc" visible="" /><field column="WorkflowLastModified" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" visible="" /><field column="WorkflowEnabledFrom" guid="9245a31a-c1bb-43ff-992c-b0e084301987"><properties><fieldcaption>Enabled from</fieldcaption></properties></field><field column="WorkflowEnabledTo" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011"><properties><fieldcaption>Enabled to</fieldcaption></properties></field><field column="WorkflowAutoPublishChanges" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" visible="" /><field column="WorkflowUseCheckinCheckout" guid="64518cad-820b-425a-9553-3a11fe06a609" visible="" /><field column="WorkflowType" guid="23dba236-db4e-4549-8dd9-bb15ae665296" visible="" /><field column="WorkflowSendEmails" guid="772b67c7-150b-48a0-856e-22ca96d9f747" visible="" /><field column="WorkflowSendApproveEmails" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" visible="" /><field column="WorkflowApprovedTemplateName" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" visible="" /><field column="WorkflowSendRejectEmails" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" visible="" /><field column="WorkflowRejectedTemplateName" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" visible="" /><field column="WorkflowSendPublishEmails" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" visible="" /><field column="WorkflowPublishedTemplateName" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" visible="" /><field column="WorkflowSendArchiveEmails" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" visible="" /><field column="WorkflowArchivedTemplateName" guid="5cadd028-def3-4a36-97e8-53075839241c" visible="" /><field column="WorkflowSendReadyForApprovalEmails" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" visible="" /><field column="WorkflowReadyForApprovalTemplateName" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" visible="" /><field column="WorkflowNotificationTemplateName" guid="2633af02-6838-4651-872f-ca07c95c3ec1" visible="" /><field column="WorkflowAllowedObjects" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" visible="" /><field column="WorkflowRecurrenceType" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" visible="" /><field column="WorkflowEnabled" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" visible="" /></form>', NULL, 'f60ee5ea-c590-4591-92c1-ead197b139a8', getDate(), NULL, 1, NULL, '', '', 0)
		END
	END

END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 96
BEGIN
	-- Recalculate IDPath and ChildCount for CMS_SettingsCategory 
	DECLARE @categoryCursor CURSOR;
	SET @categoryCursor = CURSOR FOR SELECT [CategoryID], [CategoryParentID] FROM [CMS_SettingsCategory] WHERE [CategoryName] IN ('CMS.Membership.Protection', 'CMS.Security.reCAPTCHAV2', 'CMS.Security.reCAPTCHAV3') ORDER BY [CategoryLevel], [CategoryID]

	DECLARE @categoryID int;
	DECLARE @categoryParentID int;

	OPEN @categoryCursor

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	WHILE @@FETCH_STATUS = 0
	BEGIN

	UPDATE [CMS_SettingsCategory] SET

		[CategoryChildCount] = (SELECT COUNT(*)
										FROM [CMS_SettingsCategory] AS [Children]
										WHERE [Children].[CategoryParentID] = @categoryID),

		[CategoryIDPath] = COALESCE((SELECT TOP 1 [CategoryIDPath] FROM [CMS_SettingsCategory] AS [Parent] WHERE [Parent].CategoryID = @categoryParentID), '')
							  + '/'
							  + REPLICATE('0', 8 - LEN(@categoryID))
							  + CAST(@categoryID AS NVARCHAR(8))

	WHERE [CategoryID] = @categoryID

	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	END

	CLOSE @categoryCursor;
	DEALLOCATE @categoryCursor;
END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 97
BEGIN
	UPDATE [CMS_SettingsKey] 
	SET 
		[KeyValidation] = '^(?:0*(?:(\.|,)\d+)?|1((\.|,)0*)?)$' 
	WHERE [KeyName] IN ('CMSAzureComputerVisionConfidence', 'CMSRecaptchaV3Threshold')

	UPDATE [CMS_SettingsKey] 
	SET 
		[KeyValue] = REPLACE([KeyValue], ',', '.'),  
		[KeyDefaultValue] = REPLACE([KeyDefaultValue], ',', '.')
	WHERE [KeyType] = 'double'
END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 105
BEGIN
	IF EXISTS (SELECT * FROM sys.types WHERE sys.types.name = 'Type_OM_OrderedIntegerTable_DuplicatesAllowed')
	BEGIN
		DROP TYPE [Type_OM_OrderedIntegerTable_DuplicatesAllowed]

		CREATE TYPE [Type_OM_OrderedIntegerTable_DuplicatesAllowed] AS TABLE(
			[Value] [int] NOT NULL,
			PRIMARY KEY CLUSTERED 
		(
			[Value] ASC
		)WITH (IGNORE_DUP_KEY = ON)
		)
	END
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 126
BEGIN
	IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE [name] = 'CHECK_CMS_PageUrlPath_UniquePath')
		AND EXISTS (SELECT 1 FROM sys.objects WHERE [name] = 'Func_CMS_Routing_NumberOfCollidingAlternativeUrls' AND [Type] = 'FN')
	BEGIN
		ALTER TABLE [CMS_PageUrlPath] DROP CONSTRAINT [CHECK_CMS_PageUrlPath_UniquePath];
	
		EXEC('ALTER FUNCTION [Func_CMS_Routing_NumberOfCollidingAlternativeUrls](@path nvarchar(2000), @siteId int)
			RETURNS int
			AS 
			BEGIN
				IF LEN(@path) > 400
				BEGIN
					RETURN 0
				END
				DECLARE @rowcount int
				SELECT @rowcount = COUNT(*) 
					FROM CMS_AlternativeUrl 
					WHERE AlternativeUrlUrl = @path and AlternativeUrlSiteID = @siteId
				RETURN @rowcount
			END');
	END	
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 126
BEGIN
	IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE [name] = 'CHECK_CMS_PageUrlPath_UniquePath')
		AND EXISTS (SELECT 1 FROM sys.objects WHERE [name] = 'Func_CMS_Routing_NumberOfCollidingAlternativeUrls' AND [Type] = 'FN')
	BEGIN
		DECLARE @functionSchema NVARCHAR(MAX)
		SELECT @functionSchema = SCH.NAME FROM SYS.OBJECTS O
		INNER JOIN SYS.SCHEMAS SCH ON O.SCHEMA_ID = SCH.SCHEMA_ID
		WHERE O.[NAME] = 'Func_CMS_Routing_NumberOfCollidingAlternativeUrls'

		DECLARE @createUrlConstraint NVARCHAR(MAX) = 'ALTER TABLE CMS_PageUrlPath
		ADD CONSTRAINT CHECK_CMS_PageUrlPath_UniquePath
		CHECK (' + @functionSchema + '.Func_CMS_Routing_NumberOfCollidingAlternativeUrls(PageUrlPathUrlPath, PageUrlPathSiteID) = 0 )'
		EXEC(@createUrlConstraint)		

		ALTER TABLE [CMS_PageUrlPath] CHECK CONSTRAINT [CHECK_CMS_PageUrlPath_UniquePath];
	END
END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 140
BEGIN
	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Files.Security');

	IF NOT EXISTS(SELECT 1 FROM [CMS_SettingsKey] WHERE KeyName = 'CMSEnableMediaProtection') 
	BEGIN
		INSERT INTO CMS_SettingsKey
		(
			[KeyName],
			[KeyDisplayName],
			[KeyDescription],
			[KeyValue],
			[KeyType],
			[KeyCategoryID],
			[KeyGUID],
			[KeyOrder],
			[KeyDefaultValue],
			[KeyIsGlobal],
			[KeyIsHidden],
			[KeyLastModified],
			[KeyExplanationText]
		)
			VALUES
		(
			'CMSEnableMediaProtection',
			'{$settingskey.cmsenablemediaprotection$}',
			'{$settingskey.cmsenablemediaprotection.description$}',
			'False',
			'boolean',
			@keyCategoryID,
			'C859DFF4-FA9C-43D4-8CC6-110C0F0CC495',
			4,
			'True',
			1,
			0,
			GetDate(),
			''
		)
	END


	DECLARE @elementParentID int;
	SET @elementParentID = (SELECT TOP 1 [ElementID] FROM [CMS_UIElement] WHERE [ElementGUID] = '22d81413-8401-47e5-953b-adc993b5bb70')
	IF @elementParentID IS NOT NULL 
	BEGIN
		DECLARE @elementResourceID int;
		SET @elementResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'ce1a65a0-80dc-4c53-b0e7-bdecf0aa8c02')
		IF @elementResourceID IS NOT NULL 
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM [CMS_UIElement] WHERE [ElementName] = 'Files.MediaProtection' AND [ElementParentID] = @elementParentID)
			BEGIN
				INSERT [CMS_UIElement] ([ElementDisplayName], [ElementName], [ElementCaption], [ElementTargetURL], [ElementResourceID], [ElementParentID], [ElementChildCount], [ElementOrder], [ElementLevel], [ElementIDPath], [ElementIconPath], [ElementIsCustom], [ElementLastModified], [ElementGUID], [ElementSize], [ElementDescription], [ElementFromVersion], [ElementPageTemplateID], [ElementType], [ElementProperties], [ElementIsMenu], [ElementFeature], [ElementIconClass], [ElementIsGlobalApplication], [ElementCheckModuleReadPermission], [ElementAccessCondition], [ElementVisibilityCondition], [ElementRequiresGlobalAdminPriviligeLevel])
				 VALUES ('{$administration-system.files.mediaprotection$}', 'Files.MediaProtection', '', '~/CMSModules/System/Files/System_MediaProtection.aspx', @elementResourceID, @elementParentID, 0, 6, 5, '', '', 0, getDate(), '395792B7-273E-4606-AEA2-83EA42CBDB62', 0, '', '13.0', NULL, 'Url', '<Data><DisplayBreadcrumbs>False</DisplayBreadcrumbs></Data>', 0, '', '', 0, 1, '', '', 0)
			END
		END
	END

	-- [LAST] Recalculate IDPath and ChildCount for UI_Element

    DECLARE @elementCursor CURSOR;
    SET @elementCursor = CURSOR FOR SELECT [ElementID], [ElementParentID] FROM [CMS_UIElement] ORDER BY [ElementLevel], [ElementID]

    DECLARE @elementID int;
    DECLARE @elementParentID2 int;

    OPEN @elementCursor

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID2;
    WHILE @@FETCH_STATUS = 0
    BEGIN

    UPDATE [CMS_UIElement] SET

        [ElementChildCount] = (SELECT COUNT(*)
                                FROM [CMS_UIElement] AS [Children]
                                WHERE [Children].[ElementParentID] = @elementID),

        [ElementIDPath] = COALESCE((SELECT TOP 1 [ElementIDPath] FROM [CMS_UIElement] AS [Parent] WHERE [Parent].ElementID = @elementParentID2), '')
                            + '/'
                            + REPLICATE('0', 8 - LEN([ElementID]))
                            + CAST([ElementID] AS NVARCHAR(8))

    WHERE [ElementID] = @elementID

    FETCH NEXT FROM @elementCursor INTO @elementID, @elementParentID2;
    END

    CLOSE @elementCursor;
    DEALLOCATE @elementCursor;
END
GO

-- KX-11088
DECLARE @REFRESH_12_VERSION INT = 142;
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < @REFRESH_12_VERSION
BEGIN
	-- UPDATE cms.category class form definition
	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.category', '<form version="2"><field column="CategoryID" columntype="integer" guid="a7e6de80-6774-4fc9-8764-fde25832fce0" isPK="true" system="true"><properties><fieldcaption>CategoryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="CategorySiteID" columntype="integer" guid="55f19a7f-1e83-4f11-8dcd-b15e2c5e2638" system="true" visible="true"><properties><defaultvalue ismacro="true">{%Form.ObjectSiteID &gt; 0 ? Form.ObjectSiteID : "" @%}</defaultvalue><fieldcaption>{$category_edit.categorysite$}</fieldcaption><fielddescription>{$category.categorysiteid.description$}</fielddescription></properties><settings><controlname>RadioButtonsControl</controlname><Options>{%Form.ObjectSiteID @%};{$category_edit.sitecategory$}
;{$category_edit.globalcategory$}</Options><RepeatDirection>horizontal</RepeatDirection><RepeatLayout>Flow</RepeatLayout></settings></field><field column="CategoryDisplayName" columnsize="250" columntype="text" guid="62f59aab-9b3e-4ddc-8f7a-fb97e039de40" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$category.categorydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="CategoryName" columnsize="250" columntype="text" guid="6ec936dc-3b0f-476c-8d07-9dbb7e5a19b9" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$category.categoryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="CategoryParentID" columntype="integer" guid="70e95a64-6c83-4dc3-a334-c8a7bf61ea39" system="true" visible="true"><properties><fieldcaption>{$category_edit.parentcategory$}</fieldcaption><fielddescription>{$category.categoryparentid.description$}</fielddescription><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Update @%}</visiblemacro></properties><settings><AddRootRecord>True</AddRootRecord><controlname>category_sparentselector</controlname></settings></field><field allowempty="true" column="CategoryDescription" columntype="longtext" guid="21b4dc27-69d2-4ee5-ad21-31ce7362a169" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$category.categorydescription.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field column="CategoryEnabled" columntype="boolean" guid="60a19437-daca-476d-a9c7-f771810012d2" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>{$category.categoryenabled.description$}</fielddescription></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="CategoryAllowAllTypes" columntype="boolean" guid="16389d07-e29e-472c-bc1b-a3a5e5d5f24a" hasdependingfields="true" system="true"><properties><defaultvalue>True</defaultvalue></properties><settings><controlname>RadioButtonsControl</controlname><Options>1;{$category.allowalltypes$}
0;{$category.allowonlyfollowing$}</Options><RepeatDirection>vertical</RepeatDirection><RepeatLayout>Flow</RepeatLayout><SortItems>False</SortItems></settings></field><field allowempty="true" column="CategoryCount" columntype="integer" guid="d333614c-e26b-45fa-803f-2815644d9b6e" system="true"><properties><fieldcaption>CategoryEnabled</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="CategoryUserID" columntype="integer" guid="aebc6d41-6911-4955-8566-3e46053d2243" system="true"><properties><fieldcaption>CategoryUserID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="CategoryGUID" columntype="guid" guid="09d6706d-6145-400c-9e12-c47f14fdfa44" system="true"><properties><fieldcaption>CategoryGUID</fieldcaption></properties><settings><controlname>LabelControl</controlname></settings></field><field column="CategoryLastModified" columntype="datetime" guid="67e9377c-c25a-4dd7-9ef8-9b9d97a408ce" system="true"><properties><fieldcaption>CategoryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="CategoryIDPath" columnsize="450" columntype="text" guid="aac5e74e-aa14-43b5-b18c-fd329ba7974c" system="true"><properties><fieldcaption>CategoryIDPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryNamePath" columnsize="1500" columntype="text" guid="1591d49a-9209-4d55-851c-9fe1769e9def" system="true"><properties><fieldcaption>CategoryNamePath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryLevel" columntype="integer" guid="359e5923-49da-4a39-9910-b9458d5a40a2" system="true"><properties><fieldcaption>CategoryLevel</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryOrder" columntype="integer" guid="3b0a29ce-b93f-4ff8-a86b-5273a4ad1336" system="true"><properties><fieldcaption>CategoryOrder</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field></form>', 0);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="CategoryID" columntype="integer" guid="a7e6de80-6774-4fc9-8764-fde25832fce0" isPK="true" system="true"><properties><fieldcaption>CategoryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="CategorySiteID" columntype="integer" guid="55f19a7f-1e83-4f11-8dcd-b15e2c5e2638" system="true" visible="true"><properties><defaultvalue ismacro="true">{%Form.ObjectSiteID &gt; 0 ? Form.ObjectSiteID : "" @%}</defaultvalue><fieldcaption>{$category_edit.categorysite$}</fieldcaption><fielddescription>{$category.categorysiteid.description$}</fielddescription></properties><settings><controlname>RadioButtonsControl</controlname><Options>{%Form.ObjectSiteID @%};{$category_edit.sitecategory$}
;{$category_edit.globalcategory$}</Options><RepeatDirection>horizontal</RepeatDirection><RepeatLayout>Flow</RepeatLayout></settings></field><field column="CategoryDisplayName" columnsize="250" columntype="text" guid="62f59aab-9b3e-4ddc-8f7a-fb97e039de40" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$category.categorydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="CategoryName" columnsize="250" columntype="text" guid="6ec936dc-3b0f-476c-8d07-9dbb7e5a19b9" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$category.categoryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="CategoryParentID" columntype="integer" guid="70e95a64-6c83-4dc3-a334-c8a7bf61ea39" system="true" visible="true"><properties><fieldcaption>{$category_edit.parentcategory$}</fieldcaption><fielddescription>{$category.categoryparentid.description$}</fielddescription><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Update @%}</visiblemacro></properties><settings><AddRootRecord>True</AddRootRecord><controlname>category_sparentselector</controlname></settings></field><field allowempty="true" column="CategoryDescription" columntype="longtext" guid="21b4dc27-69d2-4ee5-ad21-31ce7362a169" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$category.categorydescription.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field column="CategoryEnabled" columntype="boolean" guid="60a19437-daca-476d-a9c7-f771810012d2" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>{$category.categoryenabled.description$}</fielddescription></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="CategoryAllowAllTypes" columntype="boolean" guid="16389d07-e29e-472c-bc1b-a3a5e5d5f24a" hasdependingfields="true" system="true"><properties><defaultvalue>True</defaultvalue></properties><settings><controlname>RadioButtonsControl</controlname><Options>1;{$category.allowalltypes$}
0;{$category.allowonlyfollowing$}</Options><RepeatDirection>vertical</RepeatDirection><RepeatLayout>Flow</RepeatLayout><SortItems>False</SortItems></settings></field><field allowempty="true" column="CategoryCount" columntype="integer" guid="d333614c-e26b-45fa-803f-2815644d9b6e" system="true"><properties><fieldcaption>CategoryEnabled</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="CategoryUserID" columntype="integer" guid="aebc6d41-6911-4955-8566-3e46053d2243" system="true"><properties><fieldcaption>CategoryUserID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="CategoryGUID" columntype="guid" guid="09d6706d-6145-400c-9e12-c47f14fdfa44" system="true"><properties><fieldcaption>CategoryGUID</fieldcaption></properties><settings><controlname>LabelControl</controlname></settings></field><field column="CategoryLastModified" columntype="datetime" guid="67e9377c-c25a-4dd7-9ef8-9b9d97a408ce" system="true"><properties><fieldcaption>CategoryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="CategoryIDPath" columnsize="450" columntype="text" guid="aac5e74e-aa14-43b5-b18c-fd329ba7974c" system="true"><properties><fieldcaption>CategoryIDPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryNamePath" columnsize="1500" columntype="text" guid="1591d49a-9209-4d55-851c-9fe1769e9def" system="true"><properties><fieldcaption>CategoryNamePath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryLevel" columntype="integer" guid="359e5923-49da-4a39-9910-b9458d5a40a2" system="true"><properties><fieldcaption>CategoryLevel</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryOrder" columntype="integer" guid="3b0a29ce-b93f-4ff8-a86b-5273a4ad1336" system="true"><properties><fieldcaption>CategoryOrder</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field></form>'
	WHERE [ClassName] = 'cms.category';
END

	-- INSERT new alt form
	DECLARE @formClassID int;
	SET @formClassID = (SELECT TOP 1 [ClassID] FROM [CMS_Class] WHERE [ClassGUID] = 'f9bd0914-ee13-41f8-85a3-4f2b50875c99')
	IF @formClassID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_AlternativeForm] WHERE [FormName] = 'EditPageTypeBinding' AND [FormClassID] = @formClassID)
		BEGIN
			INSERT [CMS_AlternativeForm] ([FormDisplayName], [FormName], [FormClassID], [FormDefinition], [FormLayout], [FormGUID], [FormLastModified], [FormCoupledClassID], [FormHideNewParentFields], [FormLayoutType], [FormVersionGUID], [FormCustomizedColumns], [FormIsCustom])
			 VALUES ('Edit page type binding', 'EditPageTypeBinding', @formClassID, '<form version="2"><field column="CategoryID" guid="a7e6de80-6774-4fc9-8764-fde25832fce0" /><field column="CategorySiteID" guid="55f19a7f-1e83-4f11-8dcd-b15e2c5e2638" visible="" /><field column="CategoryDisplayName" guid="62f59aab-9b3e-4ddc-8f7a-fb97e039de40" visible="" /><field column="CategoryName" guid="6ec936dc-3b0f-476c-8d07-9dbb7e5a19b9" visible="" /><field column="CategoryParentID" guid="70e95a64-6c83-4dc3-a334-c8a7bf61ea39" visible="" /><field column="CategoryDescription" guid="21b4dc27-69d2-4ee5-ad21-31ce7362a169" visible="" /><field column="CategoryEnabled" guid="60a19437-daca-476d-a9c7-f771810012d2" visible="" /><field column="CategoryAllowAllTypes" guid="16389d07-e29e-472c-bc1b-a3a5e5d5f24a" visible="true" /><field allowempty="true" column="CategoryClasses" columntype="longtext" dummy="altform" guid="37816dea-4104-4180-a1af-2812b3c4d0af" system="true" visible="true" order="8"><properties><enabledmacro ismacro="true">{%!CategoryAllowAllTypes.Value|(identity)GlobalAdministrator|(hash)42240bd4fce6c8cb1bfe2cb3619e1193ba07204c2cff12f3e3556cffcd00ce60%}</enabledmacro></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>False</AllowEmpty><controlname>Uni_selector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><ObjectType>cms.documenttype</ObjectType><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>ClassID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>2</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings></field><field column="CategoryCount" guid="d333614c-e26b-45fa-803f-2815644d9b6e" order="9" /><field column="CategoryUserID" guid="aebc6d41-6911-4955-8566-3e46053d2243" order="10" /><field column="CategoryGUID" guid="09d6706d-6145-400c-9e12-c47f14fdfa44" order="11" /><field column="CategoryLastModified" guid="67e9377c-c25a-4dd7-9ef8-9b9d97a408ce" order="12" /><field column="CategoryIDPath" guid="aac5e74e-aa14-43b5-b18c-fd329ba7974c" order="13" /><field column="CategoryNamePath" guid="1591d49a-9209-4d55-851c-9fe1769e9def" order="14" /><field column="CategoryLevel" guid="359e5923-49da-4a39-9910-b9458d5a40a2" order="15" /><field column="CategoryOrder" guid="3b0a29ce-b93f-4ff8-a86b-5273a4ad1336" order="16" /></form>', NULL, '1d5dd41b-1395-4944-8224-af3ea1f13a6e', getDate(), NULL, 0, NULL, '', '', 0)
		END
	END

	-- INSERT new class
	DECLARE @classResourceID int;
	SET @classResourceID = (SELECT TOP 1 [ResourceID] FROM [CMS_Resource] WHERE [ResourceGUID] = 'aafd78f2-91f7-47cc-bf0b-d1a048d9540a')
	IF @classResourceID IS NOT NULL BEGIN
		IF NOT EXISTS (SELECT 1 FROM [CMS_Class] WHERE [ClassName] = 'CMS.CategoryClass')
		BEGIN
			INSERT [CMS_Class] ([ClassDisplayName], [ClassName], [ClassUsesVersioning], [ClassIsDocumentType], [ClassIsCoupledClass], [ClassXmlSchema], [ClassFormDefinition], [ClassNodeNameSource], [ClassTableName], [ClassFormLayout], [ClassShowAsSystemTable], [ClassUsePublishFromTo], [ClassShowTemplateSelection], [ClassSKUMappings], [ClassIsMenuItemType], [ClassNodeAliasSource], [ClassLastModified], [ClassGUID], [ClassCreateSKU], [ClassIsProduct], [ClassIsCustomTable], [ClassShowColumns], [ClassSearchTitleColumn], [ClassSearchContentColumn], [ClassSearchImageColumn], [ClassSearchCreationDateColumn], [ClassSearchSettings], [ClassInheritsFromClassID], [ClassSearchEnabled], [ClassSKUDefaultDepartmentName], [ClassSKUDefaultDepartmentID], [ClassContactMapping], [ClassContactOverwriteEnabled], [ClassSKUDefaultProductType], [ClassConnectionString], [ClassIsProductSection], [ClassFormLayoutType], [ClassVersionGUID], [ClassDefaultObjectType], [ClassIsForm], [ClassResourceID], [ClassCustomizedColumns], [ClassCodeGenerationSettings], [ClassIconClass], [ClassURLPattern], [ClassUsesPageBuilder], [ClassIsNavigationItem], [ClassHasURL], [ClassHasMetadata], [ClassSearchIndexDataSource])
			VALUES ('Category class', 'CMS.CategoryClass', 0, 0, 1, '<?xml version="1.0" encoding="utf-8"?>
<xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
  <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:element name="CMS_CategoryClass">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="CategoryID" type="xs:int" />
              <xs:element name="ClassID" type="xs:int" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:choice>
    </xs:complexType>
    <xs:unique name="Constraint1" msdata:PrimaryKey="true">
      <xs:selector xpath=".//CMS_CategoryClass" />
      <xs:field xpath="CategoryID" />
      <xs:field xpath="ClassID" />
    </xs:unique>
  </xs:element>
</xs:schema>', '<form version="2"><field column="CategoryID" columntype="integer" guid="41d8a2dd-2e22-42af-8003-e4e890894afb" isPK="true" refobjtype="cms.category" reftype="Binding" system="true" /><field column="ClassID" columntype="integer" guid="fd310b57-89fc-4226-88fd-a390b92ed9af" refobjtype="cms.documenttype" reftype="Binding" system="true" /></form>', '', 'CMS_CategoryClass', NULL, 0, 0, 0, NULL, 0, NULL, getDate(), 'b8f715bf-914b-4c8c-82ab-cc82f26720b9', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '<search />', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd0901381-fa29-4e67-a846-3fddaf0e0c9c', NULL, 0, @classResourceID, NULL, '<Data><NameSpace>CMS</NameSpace></Data>', NULL, NULL, 0, 0, 0, 0, NULL)
		END
	END

	-- Create table [CMS_CategoryClass]
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'U' AND [object_id] = OBJECT_ID('CMS_CategoryClass'))
	BEGIN
		CREATE TABLE [CMS_CategoryClass]
		(
			[CategoryID] [int] NOT NULL,
			[ClassID] [int] NOT NULL
		) ON [PRIMARY];
		
		ALTER TABLE [CMS_CategoryClass] ADD 
		
		CONSTRAINT [FK_CMS_CategoryClass_CategoryID_CMS_Category] FOREIGN KEY([CategoryID])
			REFERENCES [CMS_Category] ([CategoryID]),
		
		CONSTRAINT [FK_CMS_CategoryClass_ClassID_CMS_Class] FOREIGN KEY([ClassID])
			REFERENCES [CMS_Class] ([ClassID]),

		CONSTRAINT [PK_CMS_CategoryClass] PRIMARY KEY CLUSTERED 
		(
			[CategoryID] ASC,
			[ClassID] ASC
		)
		
		CREATE NONCLUSTERED INDEX [IX_CMS_CategoryClass_ClassID]
			ON [CMS_CategoryClass] ([ClassID])
	END

END
GO

DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 142
BEGIN
	IF EXISTS (SELECT 1 FROM sys.Tables WHERE Name = N'CMS_WebFarmTask' AND Type = N'U')
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TaskDataIsJson' AND Object_ID = Object_ID(N'CMS_WebFarmTask'))
		BEGIN
			ALTER TABLE [CMS_WebFarmTask] ADD [TaskDataIsJson] BIT NOT NULL
				CONSTRAINT [DEFAULT_CMS_WebFarmTask_TaskDataIsJson] DEFAULT ((0))
			UPDATE CMS_Class
    			SET ClassFormDefinition = '<form version="2"><field column="TaskID" columntype="integer" guid="5e8df106-ca79-494f-bcf1-d0b016afbad9" isPK="true" system="true" visible="true"><properties><fieldcaption>TaskID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="TaskDataIsJson" columntype="boolean" guid="9c8c8dd3-1e9a-4e1e-ba00-a7d6eb7ac4d6" system="true"><properties><defaultvalue>False</defaultvalue></properties></field><field column="TaskType" columnsize="100" columntype="text" guid="8f272cff-24c4-48d6-8199-d96f0b3a4c49" system="true" visible="true"><properties><fieldcaption>TaskType</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field allowempty="true" column="TaskTextData" columntype="longtext" guid="35ac3782-f563-4df0-af7e-989db67a7ec7" system="true" visible="true"><properties><fieldcaption>TaskTextData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="TaskBinaryData" columntype="text" guid="93186034-dfa3-49ac-8d6c-3c7c503e088c" system="true" visible="true"><properties><fieldcaption>TaskBinaryData</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="TaskCreated" columnprecision="7" columntype="datetime" guid="2468f2df-6070-4941-82f0-04c1f9aa91d0" system="true" visible="true"><properties><fieldcaption>TaskCreated</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="TaskTarget" columntype="longtext" guid="92590b46-2f18-4de4-8a83-3e670dc72cce" system="true" visible="true"><properties><fieldcaption>TaskTarget</fieldcaption></properties><settings><controlname>HtmlAreaControl</controlname><Dialogs_Content_Hide>False</Dialogs_Content_Hide><HeightUnitType>PX</HeightUnitType><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAddStampButton>False</ShowAddStampButton><WidthUnitType>PX</WidthUnitType></settings></field><field allowempty="true" column="TaskMachineName" columntype="text" guid="0febed42-1c4f-4abe-86f8-b2cb7cf9a25e" system="true" visible="true"><properties><fieldcaption>TaskMachineName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field column="TaskGUID" columntype="guid" guid="9783e58c-39eb-43c8-ae5a-90f11a6797e5" system="true"><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="TaskIsAnonymous" columntype="boolean" guid="b90733f1-350f-4c90-a7f9-6ff237618cc2" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>TaskIsAnonymous</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="TaskIsMemory" columntype="boolean" guid="5c06dac7-1a11-4f31-9eb9-64283b850977" system="true"><properties><defaultvalue>false</defaultvalue></properties></field><field allowempty="true" column="TaskErrorMessage" columntype="longtext" guid="0ba49fe4-479a-4821-9785-dc1376e8a388" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field></form>',
    		    	ClassXmlSchema = '<?xml version="1.0" encoding="utf-8"?> <xs:schema id="NewDataSet" xmlns="" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">   <xs:element name="NewDataSet" msdata:IsDataSet="true" msdata:UseCurrentLocale="true">     <xs:complexType>       <xs:choice minOccurs="0" maxOccurs="unbounded">         <xs:element name="CMS_WebFarmTask">           <xs:complexType>             <xs:sequence>               <xs:element name="TaskID" msdata:ReadOnly="true" msdata:AutoIncrement="true" type="xs:int" />               <xs:element name="TaskType">                 <xs:simpleType>                   <xs:restriction base="xs:string">                     <xs:maxLength value="100" />                   </xs:restriction>                 </xs:simpleType>               </xs:element>               <xs:element name="TaskTextData" minOccurs="0">                 <xs:simpleType>                   <xs:restriction base="xs:string">                     <xs:maxLength value="2147483647" />                   </xs:restriction>                 </xs:simpleType>               </xs:element>               <xs:element name="TaskBinaryData" type="xs:base64Binary" minOccurs="0" />               <xs:element name="TaskCreated" type="xs:dateTime" minOccurs="0" />               <xs:element name="TaskTarget" minOccurs="0">                 <xs:simpleType>                   <xs:restriction base="xs:string">                     <xs:maxLength value="2147483647" />                   </xs:restriction>                 </xs:simpleType>               </xs:element>               <xs:element name="TaskMachineName" minOccurs="0">                 <xs:simpleType>                   <xs:restriction base="xs:string">                     <xs:maxLength value="450" />                   </xs:restriction>                 </xs:simpleType>               </xs:element>               <xs:element name="TaskGUID" msdata:DataType="System.Guid, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" type="xs:string" minOccurs="0" />               <xs:element name="TaskIsAnonymous" type="xs:boolean" minOccurs="0" />               <xs:element name="TaskErrorMessage" minOccurs="0">                 <xs:simpleType>                   <xs:restriction base="xs:string">                     <xs:maxLength value="2147483647" />                   </xs:restriction>                 </xs:simpleType>               </xs:element>               <xs:element name="TaskIsMemory" type="xs:boolean" minOccurs="0" />               <xs:element name="TaskDataIsJson" type="xs:boolean" />             </xs:sequence>           </xs:complexType>         </xs:element>       </xs:choice>     </xs:complexType>     <xs:unique name="Constraint1" msdata:PrimaryKey="true">       <xs:selector xpath=".//CMS_WebFarmTask" />       <xs:field xpath="TaskID" />     </xs:unique>   </xs:element> </xs:schema>'
    			WHERE ClassGUID = '44576EF8-A9B8-44E6-BA9D-4643F7DE17CF'
		END
	END	
END
GO

-- HF13-443
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 158
BEGIN
	IF EXISTS (SELECT 1 FROM [CMS_Query] WHERE QueryGUID = '10AC65B0-BBD4-446A-BADE-E03FBFDE2F5E')
	BEGIN
		UPDATE CMS_Query
		SET QueryText = 'DECLARE @NewPrefix VARCHAR(450);
DECLARE @OldLevel INT;
DECLARE @NewLevel INT;
SET @NewPrefix = (SELECT TOP 1 ##PATHCOLUMN## FROM ##TABLENAME## WHERE ##IDCOLUMN## = ##NEWPARENTID##); IF (@NewPrefix = ''/'')SET @NewPrefix = '''';
SET @OldLevel = (SELECT TOP 1 ##LEVELCOLUMN## FROM ##TABLENAME## WHERE ##IDCOLUMN## = ##OLDPARENTID##);
SET @NewLevel = (SELECT TOP 1 ##LEVELCOLUMN## FROM ##TABLENAME## WHERE ##IDCOLUMN## = ##NEWPARENTID##);

-- Update level
IF @UpdateLevel = 1 UPDATE ##TABLENAME## SET ##LEVELCOLUMN## = ##LEVELCOLUMN## - @OldLevel + ISNULL(@NewLevel, -1) + 1 WHERE ##PATHCOLUMN## LIKE ''##OLDPREFIX##%'' ##SITEWHERECONDITION##

-- Update path
UPDATE ##TABLENAME## SET ##PATHCOLUMN## = ISNULL(@NewPrefix, '''') + ''/'' + ''##CURRENTITEM##'' + SUBSTRING(##PATHCOLUMN##, LEN(''##OLDPREFIX##''), LEN(##PATHCOLUMN##)) WHERE ##PATHCOLUMN## LIKE ''##OLDPREFIX##%'' ##SITEWHERECONDITION##'
		WHERE QueryGUID = '10AC65B0-BBD4-446A-BADE-E03FBFDE2F5E'
	END
END
GO

-- HF13-449
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 160
BEGIN

INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
VALUES ('ecommerce.shippingoption',
        '<form version="2"><field column="ShippingOptionID" columntype="integer" guid="dc7a8f97-f1cb-4517-8031-489213a2445d" isPK="true" system="true"><properties><fieldcaption>ShippingOptionID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="com.ui.configurationshippingoptionsgeneral"><properties><caption>{$com.ui.configurationshippingoptionsgeneral$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionCarrierID" columntype="integer" guid="44289ffa-5e1a-4b40-8def-bcbf4c392fd5" system="true" visible="true"><properties><enabledmacro ismacro="true">{%EditedObject.ID == 0|(user)administrator|(hash)79f1b87e442f42ca74111ddcef0434280676da2605b0a19528a7b6cc2016916d%}</enabledmacro><fieldcaption>{$com.shippingoption.carrier$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% HTMLEncode(EditedObject.ShippingOptionCarrier.CarrierDisplayName) |(identity)GlobalAdministrator|(hash)53d0b4b0e30df1741a952c2a5ecc0e5d890f32c5a20afb088088c1aa8a0dbe4d%}</OutputFormat></settings></field><field allowempty="true" column="ShippingOptionCarrierServiceName" columnsize="200" columntype="text" guid="b38ed66d-cba3-4b19-93f4-169fd5d82ec5" system="true" visible="true"><properties><fieldcaption>{$com.carrier.service$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% EditedObject.ShippingOptionServiceDisplayName |(user)administrator|(hash)93b15fb454d2ad4a639ae38bc178eed2c34ee3df08423287bbb28ce84663b299%}</OutputFormat></settings></field><field column="ShippingOptionDisplayName" columnsize="200" columntype="text" guid="765b2b6e-52b1-41c9-ab12-ec94b3ef6ad7" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>The shipping option name displayed to the users on the live site and in the administration interface.</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="ShippingOptionName" columnsize="200" columntype="text" guid="9804163e-683a-4f71-91ed-d2b81643f483" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><controlname>codename</controlname><RequireIdentifier>False</RequireIdentifier></settings></field><field allowempty="true" column="ShippingOptionTaxClassID" columntype="integer" guid="7d267933-0d0e-443b-80f8-54cf64ecd8a4" system="true" visible="true"><properties><fieldcaption>Tax class</fieldcaption></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>True</AllowEmpty><controlname>Uni_selector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><LocalizeItems>True</LocalizeItems><ObjectType>ecommerce.taxclass</ObjectType><RemoveMultipleCommas>False</RemoveMultipleCommas><ResourcePrefix>taxselect</ResourcePrefix><ReturnColumnType>id</ReturnColumnType><SelectionMode>1</SelectionMode><ValuesSeparator>;</ValuesSeparator><WhereCondition ismacro="true">{%GetShippingOptionTaxClassSelectorWhereCondition(EditedObject)%}</WhereCondition></settings></field><field column="ShippingOptionEnabled" columntype="boolean" guid="0fe5eaa7-6d54-4c76-90c5-376b35a11f9d" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>Indicates if the shipping option can be used in your on-line store.</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field><category name="com.shippingoption.additional"><properties><caption>{$com.shippingoption.additional$}</caption><collapsedbydefault>true</collapsedbydefault><collapsible>true</collapsible><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionDescription" columntype="longtext" guid="0b53df7f-bcc9-49a4-8fcc-946b90068ca6" system="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>Description that can be displayed on the live site.</fielddescription></properties><settings><controlname>localizabletextarea</controlname></settings></field><field allowempty="true" column="ShippingOptionThumbnailGUID" columntype="guid" guid="d2799e66-8102-4569-ba53-a826837785e5" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption><fielddescription>{$com.shippingoptionimage.description$}</fielddescription></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field allowempty="true" column="ShippingOptionSiteID" columntype="integer" guid="fd1414cc-26d1-4d35-8dfe-6d6c0edf3a92" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionGUID" columntype="file" guid="18dd26bf-7cc3-4d53-9cd4-b3cb5df860da" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionLastModified" columntype="datetime" guid="949f7f46-fd67-4cc3-8942-77064b1924cf" system="true"><properties><fieldcaption>ShippingOptionLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field></form>',
        0);

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = ('<form version="2"><field column="ShippingOptionID" columntype="integer" guid="dc7a8f97-f1cb-4517-8031-489213a2445d" isPK="true" system="true"><properties><fieldcaption>ShippingOptionID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="com.ui.configurationshippingoptionsgeneral"><properties><caption>{$com.ui.configurationshippingoptionsgeneral$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionCarrierID" columntype="integer" guid="44289ffa-5e1a-4b40-8def-bcbf4c392fd5" system="true" visible="true"><properties><enabledmacro ismacro="true">{%EditedObject.ID == 0|(user)administrator|(hash)79f1b87e442f42ca74111ddcef0434280676da2605b0a19528a7b6cc2016916d%}</enabledmacro><fieldcaption>{$com.shippingoption.carrier$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% HTMLEncode(EditedObject.ShippingOptionCarrier.CarrierDisplayName) |(identity)GlobalAdministrator|(hash)53d0b4b0e30df1741a952c2a5ecc0e5d890f32c5a20afb088088c1aa8a0dbe4d%}</OutputFormat></settings></field><field allowempty="true" column="ShippingOptionCarrierServiceName" columnsize="200" columntype="text" guid="b38ed66d-cba3-4b19-93f4-169fd5d82ec5" system="true" visible="true"><properties><fieldcaption>{$com.carrier.service$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% EditedObject.ShippingOptionServiceDisplayName |(user)administrator|(hash)93b15fb454d2ad4a639ae38bc178eed2c34ee3df08423287bbb28ce84663b299%}</OutputFormat></settings></field><field column="ShippingOptionDisplayName" columnsize="200" columntype="text" guid="765b2b6e-52b1-41c9-ab12-ec94b3ef6ad7" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>The shipping option name displayed to the users on the live site and in the administration interface.</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="ShippingOptionName" columnsize="200" columntype="text" guid="9804163e-683a-4f71-91ed-d2b81643f483" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><controlname>codename</controlname><RequireIdentifier>False</RequireIdentifier></settings></field><field allowempty="true" column="ShippingOptionTaxClassID" columntype="integer" guid="7d267933-0d0e-443b-80f8-54cf64ecd8a4" system="true" visible="true"><properties><fieldcaption>Tax class</fieldcaption></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>True</AllowEmpty><controlname>Uni_selector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><LocalizeItems>True</LocalizeItems><ObjectType>ecommerce.taxclass</ObjectType><RemoveMultipleCommas>False</RemoveMultipleCommas><ResourcePrefix>taxselect</ResourcePrefix><ReturnColumnType>id</ReturnColumnType><SelectionMode>1</SelectionMode><ValuesSeparator>;</ValuesSeparator><WhereCondition ismacro="true">{%GetShippingOptionTaxClassSelectorWhereCondition(EditedObject)%}</WhereCondition></settings></field><field column="ShippingOptionEnabled" columntype="boolean" guid="0fe5eaa7-6d54-4c76-90c5-376b35a11f9d" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>Indicates if the shipping option can be used in your on-line store.</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field><category name="com.shippingoption.additional"><properties><caption>{$com.shippingoption.additional$}</caption><collapsedbydefault>true</collapsedbydefault><collapsible>true</collapsible><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionDescription" columntype="longtext" guid="0b53df7f-bcc9-49a4-8fcc-946b90068ca6" system="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>Description that can be displayed on the live site.</fielddescription></properties><settings><controlname>localizabletextarea</controlname></settings></field><field allowempty="true" column="ShippingOptionThumbnailGUID" columntype="guid" guid="d2799e66-8102-4569-ba53-a826837785e5" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption><fielddescription>{$com.shippingoptionimage.description$}</fielddescription></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field allowempty="true" column="ShippingOptionSiteID" columntype="integer" guid="fd1414cc-26d1-4d35-8dfe-6d6c0edf3a92" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionGUID" columntype="file" guid="18dd26bf-7cc3-4d53-9cd4-b3cb5df860da" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionLastModified" columntype="datetime" guid="949f7f46-fd67-4cc3-8942-77064b1924cf" system="true"><properties><fieldcaption>ShippingOptionLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field></form>')
	WHERE ClassName = 'ecommerce.shippingoption';
END

END
GO

-- HF13-444
-- HF13-459
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 165
BEGIN
	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[Media_Library]') AND name = 'LibraryUseDirectPathForContent')
	BEGIN
		ALTER TABLE [Media_Library] ADD [LibraryUseDirectPathForContent] [bit] NULL;
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_Category]') AND name = 'CategoryAllowAllTypes')
	BEGIN
		ALTER TABLE [CMS_Category] ADD [CategoryAllowAllTypes] [bit] NOT NULL 
		CONSTRAINT [DEFAULT_CMS_Category_CategoryAllowAllTypes]  DEFAULT ((1))
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_Document]') AND name = 'DocumentUnpublishedRedirectUrl')
	BEGIN
		ALTER TABLE [CMS_Document] ADD [DocumentUnpublishedRedirectUrl] NVARCHAR(450) NULL
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[View_CMS_Tree_Joined]') AND name = 'DocumentUnpublishedRedirectUrl')
	BEGIN
		DECLARE @TREEJOINEDVIEW NVARCHAR(MAX);
		SET @TREEJOINEDVIEW = OBJECT_DEFINITION (OBJECT_ID(N'View_CMS_Tree_Joined')); 
		SET @TREEJOINEDVIEW = REPLACE(@TREEJOINEDVIEW, 'CREATE ', 'ALTER ');
		SET @TREEJOINEDVIEW = REPLACE(@TREEJOINEDVIEW, 'FROM ', ', D.[DocumentUnpublishedRedirectUrl] FROM ');

		EXECUTE(@TREEJOINEDVIEW);
	END

	IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'View_CMS_Tree_Joined') AND name = 'IX_View_CMS_Tree_Joined_NodeSiteID_DocumentCulture_NodeID')
	BEGIN
		CREATE UNIQUE CLUSTERED INDEX [IX_View_CMS_Tree_Joined_NodeSiteID_DocumentCulture_NodeID] ON [View_CMS_Tree_Joined]
		(
			[NodeSiteID] ASC,
			[DocumentCulture] ASC,
			[NodeID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
	END
	
	IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'View_CMS_Tree_Joined') AND name = 'IX_View_CMS_Tree_Joined_ClassName_NodeSiteID_DocumentForeignKeyValue_DocumentCulture')
	BEGIN
		CREATE NONCLUSTERED INDEX [IX_View_CMS_Tree_Joined_ClassName_NodeSiteID_DocumentForeignKeyValue_DocumentCulture] ON [View_CMS_Tree_Joined]
		(
			[ClassName] ASC,
			[NodeSiteID] ASC,
			[DocumentForeignKeyValue] ASC,
			[DocumentCulture] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_SMTPServer]') AND name = 'ServerOAuthCredentials')
	BEGIN
		ALTER TABLE [CMS_SMTPServer] ADD [ServerOAuthCredentials] UNIQUEIDENTIFIER NULL
	END

	IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[CMS_SMTPServer]') AND name = 'ServerAuthenticationType')
	BEGIN
		ALTER TABLE [CMS_SMTPServer] ADD [ServerAuthenticationType] NVARCHAR(50) NULL
		ALTER TABLE [CMS_SMTPServer] ADD  CONSTRAINT [DEFAULT_CMS_SMTPServer_ServerAuthenticationType]  DEFAULT (N'basic') FOR [ServerAuthenticationType]
	END

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('media.library',
			'<form version="2"><field column="LibraryID" columntype="integer" guid="00fdb6b0-5f2e-4ef9-8648-1d3c7af8b721" isPK="true" system="true"><properties><fieldcaption>LibraryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="LibraryDisplayName" columnsize="250" columntype="text" guid="9b4aa82c-02df-4712-a5b9-3b9dee377b45" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$medialibrary.librarydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="LibraryName" columnsize="250" columntype="text" guid="e4081abf-652e-47bd-82d0-313752f01873" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$medialibrary.libraryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="LibraryDescription" columntype="longtext" guid="ac965989-ec7a-446f-81bb-ccb5043abf0b" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$medialibrary.librarydescription.description$}</fielddescription></properties><settings><controlname>LocalizableTextArea</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="LibraryTeaserGUID" columntype="guid" guid="1cf86270-1d15-4a07-a3fb-4d97ba972c46" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field column="LibraryFolder" columnsize="250" columntype="text" guid="06f6b6a9-08ca-4735-8732-20cc75d11802" system="true" visible="true"><properties><enabledmacro ismacro="true">{%FormMode == FormModeEnum.Insert|(user)administrator|(hash)0a89b968eb862d72bdc749e4095716028feb4b47d8cca3d195452ef627679385%}</enabledmacro><fieldcaption>{$general.foldername$}</fieldcaption><fielddescription>{$medialibrary.libraryfolder.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryAccess" columntype="integer" guid="720d2865-0be4-43d3-8ed8-412b269b1d00" system="true"><properties><fieldcaption>LibraryAccess</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="LibrarySiteID" columntype="integer" guid="99746a1e-3514-4c13-b878-7bb7b39ddb3d" system="true"><properties><defaultvalue ismacro="true">{%CurrentSite.SiteID|(user)administrator|(hash)f1f36b57555be68f4a774a617ef7f4b296d321c24bd971a578ae7443c86b1480%}</defaultvalue><fieldcaption>LibrarySiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryGUID" columntype="guid" guid="512c11dd-a325-4bf2-b1be-4f7c54397132" system="true"><properties><fieldcaption>LibraryGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="LibraryLastModified" columntype="datetime" guid="54f9c352-5ac2-4e4b-ab98-65d41240e9e4" system="true"><properties><fieldcaption>LibraryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="LibraryTeaserPath" columnsize="450" columntype="text" guid="5de9f8d9-3e2d-4d83-8a63-6c2bdfb76629" system="true"><properties><fieldcaption>LibraryTeaserPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="LibraryUseDirectPathForContent" columntype="boolean" guid="b84913d8-82f6-438e-abc2-f6e6c7e9e7b2" system="true" visible="true"><properties><fieldcaption>{$medialibrary.libraryusedirectpathforcontent.name$}</fieldcaption><fielddescription>{$medialibrary.libraryusedirectpathforcontent.description$}</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
			0);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('newsletter.emailtemplate.EditTemplateCode',
		'<form version="2"><field column="TemplateID" guid="1fc8d3e4-5b6f-4a8b-9266-42cfdd739d2d" /><field column="TemplateDisplayName" guid="d3505546-d312-4dda-aacc-cf1dfcb7bab3" visible="" /><field column="TemplateName" guid="d138a78c-5095-4778-a5a1-6c0e9d9c226e" visible="" /><field column="TemplateDescription" guid="96044a64-f381-440a-b613-673b845278a5" visible="" /><field column="TemplateInlineCSS" guid="8208c709-9f19-487e-b0a7-eb912316b1dd" visible="" /><field column="TemplateThumbnailGUID" guid="0f72ba1b-8b84-44a8-85a6-27107135071d" /><field column="TemplateIconClass" guid="b885071c-c113-44f1-8a94-d77a2f019cd9" /><field column="TemplateCode" guid="55b5079a-5163-4606-baeb-40e59c8f8aae" visible="true"><settings><AutoSize>False</AutoSize><controlname>MacroEditor</controlname><EnablePositionMember>False</EnablePositionMember><EnableSections>False</EnableSections><EnableViewState>False</EnableViewState><Height>600</Height><Language>7</Language><ResolverName ismacro="true">{%
if (TemplateType == "I") /* using I as email Issue, this is defined in EmailTemplateTypeEnum */
{ "NewsletterResolver" }
else
{ "NewsletterConfirmationResolver" }
|(identity)GlobalAdministrator|(hash)7c7c10639461cfc02ce1352aaf617fc835cae60a9df72d7d6b97d8b2d220fe8b%}</ResolverName><ShowBookmarks>False</ShowBookmarks><ShowLineNumbers>True</ShowLineNumbers><SingleLineMode>False</SingleLineMode><SingleMacroMode>False</SingleMacroMode><SupportPasteImages>False</SupportPasteImages><Width>100%</Width></settings></field><field column="TemplateSiteID" guid="e8548e32-9ba1-4093-b00e-b6ab09d374e2" /><field column="TemplateType" guid="721c9b4a-60e2-4e9e-beef-8ca0e5612a89" visible="" /><field column="TemplateGUID" guid="4bf16188-eaa3-4b2a-bc44-897706226bae" /><field column="TemplateLastModified" guid="951b6ddb-4c52-4d94-a7dd-601f67b3658c" /><field column="TemplateSubject" guid="0eaddd8f-5a59-4873-afb1-80a7156918a6" /></form>',
		1);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.SearchIndex',
		'<form version="2"><field column="IndexID" columntype="integer" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isPK="true" system="true"><properties><fieldcaption>IndexID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="General.General"><properties><caption>{$General.General$}</caption><visible>true</visible></properties></category><field column="IndexProvider" columnsize="200" columntype="text" guid="4584a254-c55a-433f-957f-ca3420494258" system="true" /><field allowempty="true" column="IndexSearchServiceName" columnsize="200" columntype="text" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" system="true" /><field allowempty="true" column="IndexAdminKey" columnsize="200" columntype="text" guid="5a148650-ff4b-48a5-8118-d9c748c93284" system="true" /><field allowempty="true" column="IndexQueryKey" columnsize="200" columntype="text" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" system="true" /><field column="IndexDisplayName" columnsize="200" columntype="text" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$general.displayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="IndexName" columnsize="200" columntype="text" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$general.codename.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field column="IndexType" columnsize="200" columntype="text" guid="e196f557-21ab-4b65-8977-d5b14d33d333" system="true" visible="true"><properties><fieldcaption>{$srch.index.type$}</fieldcaption><fielddescription>{$srch.index.type.description$}</fielddescription></properties><settings><controlname>searchindextypeselector</controlname></settings></field><field allowempty="true" column="IndexAnalyzerType" columnsize="200" columntype="text" guid="38f0655c-0b92-4436-915f-8a2545ee548a" hasdependingfields="true" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$srch.index.analyzer$}</fieldcaption><fielddescription>{$srch.index.analyzer.description$}</fielddescription></properties><settings><AssemblyName>CMS.DataEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.DataEngine.SearchAnalyzerTypeEnum</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="IndexSettings" columntype="longtext" guid="6baa44c0-892e-4136-be2e-2e625347981f" system="true"><properties><fieldcaption>IndexSettings</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea></settings></field><field column="IndexGUID" columntype="guid" guid="7b121874-5f4d-44e1-a652-26273df5f674" system="true"><properties><fieldcaption>IndexGUID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="IndexLastModified" columntype="datetime" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" system="true"><properties><fieldcaption>IndexLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexLastRebuildTime" columntype="datetime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" system="true"><properties><fieldcaption>IndexLastRebuildTime</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>False</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="IndexStopWordsFile" columnsize="200" columntype="text" dependsonanotherfield="true" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.stopwords$}</fieldcaption><fielddescription>{$srch.index.stopwords.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "standard" || IndexAnalyzerType.ToString() == "stop" || IndexAnalyzerType.ToString() == "stopwithstemming"|(identity)GlobalAdministrator|(hash)fc113d0920d58431700eb23adac2227dd44428bdf2f3da7800fd38112b2acff5%}</visiblemacro></properties><settings><controlname>stopwordsselector</controlname></settings></field><field allowempty="true" column="IndexCustomAnalyzerAssemblyName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" system="true" visible="true"><properties><fieldcaption>{$srch.index.customanalyzerassembly$}</fieldcaption><fielddescription>{$srch.index.customanalyzerassembly.description$}</fielddescription><visiblemacro ismacro="true">{%IndexAnalyzerType.ToString() == "custom"|(identity)GlobalAdministrator|(hash)6af80669e60a5a07a3a044b1c845be4b6257f46c44284b860b5a0cf09c22a01b%}</visiblemacro></properties><settings><BaseClassName>Lucene.Net.Analysis.Analyzer, Lucene.Net ; Lucene.Net.Analysis.Analyzer, Lucene.Net.v3</BaseClassName><ClassNameColumnName>IndexCustomAnalyzerClassName</ClassNameColumnName><controlname>assemblyclassselector</controlname><ShowClasses>True</ShowClasses><ShowEnumerations>False</ShowEnumerations><ShowInterfaces>False</ShowInterfaces><ValidateAssembly>True</ValidateAssembly></settings></field><field allowempty="true" column="IndexCustomAnalyzerClassName" columnsize="200" columntype="text" dependsonanotherfield="true" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" spellcheck="false" system="true"><properties><fieldcaption>Class name</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="IndexBatchSize" columntype="integer" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" system="true" visible="true"><properties><controlcssclass>DropDownFieldSmall</controlcssclass><fieldcaption>{$srch.index.batchsize$}</fieldcaption><fielddescription>{$srch.index.batchsize.description$}</fielddescription></properties><settings><controlname>dropdownlistcontrol</controlname><EditText>True</EditText><Options>100;100
500;500
1000;1000
5000;5000
10000;10000
50000;50000
100000;100000</Options><SortItems>False</SortItems></settings></field><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="mainform" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Insert|(identity)GlobalAdministrator|(hash)6da73e7e4232a90c342ee49067cdad67d10d7865620d90fd7aecb68edba902be%}</visiblemacro></properties><settings><controlname>AssignToSite</controlname></settings></field><field allowempty="true" column="IndexCrawlerUser" columnsize="200" columntype="text" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" system="true" /><field allowempty="true" column="IndexStatus" columnsize="10" columntype="text" guid="4dee1752-a984-4385-b1e0-0187a0289441" system="true"><settings><controlname>checkboxlistcontrol</controlname></settings></field><field allowempty="true" column="IndexIsOutdated" columntype="boolean" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" system="true" /><field allowempty="true" column="IndexLastUpdate" columntype="datetime" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field></form>',
		0),
		('cms.SearchIndex.EditForm',
		'<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" /><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" /><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" /><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" /><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333"><settings><controlname>labelcontrol</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}


</OutputFormat></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc"><properties><controlcssclass>TextBoxFieldSmall</controlcssclass></properties></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" /></form>',
		1),
		('cms.SearchIndex.EditAzureSearchIndexForm',
		'<form version="2"><field column="IndexID" guid="11a12bb8-8daa-4d81-a93d-18b6ee6dd7fe" isunique="true" /><field column="IndexDisplayName" guid="f6062f9f-ddcb-432b-aa26-3eb19bec2136" order="2" /><field column="IndexName" guid="1e61111e-be57-4ed5-bf42-5a831ef74e02" order="3"><settings><RequireIdentifier>False</RequireIdentifier></settings><properties><enabledmacro ismacro="true">{%false%}</enabledmacro><fielddescription>{$srch.azure.name.description$}</fielddescription></properties></field><field column="IndexType" guid="e196f557-21ab-4b65-8977-d5b14d33d333" order="4"><settings><controlname>LabelControl</controlname><OutputFormat>{% GetResourceString("smartsearch.indextype." + IndexType.ToString()); |(identity)GlobalAdministrator|(hash)0949eb473c423b41d6b932a46debe92e8a2994da311fe63fbd2ba767ccd69c33%}</OutputFormat><ResolveMacros>True</ResolveMacros></settings></field><field column="IndexAnalyzerType" guid="38f0655c-0b92-4436-915f-8a2545ee548a" visible="" order="5" /><field column="IndexProvider" guid="4584a254-c55a-433f-957f-ca3420494258" order="6" /><field column="IndexSettings" guid="6baa44c0-892e-4136-be2e-2e625347981f" order="7" /><field column="IndexGUID" guid="7b121874-5f4d-44e1-a652-26273df5f674" order="8" /><field column="IndexLastModified" guid="f52606a9-543c-4554-98c5-c1a3680ef7ee" order="9" /><field column="IndexLastRebuildTime" guid="5a4a4036-c437-41ce-b2f7-2c1e5bf7eff1" order="10" /><field column="IndexStopWordsFile" guid="16b06aff-63dc-4a32-8f0e-99bff88a0cf3" order="11" /><field column="IndexCustomAnalyzerAssemblyName" guid="ee4cca86-033f-4e43-aa34-b969f8114ade" order="12" /><field column="IndexCustomAnalyzerClassName" guid="0cee35a9-e0bc-4ab8-98b5-391e67e1ee16" order="13" /><field column="IndexBatchSize" guid="869750fe-25c4-476c-b614-cb3aa1c6f5cc" order="14"><settings><controlname>DropDownListControl</controlname><DisplayActualValueAsItem>False</DisplayActualValueAsItem><Options>100
500
1000</Options></settings></field><field column="AssignToSite" guid="7e3c10ca-3f2e-4392-beaa-bd409c4601a5" order="15" /><field column="IndexCrawlerUser" guid="b623c978-b5b6-41c6-8746-33446b9eca5f" visible="true" order="16"><settings><controlname>UserNameSelector</controlname></settings><properties><fieldcaption>{$srch.index.user$}</fieldcaption><fielddescription>{$srch.index.user.description$}</fielddescription><visiblemacro ismacro="true">{%IndexType == "cms.document"|(identity)GlobalAdministrator|(hash)46a00ea11817be7df6082b6b95c8f126a82755ead352b75f0abe01dc9b624ff9%}</visiblemacro></properties></field><category dummy="true" name="srch.azure.searchserviceapikeys" order="17"><properties><caption>{$srch.azure.searchservicesettings$}</caption><visible>True</visible></properties></category><field column="IndexSearchServiceName" guid="7a3e2eef-b4bf-4750-8133-f5cd93652acf" visible="true" allowempty="" order="18"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.servicename$}</fieldcaption><fielddescription>{$srch.azure.servicename.description$}</fielddescription></properties></field><field column="IndexAdminKey" guid="5a148650-ff4b-48a5-8118-d9c748c93284" visible="true" allowempty="" order="19"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.adminkey$}</fieldcaption><fielddescription>{$srch.azure.adminkey.description$}</fielddescription></properties></field><field column="IndexQueryKey" guid="5f5c6c0c-e170-44b4-9186-6b01e0bb5ade" visible="true" order="20"><settings><controlname>TextBoxControl</controlname></settings><properties><fieldcaption>{$srch.azure.querykey$}</fieldcaption><fielddescription>{$srch.azure.querykey.description$}</fielddescription></properties></field><field column="IndexStatus" guid="4dee1752-a984-4385-b1e0-0187a0289441" order="21" /><field column="IndexIsOutdated" guid="30e045d9-7386-4ea0-a520-f6474e0d6e32" order="22" /><field column="IndexLastUpdate" guid="c83cc5f6-0453-47da-9550-9b147156d1fd" order="23" /></form>',
		1);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('CMS.SMTPServer',
			'<form version="2"><field column="ServerID" columntype="integer" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" isPK="true" system="true"><properties><fieldcaption>ServerID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="general.general"><properties><caption>{$general.general$}</caption><visible>True</visible></properties></category><field column="ServerName" columnsize="200" columntype="text" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.servernamelabel$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerPriority" columntype="integer" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$general.priority$}</fieldcaption></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>enumselector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerPriorityEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field column="ServerEnabled" columntype="boolean" guid="0b471c96-3f09-480e-92fa-d110d7602889" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><category name="general.advanced"><properties><caption>{$general.advanced$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ServerDeliveryMethod" columntype="integer" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>0</defaultvalue><fieldcaption>{$smtpserver.deliverymethod$}</fieldcaption><fielddescription>{$smtpserver.deliverymethoddesc$}</fielddescription><visiblemacro ismacro="true">{%!SystemContext.IsRunningOnAzure|(user)administrator|(hash)79ffbfda7c068c14fe46d3f7bd4af6714a5fc0fe547a40b7abca66cfe0a8a520%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>0</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.SMTPServerDeliveryEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation></settings></field><field allowempty="true" column="ServerUserName" columnsize="50" columntype="text" dependsonanotherfield="true" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver_edit.serverusernamelabel$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(user)administrator|(hash)167ca82a36c88bd86472080d819d74489fb458294ed0411429fe1593f3bb1db9%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerAuthenticationType" columnsize="50" columntype="text" dependsonanotherfield="true" guid="040826ee-b601-4d84-b38d-aad86453fda2" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>basic</defaultvalue><fieldcaption>{$smtpserver.authenticationtype$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0|(identity)GlobalAdministrator|(hash)df6a2c4ebc3b089135fda42c6c1b45ab32a1acbe2f55a59e59fa2626604de4a2%}</visiblemacro></properties><settings><AssemblyName>CMS.EmailEngine</AssemblyName><controlname>EnumSelector</controlname><DisplayType>1</DisplayType><Sort>False</Sort><TypeName>CMS.EmailEngine.EmailServerAuthenticationType</TypeName><UseStringRepresentation>True</UseStringRepresentation></settings></field><field allowempty="true" column="ServerPassword" columnsize="200" columntype="text" dependsonanotherfield="true" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$general.password$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "basic"|(identity)GlobalAdministrator|(hash)4e9a505cbbdcb52e6aa8d72cbd23fb4361b61a0349055b76429817519b098a78%}</visiblemacro></properties><settings><controlname>encryptedpassword</controlname></settings></field><field allowempty="true" column="ServerOAuthCredentials" columntype="guid" dependsonanotherfield="true" guid="c13da517-d1c4-41a5-8247-978889d1f18c" system="true" visible="true"><properties><fieldcaption>{$smtpserver.oauthcredentials$}</fieldcaption><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 0 &amp;&amp; ServerAuthenticationType == "oauth"|(identity)GlobalAdministrator|(hash)662f45908b21f07226527d008208464ef378aa298d87045d31cdd1143689747b%}</visiblemacro></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>False</AllowEmpty><controlname>EmailOAuthCredentialsSelector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><DisplayNameFormat>{%EmailOAuthCredentialsDisplayName%} ({%EmailOAuthCredentialsProviderClass%})</DisplayNameFormat><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowOpenInFullscreen>False</EditDialogWindowOpenInFullscreen><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><ItemsPerPage>25</ItemsPerPage><LocalizeItems>True</LocalizeItems><MaxDisplayedItems>25</MaxDisplayedItems><MaxDisplayedTotalItems>50</MaxDisplayedTotalItems><OrderBy>EmailOAuthCredentialsProviderClass, EmailOAuthCredentialsDisplayName</OrderBy><RemoveMultipleCommas>False</RemoveMultipleCommas><ReturnColumnName>EmailOAuthCredentialsGUID</ReturnColumnName><ReturnColumnType>id</ReturnColumnType><SelectionMode>0</SelectionMode><UseDefaultNameFilter>True</UseDefaultNameFilter><ValuesSeparator>;</ValuesSeparator></settings></field><field column="ServerUseSSL" columntype="boolean" guid="73f0a42d-78ad-4d62-981a-403f29295f56" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$system_email.ssl$}</fieldcaption><visiblemacro ismacro="true">{%false%}</visiblemacro></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="ServerPickupDirectory" columnsize="450" columntype="text" dependsonanotherfield="true" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" spellcheck="false" system="true" visible="true"><properties><fieldcaption>{$smtpserver.pickupdirectory$}</fieldcaption><fielddescription>{$smtpserver.pickupdirectorydesc$}</fielddescription><visiblemacro ismacro="true">{%ServerDeliveryMethod.Value == 1|(user)administrator|(hash)c96fbc172b7bf9448dbf0efcb3751a84ce16eead8351ed95024334c628d621bc%}</visiblemacro></properties><settings><AllowManage>False</AllowManage><controlname>filesystemselector</controlname><ShowFolders>True</ShowFolders></settings></field><field column="ServerIsGlobal" columntype="boolean" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" system="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>{$general.isglobal$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ServerGUID" columntype="guid" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="ServerLastModified" columntype="datetime" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field></form>',
			0),
			('CMS.SMTPServer.Insert',
			'<form version="2"><field column="ServerID" guid="c331e619-6707-4b28-83f5-0dc06ab3b1fc" /><field column="ServerName" guid="378adb50-4930-4f66-bab8-ed5b9663ea8a" /><field column="ServerPriority" guid="85b25e3a-728f-4583-bc16-cdf1f30cf7f1" /><field allowempty="true" column="AssignToSite" columntype="boolean" dummy="altform" guid="7451f4aa-1b8a-4d79-909b-581f2409956b" system="true" visible="true" order="4"><properties><defaultvalue>true</defaultvalue></properties><settings><controlname>AssignToSite</controlname></settings></field><field column="ServerEnabled" guid="0b471c96-3f09-480e-92fa-d110d7602889" visible="" order="5"><settings><controlname /></settings></field><category name="general.advanced" order="6" /><field column="ServerDeliveryMethod" guid="5e3d28f6-23ed-484c-9519-d71c84c6a313" order="7" /><field column="ServerUserName" guid="e2eea375-809a-4875-b70f-4275d4d6ac63" order="8" /><field column="ServerAuthenticationType" guid="040826ee-b601-4d84-b38d-aad86453fda2" order="9" /><field column="ServerPassword" guid="3e6aa6f0-4b4c-4ddd-8ef3-5266c26c8b4b" order="10" /><field column="ServerOAuthCredentials" guid="c13da517-d1c4-41a5-8247-978889d1f18c" order="11" /><field column="ServerUseSSL" guid="73f0a42d-78ad-4d62-981a-403f29295f56" order="12" /><field column="ServerPickupDirectory" guid="d2ad7ad5-69c1-4be3-9a8f-e02493778a94" order="13" /><field column="ServerIsGlobal" guid="274aa6e5-bdb1-4fa8-ac44-0c817c89a832" order="14" /><field column="ServerGUID" guid="e8d4e762-d3a1-4937-9e92-878fc56d141d" order="15" /><field column="ServerLastModified" guid="6be76690-b010-4c8b-ad84-8a8d76e62602" order="16" /></form>',
			1)

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.document',
        '<form version="2"><field column="DocumentID" columntype="integer" guid="04c53ea8-89c6-45fe-b9f8-11c869742937" isPK="true" system="true" visible="true"><properties><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentGUID" columntype="guid" guid="b0dc7e57-96dd-4e5b-829a-4ba9bd84ac0f" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field column="DocumentName" columnsize="100" columntype="text" guid="1e0f27f5-f59a-4fa1-871f-5c2d946453ca" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedWhen" columntype="datetime" guid="d86fd91f-9650-459d-a6a9-f101ec936cdf" system="true" visible="true"><properties><fieldcaption>DocumentModifiedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedByUserID" columntype="integer" guid="3db3f1c9-02b4-4d37-abd5-1298a9068ac1" system="true" visible="true"><properties><fieldcaption>DocumentModifiedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentForeignKeyValue" columntype="integer" guid="1ab4dfd9-6e8c-4b4d-9526-528890bc9c47" system="true" visible="true"><properties><fieldcaption>DocumentForeignKeyValue</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedByUserID" columntype="integer" guid="89690d5f-2c54-4788-8926-b38692719e0e" system="true" visible="true"><properties><fieldcaption>DocumentCreatedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedWhen" columntype="datetime" guid="82f0e9c1-9dfa-42a1-9b4a-a0090bbfad73" system="true" visible="true"><properties><fieldcaption>DocumentCreatedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutByUserID" columntype="integer" guid="d561f437-cf47-4681-a94e-085d9632b926" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutWhen" columntype="datetime" guid="65160c58-f425-4370-baf6-b47dc987611d" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutVersionHistoryID" columntype="integer" guid="31bf940c-d22c-4bf8-a430-776b6d4488c7" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishedVersionHistoryID" columntype="integer" guid="8229ebd2-c4d2-43bd-82e9-ae9af6146c97" system="true" visible="true"><properties><fieldcaption>DocumentPublishedVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowStepID" columntype="integer" guid="b7238cf1-94ac-4c59-87f4-f472f78245b2" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowStepID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishFrom" columntype="datetime" guid="5998e7fe-a503-4c5a-8711-9a4cbe77d8a3" system="true" visible="true"><properties><fieldcaption>DocumentPublishFrom</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishTo" columntype="datetime" guid="75b22166-d757-485f-901a-6636cabe930e" system="true" visible="true"><properties><fieldcaption>DocumentPublishTo</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentUnpublishedRedirectUrl" columnsize="450" columntype="text" guid="5112f255-bc7d-42b2-b24a-a9008ba2564d" system="true"><properties><fieldcaption>DocumentUnpublishedRedirectUrl</fieldcaption></properties><settings><controlname>URLSelector</controlname></settings></field><field column="DocumentCulture" columnsize="50" columntype="text" guid="e123ee40-049c-48b6-9dd8-a51b1e7da6b1" system="true" visible="true"><properties><fieldcaption>DocumentCulture</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field column="DocumentNodeID" columntype="integer" guid="3bc79b36-ba8f-4fea-85a4-c72fdbc315d2" system="true" visible="true"><properties><fieldcaption>DocumentNodeID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPageTitle" columntype="longtext" guid="a2df3057-5b8d-481b-9247-88b970c57a0b" system="true" visible="true"><properties><fieldcaption>DocumentPageTitle</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageKeyWords" columntype="longtext" guid="e6a709b2-d460-4f13-9abf-c0f100e97033" system="true" visible="true"><properties><fieldcaption>DocumentPageKeyWords</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageDescription" columntype="longtext" guid="4af8a60e-4d17-42c6-a830-1f6655aa807e" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentPageDescription</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentContent" columntype="longtext" guid="7cc90d0b-19c9-49fa-a7ce-14104dd32586" system="true" visible="true"><properties><fieldcaption>DocumentContent</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentCustomData" columntype="longtext" guid="8c76cc14-a486-44f9-a1f2-1947192ca6a2" system="true" visible="true"><properties><fieldcaption>DocumentCustomData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTags" columntype="longtext" guid="6a33a0ff-ffd9-4615-a1c8-5e1bba780964" system="true" visible="true"><properties><fieldcaption>DocumentTags</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTagGroupID" columntype="integer" guid="82d94a1c-a0e9-4496-bad0-6192217212bf" system="true" visible="true"><properties><fieldcaption>DocumentTagGroupID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentLastPublished" columntype="datetime" guid="834785f6-f532-435f-b76f-c20dfd9399f6" system="true" visible="true"><properties><fieldcaption>DocumentLastPublished</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentSearchExcluded" columntype="boolean" guid="05110f5f-a8dd-4e30-828c-ef767cfdb1e4" spellcheck="false" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>Page search excluded</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentLastVersionNumber" columnsize="50" columntype="text" guid="88338d99-7f91-4c20-8c84-a3dd97cb53a1" spellcheck="false" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsArchived" columntype="boolean" guid="41cad1db-9aa7-4818-ae85-a9651578e554" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowCycleGUID" columntype="guid" guid="7a8dbf8e-a387-4068-b255-247eff08351a" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsWaitingForTranslation" columntype="boolean" guid="ab09e46a-07b9-4bc2-be12-7c5c54840ba9" system="true"><properties><defaultvalue>false</defaultvalue></properties><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUName" columnsize="440" columntype="text" guid="32f0a3cf-cb9f-490e-a737-362123ec3cd4" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUDescription" columntype="longtext" guid="1f04c541-6ebe-412f-94ee-ddd370c46044" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentSKUShortDescription" columntype="longtext" guid="6a14a367-6f85-4da9-9430-5aa4a6f037c4" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentWorkflowActionStatus" columnsize="450" columntype="text" guid="11d7b5dd-fae8-4f61-af02-ca3a196abcb3" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowActionStatus</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="DocumentCanBePublished" columntype="boolean" guid="8d5d0089-266a-4f9d-9810-05cdb52f8cde" system="true"><properties><defaultvalue>True</defaultvalue></properties></field><field allowempty="true" column="DocumentPageBuilderWidgets" columntype="longtext" guid="b3a3768e-3dfa-4f7c-9e62-de84dd322812" system="true" /><field allowempty="true" column="DocumentPageTemplateConfiguration" columntype="longtext" guid="27ca67f3-bdeb-491e-b96b-8d52bac7d57a" system="true" /><field allowempty="true" column="DocumentABTestConfiguration" columntype="longtext" guid="639cb356-b9c0-4714-99a8-faf4924d06da" system="true" /><field column="DocumentShowInMenu" columntype="boolean" guid="480c8c29-fd4f-4e0a-b002-b3674de8c2ca" system="true" visible="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>DocumentShowInMenu</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
        0);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.workflow',
			'<form version="2"><field column="WorkflowID" columntype="integer" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isPK="true" system="true" visible="true"><properties><fieldcaption>WorkflowID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="WorkflowDisplayName" columnsize="450" columntype="text" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowName" columnsize="450" columntype="text" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowGUID" columntype="file" guid="a7be7df7-232f-4cf4-8446-09df882727bc" system="true" visible="true"><properties><fieldcaption>WorkflowGUID</fieldcaption></properties><settings><controlname>unknown</controlname></settings></field><field column="WorkflowLastModified" columntype="datetime" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" system="true" visible="true"><properties><fieldcaption>WorkflowLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="WorkflowEnabledFrom" columnprecision="7" columntype="datetime" guid="9245a31a-c1bb-43ff-992c-b0e084301987" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledFrom</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowEnabledTo" columnprecision="7" columntype="datetime" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" system="true" visible="true"><properties><fieldcaption>WorkflowEnabledTo</fieldcaption></properties><settings><CheckRange>True</CheckRange><controlname>CalendarControl</controlname><DisplayNow>True</DisplayNow><EditTime>True</EditTime><TimeZoneType>inherit</TimeZoneType></settings></field><field allowempty="true" column="WorkflowAutoPublishChanges" columntype="boolean" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" system="true" visible="true"><properties><captioncssclass>Wrap Width120</captioncssclass><defaultvalue>false</defaultvalue><fieldcaption>WorkflowAutoPublishChanges</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowUseCheckinCheckout" columntype="boolean" guid="64518cad-820b-425a-9553-3a11fe06a609" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowUseCheckinCheckout</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowType" columntype="integer" guid="23dba236-db4e-4549-8dd9-bb15ae665296" system="true" visible="true"><properties><fieldcaption>WorkflowType</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendEmails" columntype="boolean" guid="772b67c7-150b-48a0-856e-22ca96d9f747" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>WorkflowSendEmails</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="WorkflowSendApproveEmails" columntype="boolean" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendApproveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowApprovedTemplateName" columnsize="200" columntype="text" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" system="true" visible="true"><properties><fieldcaption>WorkflowApprovedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendRejectEmails" columntype="boolean" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendRejectEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowRejectedTemplateName" columnsize="200" columntype="text" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" system="true" visible="true"><properties><fieldcaption>WorkflowRejectedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendPublishEmails" columntype="boolean" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendPublishEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowPublishedTemplateName" columnsize="200" columntype="text" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" system="true" visible="true"><properties><fieldcaption>WorkflowPublishedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendArchiveEmails" columntype="boolean" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendArchiveEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowArchivedTemplateName" columnsize="200" columntype="text" guid="5cadd028-def3-4a36-97e8-53075839241c" system="true" visible="true"><properties><fieldcaption>WorkflowArchivedTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowSendReadyForApprovalEmails" columntype="boolean" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>WorkflowSendReadyForApprovalEmails</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="WorkflowReadyForApprovalTemplateName" columnsize="200" columntype="text" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" system="true" visible="true"><properties><fieldcaption>WorkflowReadyForApprovalTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowNotificationTemplateName" columnsize="200" columntype="text" guid="2633af02-6838-4651-872f-ca07c95c3ec1" system="true" visible="true"><properties><fieldcaption>WorkflowNotificationTemplateName</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="WorkflowAllowedObjects" columntype="longtext" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" system="true" visible="true"><properties><fieldcaption>Workflow allowed objects</fieldcaption></properties><settings><AllowAll>False</AllowAll><controlname>object_type_selector</controlname></settings></field><field allowempty="true" column="WorkflowRecurrenceType" columntype="integer" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" system="true" visible="true"><properties><fieldcaption>WorkflowRecurrenceType</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="WorkflowEnabled" columntype="boolean" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field></form>',
			0);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.workflow.MarketingAutomation',
			'<form version="2"><field column="WorkflowDisplayName" guid="1493eba2-b913-4a2f-af71-9df4ebcb6f51" order="0" /><field column="WorkflowName" guid="c0821ace-fa5b-4e08-b9eb-32783abd66c9" order="1"><settings><controlname>CodeName</controlname><RequireIdentifier>False</RequireIdentifier><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings></field><field column="WorkflowRecurrenceType" guid="c4da319f-62aa-46d7-8132-ba1ea48d1253" order="2"><settings><AssemblyName>CMS.WorkflowEngine</AssemblyName><controlname>AutomationRecurrenceType</controlname><DisplayType>2</DisplayType><ExcludedValues>0</ExcludedValues><Sort>False</Sort><TypeName>CMS.WorkflowEngine.ProcessRecurrenceTypeEnum</TypeName><UseStringRepresentation>False</UseStringRepresentation><AutoCompleteEnableCaching /><AutoCompleteFirstRowSelected /><AutoCompleteShowOnlyCurrentWordInCompletionListItem /><FilterMode /><Trim /></settings><properties><contentafter ismacro="true">&lt;br /&gt;&lt;br /&gt;
&lt;div class="js-st-expanded smarttip-expanded" style="width: 40%; min-width: 350px;"&gt;
    &lt;div class="alert-dismissable alert alert-smarttip"&gt;
        &lt;span class="alert-icon"&gt;
            &lt;i class="icon-light-bulb"&gt;&lt;/i&gt;&lt;span class="sr-only"&gt;{$ smarttip.smarttip $}&lt;/span&gt;
        &lt;/span&gt;
        &lt;div class="alert-label"&gt;
            &lt;div class="header"&gt;{$ processrecurrencetypeenum.smarttip.title $}&lt;/div&gt;
            &lt;div class="js-st-content"&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonconcurrentrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonconcurrentrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.nonrecurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.nonrecurring.description $}&lt;br /&gt;&lt;br /&gt;
                &lt;strong style="color: #000000;"&gt;{$ processrecurrencetypeenum.recurring $}&lt;/strong&gt; - {$ processrecurrencetypeenum.recurring.description $}
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</contentafter><contentbefore>&lt;span class="form-control-inline"&gt;
	{$ processrecurrencetypeenum.textabove $}
&lt;/span&gt;</contentbefore><controlcssclass>column-reverse</controlcssclass><fieldcaption>{$cms.workflow.recurrency$}</fieldcaption></properties></field><field column="WorkflowID" guid="bf3f5149-ebe0-4c41-8cde-79a0e63bdb66" isunique="true" visible="" order="3" /><field column="WorkflowGUID" guid="a7be7df7-232f-4cf4-8446-09df882727bc" visible="" order="4" /><field column="WorkflowLastModified" columnprecision="7" guid="83b95ad1-000c-4e16-9177-71b438a75d3c" visible="" order="5" /><field column="WorkflowAutoPublishChanges" guid="947759f0-e4ee-4286-8ed3-4a33506ee50e" visible="" order="6" /><field column="WorkflowUseCheckinCheckout" guid="64518cad-820b-425a-9553-3a11fe06a609" visible="" order="7" /><field column="WorkflowType" guid="23dba236-db4e-4549-8dd9-bb15ae665296" visible="" order="8" /><field column="WorkflowSendEmails" guid="772b67c7-150b-48a0-856e-22ca96d9f747" visible="" order="9" /><field column="WorkflowSendApproveEmails" guid="b1241a2a-d1b7-4fee-a4cf-9a851a768887" visible="" order="10" /><field column="WorkflowApprovedTemplateName" guid="b12d21d4-a5b9-407d-815f-a7340247efeb" visible="" order="11" /><field column="WorkflowSendRejectEmails" guid="0d4d8bad-2cdd-4fbb-a128-4cc3f77b9b1f" visible="" order="12" /><field column="WorkflowRejectedTemplateName" guid="0dd2bd6e-2f9e-49dc-9d00-1d7aed9062b5" visible="" order="13" /><field column="WorkflowSendPublishEmails" guid="73960e86-97a9-4e64-8cbe-f678f72e2698" visible="" order="14" /><field column="WorkflowPublishedTemplateName" guid="c93eb40e-cdbb-4b73-9564-59a8923f80ec" visible="" order="15" /><field column="WorkflowSendArchiveEmails" guid="8b05ab93-3365-4a76-beb8-d02d126e681b" visible="" order="16" /><field column="WorkflowArchivedTemplateName" guid="5cadd028-def3-4a36-97e8-53075839241c" visible="" order="17" /><field column="WorkflowSendReadyForApprovalEmails" guid="a3f5583f-eaed-4189-9f26-ebd08b763cb8" visible="" order="18" /><field column="WorkflowReadyForApprovalTemplateName" guid="e1fcdf91-da81-40c3-85f1-222ac1580baf" visible="" order="19" /><field column="WorkflowNotificationTemplateName" guid="2633af02-6838-4651-872f-ca07c95c3ec1" visible="" order="20" /><field column="WorkflowAllowedObjects" guid="e4a38770-488d-4b0f-8367-1b0fb3aaa18d" visible="" order="21" /><field column="WorkflowEnabled" guid="d8267b62-623a-4397-8041-0ab5a13cf0c1" visible="" order="22" /><field column="WorkflowEnabledFrom" guid="9245a31a-c1bb-43ff-992c-b0e084301987" visible="" order="23" /><field column="WorkflowEnabledTo" guid="0c37542a-1c5b-4161-bdbe-805d0bcfb011" visible="" order="24" /></form>',
			1);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.category', '<form version="2"><field column="CategoryID" columntype="integer" guid="a7e6de80-6774-4fc9-8764-fde25832fce0" isPK="true" system="true"><properties><fieldcaption>CategoryID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="CategorySiteID" columntype="integer" guid="55f19a7f-1e83-4f11-8dcd-b15e2c5e2638" system="true" visible="true"><properties><defaultvalue ismacro="true">{%Form.ObjectSiteID &gt; 0 ? Form.ObjectSiteID : "" @%}</defaultvalue><fieldcaption>{$category_edit.categorysite$}</fieldcaption><fielddescription>{$category.categorysiteid.description$}</fielddescription></properties><settings><controlname>RadioButtonsControl</controlname><Options>{%Form.ObjectSiteID @%};{$category_edit.sitecategory$}
;{$category_edit.globalcategory$}</Options><RepeatDirection>horizontal</RepeatDirection><RepeatLayout>Flow</RepeatLayout></settings></field><field column="CategoryDisplayName" columnsize="250" columntype="text" guid="62f59aab-9b3e-4ddc-8f7a-fb97e039de40" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>{$category.categorydisplayname.description$}</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field allowempty="true" column="CategoryName" columnsize="250" columntype="text" guid="6ec936dc-3b0f-476c-8d07-9dbb7e5a19b9" isunique="true" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption><fielddescription>{$category.categoryname.description$}</fielddescription></properties><settings><controlname>codename</controlname></settings></field><field allowempty="true" column="CategoryParentID" columntype="integer" guid="70e95a64-6c83-4dc3-a334-c8a7bf61ea39" system="true" visible="true"><properties><fieldcaption>{$category_edit.parentcategory$}</fieldcaption><fielddescription>{$category.categoryparentid.description$}</fielddescription><visiblemacro ismacro="true">{%FormMode == FormModeEnum.Update @%}</visiblemacro></properties><settings><AddRootRecord>True</AddRootRecord><controlname>category_sparentselector</controlname></settings></field><field allowempty="true" column="CategoryDescription" columntype="longtext" guid="21b4dc27-69d2-4ee5-ad21-31ce7362a169" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>{$category.categorydescription.description$}</fielddescription></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field column="CategoryEnabled" columntype="boolean" guid="60a19437-daca-476d-a9c7-f771810012d2" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>{$category.categoryenabled.description$}</fielddescription></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="CategoryAllowAllTypes" columntype="boolean" guid="16389d07-e29e-472c-bc1b-a3a5e5d5f24a" hasdependingfields="true" system="true"><properties><defaultvalue>True</defaultvalue></properties><settings><controlname>RadioButtonsControl</controlname><Options>1;{$category.allowalltypes$}
0;{$category.allowonlyfollowing$}</Options><RepeatDirection>vertical</RepeatDirection><RepeatLayout>Flow</RepeatLayout><SortItems>False</SortItems></settings></field><field allowempty="true" column="CategoryCount" columntype="integer" guid="d333614c-e26b-45fa-803f-2815644d9b6e" system="true"><properties><fieldcaption>CategoryEnabled</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field allowempty="true" column="CategoryUserID" columntype="integer" guid="aebc6d41-6911-4955-8566-3e46053d2243" system="true"><properties><fieldcaption>CategoryUserID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="CategoryGUID" columntype="guid" guid="09d6706d-6145-400c-9e12-c47f14fdfa44" system="true"><properties><fieldcaption>CategoryGUID</fieldcaption></properties><settings><controlname>LabelControl</controlname></settings></field><field column="CategoryLastModified" columntype="datetime" guid="67e9377c-c25a-4dd7-9ef8-9b9d97a408ce" system="true"><properties><fieldcaption>CategoryLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="CategoryIDPath" columnsize="450" columntype="text" guid="aac5e74e-aa14-43b5-b18c-fd329ba7974c" system="true"><properties><fieldcaption>CategoryIDPath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryNamePath" columnsize="1500" columntype="text" guid="1591d49a-9209-4d55-851c-9fe1769e9def" system="true"><properties><fieldcaption>CategoryNamePath</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryLevel" columntype="integer" guid="359e5923-49da-4a39-9910-b9458d5a40a2" system="true"><properties><fieldcaption>CategoryLevel</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="CategoryOrder" columntype="integer" guid="3b0a29ce-b93f-4ff8-a86b-5273a4ad1336" system="true"><properties><fieldcaption>CategoryOrder</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field></form>', 0);

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('ecommerce.shippingoption',
        '<form version="2"><field column="ShippingOptionID" columntype="integer" guid="dc7a8f97-f1cb-4517-8031-489213a2445d" isPK="true" system="true"><properties><fieldcaption>ShippingOptionID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><category name="com.ui.configurationshippingoptionsgeneral"><properties><caption>{$com.ui.configurationshippingoptionsgeneral$}</caption><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionCarrierID" columntype="integer" guid="44289ffa-5e1a-4b40-8def-bcbf4c392fd5" system="true" visible="true"><properties><enabledmacro ismacro="true">{%EditedObject.ID == 0|(user)administrator|(hash)79f1b87e442f42ca74111ddcef0434280676da2605b0a19528a7b6cc2016916d%}</enabledmacro><fieldcaption>{$com.shippingoption.carrier$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% HTMLEncode(EditedObject.ShippingOptionCarrier.CarrierDisplayName) |(identity)GlobalAdministrator|(hash)53d0b4b0e30df1741a952c2a5ecc0e5d890f32c5a20afb088088c1aa8a0dbe4d%}</OutputFormat></settings></field><field allowempty="true" column="ShippingOptionCarrierServiceName" columnsize="200" columntype="text" guid="b38ed66d-cba3-4b19-93f4-169fd5d82ec5" system="true" visible="true"><properties><fieldcaption>{$com.carrier.service$}</fieldcaption></properties><settings><controlname>LabelControl</controlname><OutputFormat ismacro="true">{% EditedObject.ShippingOptionServiceDisplayName |(user)administrator|(hash)93b15fb454d2ad4a639ae38bc178eed2c34ee3df08423287bbb28ce84663b299%}</OutputFormat></settings></field><field column="ShippingOptionDisplayName" columnsize="200" columntype="text" guid="765b2b6e-52b1-41c9-ab12-ec94b3ef6ad7" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption><fielddescription>The shipping option name displayed to the users on the live site and in the administration interface.</fielddescription></properties><settings><controlname>localizabletextbox</controlname><ValueIsContent>False</ValueIsContent></settings></field><field column="ShippingOptionName" columnsize="200" columntype="text" guid="9804163e-683a-4f71-91ed-d2b81643f483" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><controlname>codename</controlname><RequireIdentifier>False</RequireIdentifier></settings></field><field allowempty="true" column="ShippingOptionTaxClassID" columntype="integer" guid="7d267933-0d0e-443b-80f8-54cf64ecd8a4" system="true" visible="true"><properties><fieldcaption>Tax class</fieldcaption></properties><settings><AddGlobalObjectNamePrefix>False</AddGlobalObjectNamePrefix><AddGlobalObjectSuffix>False</AddGlobalObjectSuffix><AllowAll>False</AllowAll><AllowDefault>False</AllowDefault><AllowEditTextBox>False</AllowEditTextBox><AllowEmpty>True</AllowEmpty><controlname>Uni_selector</controlname><DialogWindowName>SelectionDialog</DialogWindowName><EditDialogWindowHeight>700</EditDialogWindowHeight><EditDialogWindowWidth>1000</EditDialogWindowWidth><EditWindowName>EditWindow</EditWindowName><EncodeOutput>True</EncodeOutput><GlobalObjectSuffix ismacro="true">{$general.global$}</GlobalObjectSuffix><LocalizeItems>True</LocalizeItems><ObjectType>ecommerce.taxclass</ObjectType><RemoveMultipleCommas>False</RemoveMultipleCommas><ResourcePrefix>taxselect</ResourcePrefix><ReturnColumnType>id</ReturnColumnType><SelectionMode>1</SelectionMode><ValuesSeparator>;</ValuesSeparator><WhereCondition ismacro="true">{%GetShippingOptionTaxClassSelectorWhereCondition(EditedObject)%}</WhereCondition></settings></field><field column="ShippingOptionEnabled" columntype="boolean" guid="0fe5eaa7-6d54-4c76-90c5-376b35a11f9d" system="true" visible="true"><properties><defaultvalue>True</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption><fielddescription>Indicates if the shipping option can be used in your on-line store.</fielddescription></properties><settings><controlname>CheckBoxControl</controlname></settings></field><category name="com.shippingoption.additional"><properties><caption>{$com.shippingoption.additional$}</caption><collapsedbydefault>true</collapsedbydefault><collapsible>true</collapsible><visible>True</visible></properties></category><field allowempty="true" column="ShippingOptionDescription" columntype="longtext" guid="0b53df7f-bcc9-49a4-8fcc-946b90068ca6" system="true" visible="true"><properties><fieldcaption>{$general.description$}</fieldcaption><fielddescription>Description that can be displayed on the live site.</fielddescription></properties><settings><controlname>localizabletextarea</controlname></settings></field><field allowempty="true" column="ShippingOptionThumbnailGUID" columntype="guid" guid="d2799e66-8102-4569-ba53-a826837785e5" system="true" visible="true"><properties><fieldcaption>{$media.general.teaser$}</fieldcaption><fielddescription>{$com.shippingoptionimage.description$}</fielddescription></properties><settings><controlname>metafileuploadercontrol</controlname><ObjectCategory>Thumbnail</ObjectCategory></settings></field><field allowempty="true" column="ShippingOptionSiteID" columntype="integer" guid="fd1414cc-26d1-4d35-8dfe-6d6c0edf3a92" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionGUID" columntype="file" guid="18dd26bf-7cc3-4d53-9cd4-b3cb5df860da" system="true"><properties><fieldcaption>ShippingOptionSiteID</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ShippingOptionLastModified" columntype="datetime" guid="949f7f46-fd67-4cc3-8942-77064b1924cf" system="true"><properties><fieldcaption>ShippingOptionLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field></form>',
        0);

END
GO


DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 180
BEGIN
	DECLARE @categoryParentID INT;
	SET @categoryParentID = (SELECT [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Synchronization.Staging')
	DECLARE @categoryResourceID INT
	SET @categoryResourceID = (SELECT [ResourceID] FROM [CMS_Resource] WHERE [ResourceName] = 'CMS.Staging')
	
	IF NOT EXISTS(SELECT 1 FROM [CMS_SettingsCategory] WHERE CategoryName = 'CMS.Staging.Legacy') 
	BEGIN
	    INSERT INTO CMS_SettingsCategory 
	    (
	        [CategoryDisplayName],
	        [CategoryOrder],
	        [CategoryName],
	        [CategoryParentID],
	        [CategoryIDPath],
	        [CategoryLevel],
	        [CategoryChildCount],
	        [CategoryIconPath],
	        [CategoryIsGroup],
	        [CategoryIsCustom],
	        [CategoryResourceID])
		 VALUES (
	        '{$settingscategory.cmsstaginglegacy$}',
	        3,
	        'CMS.Staging.Legacy',
	        @categoryParentID,
	        '', 
	        3,
	        0,
	        '',
	        1,
	        0,
	        @categoryResourceID)
	END
	-- Recalculate IDPath and ChildCount for CMS_SettingsCategory
	DECLARE @categoryCursor CURSOR;
	SET @categoryCursor = CURSOR FOR SELECT [CategoryID], [CategoryParentID] FROM [CMS_SettingsCategory] WHERE [CategoryName] IN ('CMS.Synchronization.Staging', 'CMS.Staging.Legacy') ORDER BY [CategoryLevel], [CategoryID]
	
	DECLARE @categoryID int;
	
	OPEN @categoryCursor
	
	FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	WHILE @@FETCH_STATUS = 0
	BEGIN
	
	    UPDATE [CMS_SettingsCategory] SET
	
		    [CategoryChildCount] = (SELECT COUNT(*)
		    								FROM [CMS_SettingsCategory] AS [Children]
		    								WHERE [Children].[CategoryParentID] = @categoryID),
	
		    [CategoryIDPath] = COALESCE((SELECT TOP 1 [CategoryIDPath] FROM [CMS_SettingsCategory] AS [Parent] WHERE [Parent].CategoryID = @categoryParentID), '')
		    					  + '/'
		    					  + REPLICATE('0', 8 - LEN(@categoryID))
		    					  + CAST(@categoryID AS NVARCHAR(8))
	
	    WHERE [CategoryID] = @categoryID
	
	    FETCH NEXT FROM @categoryCursor INTO @categoryID, @categoryParentID;
	END
	
	CLOSE @categoryCursor;
	DEALLOCATE @categoryCursor;
	
	
	DECLARE @keyCategoryID int;
	SET @keyCategoryID = (SELECT TOP 1 [CategoryID] FROM [CMS_SettingsCategory] WHERE [CategoryName] = 'CMS.Staging.Legacy')
	IF @keyCategoryID IS NOT NULL 
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CMS_SettingsKey] WHERE KeyName = 'CMSStagingUseLegacy') 
		BEGIN
		    INSERT INTO CMS_SettingsKey
		    (
		    	[KeyName],
		    	[KeyDisplayName],
		    	[KeyDescription],
		    	[KeyValue],
		    	[KeyType],
		    	[KeyCategoryID],
		    	[KeyGUID],
		    	[KeyOrder],
		    	[KeyDefaultValue],
		    	[KeyIsGlobal],
		    	[KeyIsHidden],
		    	[KeyLastModified],
		    	[KeyExplanationText]
		    )
		    	VALUES
		    (
		    	'CMSStagingUseLegacy',
		    	'{$settingskey.cmsstaginguselegacy$}',
		    	'{$settingskey.cmsstaginguselegacy.description$}',
		    	'False',
		    	'boolean',
		    	@keyCategoryID,
		    	'A1A72BF6-A2C0-4E9B-89E3-091907430123',
		    	4,
		    	'False',
		    	1,
		    	0,
		    	GetDate(),
		    	''
		    )
	    END
	END

	INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('staging.server',
    		'<form version="2"><field column="ServerID" columntype="integer" guid="adc25c7d-4b9d-4272-9bb5-83577cf832d3" isPK="true" isunique="true" system="true"><properties><fieldcaption>ServerID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="ServerDisplayName" columnsize="440" columntype="text" guid="ccbfd081-f598-4bcd-86c5-0b0659d1d823" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><controlname>localizabletextbox</controlname></settings></field><field column="ServerName" columnsize="100" columntype="text" guid="56e84c75-7ef5-46ac-b851-792532748a56" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><controlname>codename</controlname></settings></field><field column="ServerSiteID" columntype="integer" guid="3a5aac85-f6a7-462c-995c-f87088fccdc7" system="true"><properties><defaultvalue ismacro="true">{%CurrentSite.SiteID|(user)administrator|(hash)f1f36b57555be68f4a774a617ef7f4b296d321c24bd971a578ae7443c86b1480%}</defaultvalue><fieldcaption>test</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ServerURL" columnsize="450" columntype="text" guid="5e032c90-c2ab-43d8-bb9c-9c43ebfcddc8" system="true" visible="true"><properties><fieldcaption>{$Server_Edit.ServerURLLabel$}</fieldcaption></properties><settings><AllowAutoRedirect>False</AllowAutoRedirect><controlname>UrlChecker</controlname><IncludeUrlSuffixInValue>False</IncludeUrlSuffixInValue><ProtocolIsRequired>False</ProtocolIsRequired><ResourcePrefix>urlchecker</ResourcePrefix><UrlSuffix ismacro="true">{% legacy = Settings.CMSStagingUseLegacy.ToBool(); "/CMSPages/Staging/SyncServer." + if (legacy) {"asmx"} else {"ashx"}|(identity)GlobalAdministrator|(hash)db69958042c2c97cce1435ad74e25e33d266cdff46b6bc386626edd9b8cad944%}</UrlSuffix></settings></field><field column="ServerEnabled" columntype="boolean" guid="4726b612-34b9-464b-8a35-17ef4acc9c26" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ServerAuthentication" columnsize="20" columntype="text" guid="df28276a-53b0-4899-b35e-3bce1bf0cfb8" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>USERNAME</defaultvalue><fieldcaption>Server authentication</fieldcaption></properties><settings><controlname>radiobuttonscontrol</controlname><Options>USERNAME;User name / password
X509;X509</Options><RepeatDirection>horizontal</RepeatDirection></settings></field><field allowempty="true" column="ServerUsername" columnsize="100" columntype="text" dependsonanotherfield="true" guid="7d0a229d-7ac4-4377-aaf4-953e995ed9a8" system="true" visible="true"><properties><fieldcaption>User name</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "USERNAME"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerPassword" columnsize="100" columntype="text" dependsonanotherfield="true" guid="b2bb8d87-584d-4e88-bff1-ebc6e96eff4a" system="true" visible="true"><properties><fieldcaption>Password</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "USERNAME"%}</visiblemacro></properties><settings><controlname>encryptedpassword</controlname></settings></field><field allowempty="true" column="ServerX509ClientKeyID" columnsize="200" columntype="text" dependsonanotherfield="true" guid="2c24dc63-7eed-4fc9-a343-24c89827ce81" system="true" visible="true"><properties><fieldcaption>Client key ID</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "X509"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerX509ServerKeyID" columnsize="200" columntype="text" dependsonanotherfield="true" guid="8b2d88a3-111f-4a03-8128-e31abaff562f" system="true" visible="true"><properties><fieldcaption>Server key ID</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "X509"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ServerGUID" columntype="guid" guid="85c57a10-f71b-4bcc-903a-8e55bd1038a2" system="true"><properties><fieldcaption>ServerGUID</fieldcaption></properties><settings><controlname>LabelControl</controlname></settings></field><field allowempty="true" column="ServerLastModified" columntype="datetime" guid="40a0bfef-1603-4a94-90c0-d48e769f3fe7" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field></form>',
			0);
END

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = ('<form version="2"><field column="ServerID" columntype="integer" guid="adc25c7d-4b9d-4272-9bb5-83577cf832d3" isPK="true" isunique="true" system="true"><properties><fieldcaption>ServerID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field column="ServerDisplayName" columnsize="440" columntype="text" guid="ccbfd081-f598-4bcd-86c5-0b0659d1d823" system="true" translatefield="true" visible="true"><properties><fieldcaption>{$general.displayname$}</fieldcaption></properties><settings><controlname>localizabletextbox</controlname></settings></field><field column="ServerName" columnsize="100" columntype="text" guid="56e84c75-7ef5-46ac-b851-792532748a56" system="true" visible="true"><properties><fieldcaption>{$general.codename$}</fieldcaption></properties><settings><controlname>codename</controlname></settings></field><field column="ServerSiteID" columntype="integer" guid="3a5aac85-f6a7-462c-995c-f87088fccdc7" system="true"><properties><defaultvalue ismacro="true">{%CurrentSite.SiteID|(user)administrator|(hash)f1f36b57555be68f4a774a617ef7f4b296d321c24bd971a578ae7443c86b1480%}</defaultvalue><fieldcaption>test</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ServerURL" columnsize="450" columntype="text" guid="5e032c90-c2ab-43d8-bb9c-9c43ebfcddc8" system="true" visible="true"><properties><fieldcaption>{$Server_Edit.ServerURLLabel$}</fieldcaption></properties><settings><AllowAutoRedirect>False</AllowAutoRedirect><controlname>UrlChecker</controlname><IncludeUrlSuffixInValue>False</IncludeUrlSuffixInValue><ProtocolIsRequired>False</ProtocolIsRequired><ResourcePrefix>urlchecker</ResourcePrefix><UrlSuffix ismacro="true">{% legacy = Settings.CMSStagingUseLegacy.ToBool(); "/CMSPages/Staging/SyncServer." + if (legacy) {"asmx"} else {"ashx"}|(identity)GlobalAdministrator|(hash)db69958042c2c97cce1435ad74e25e33d266cdff46b6bc386626edd9b8cad944%}</UrlSuffix></settings></field><field column="ServerEnabled" columntype="boolean" guid="4726b612-34b9-464b-8a35-17ef4acc9c26" system="true" visible="true"><properties><defaultvalue>true</defaultvalue><fieldcaption>{$general.enabled$}</fieldcaption></properties><settings><controlname>checkboxcontrol</controlname></settings></field><field column="ServerAuthentication" columnsize="20" columntype="text" guid="df28276a-53b0-4899-b35e-3bce1bf0cfb8" hasdependingfields="true" system="true" visible="true"><properties><defaultvalue>USERNAME</defaultvalue><fieldcaption>Server authentication</fieldcaption></properties><settings><controlname>radiobuttonscontrol</controlname><Options>USERNAME;User name / password
X509;X509</Options><RepeatDirection>horizontal</RepeatDirection></settings></field><field allowempty="true" column="ServerUsername" columnsize="100" columntype="text" dependsonanotherfield="true" guid="7d0a229d-7ac4-4377-aaf4-953e995ed9a8" system="true" visible="true"><properties><fieldcaption>User name</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "USERNAME"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerPassword" columnsize="100" columntype="text" dependsonanotherfield="true" guid="b2bb8d87-584d-4e88-bff1-ebc6e96eff4a" system="true" visible="true"><properties><fieldcaption>Password</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "USERNAME"%}</visiblemacro></properties><settings><controlname>encryptedpassword</controlname></settings></field><field allowempty="true" column="ServerX509ClientKeyID" columnsize="200" columntype="text" dependsonanotherfield="true" guid="2c24dc63-7eed-4fc9-a343-24c89827ce81" system="true" visible="true"><properties><fieldcaption>Client key ID</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "X509"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field allowempty="true" column="ServerX509ServerKeyID" columnsize="200" columntype="text" dependsonanotherfield="true" guid="8b2d88a3-111f-4a03-8128-e31abaff562f" system="true" visible="true"><properties><fieldcaption>Server key ID</fieldcaption><visiblemacro ismacro="true">{%ServerAuthentication == "X509"%}</visiblemacro></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="ServerGUID" columntype="guid" guid="85c57a10-f71b-4bcc-903a-8e55bd1038a2" system="true"><properties><fieldcaption>ServerGUID</fieldcaption></properties><settings><controlname>LabelControl</controlname></settings></field><field allowempty="true" column="ServerLastModified" columntype="datetime" guid="40a0bfef-1603-4a94-90c0-d48e769f3fe7" system="true"><properties><fieldcaption>ServerLastModified</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field></form>')
	WHERE ClassName = 'staging.server';
END
GO

-- HF13-533
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 192
BEGIN
    INSERT INTO [Temp_FormDefinition] ([ObjectName], [FormDefinition], [IsAltForm])
	VALUES ('cms.document',
        '<form version="2"><field column="DocumentID" columntype="integer" guid="04c53ea8-89c6-45fe-b9f8-11c869742937" isPK="true" system="true" visible="true"><properties><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentGUID" columntype="guid" guid="b0dc7e57-96dd-4e5b-829a-4ba9bd84ac0f" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field column="DocumentName" columnsize="100" columntype="text" guid="1e0f27f5-f59a-4fa1-871f-5c2d946453ca" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedWhen" columntype="datetime" guid="d86fd91f-9650-459d-a6a9-f101ec936cdf" system="true" visible="true"><properties><fieldcaption>DocumentModifiedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedByUserID" columntype="integer" guid="3db3f1c9-02b4-4d37-abd5-1298a9068ac1" system="true" visible="true"><properties><fieldcaption>DocumentModifiedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentForeignKeyValue" columntype="integer" guid="1ab4dfd9-6e8c-4b4d-9526-528890bc9c47" system="true" visible="true"><properties><fieldcaption>DocumentForeignKeyValue</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedByUserID" columntype="integer" guid="89690d5f-2c54-4788-8926-b38692719e0e" system="true" visible="true"><properties><fieldcaption>DocumentCreatedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedWhen" columntype="datetime" guid="82f0e9c1-9dfa-42a1-9b4a-a0090bbfad73" system="true" visible="true"><properties><fieldcaption>DocumentCreatedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutByUserID" columntype="integer" guid="d561f437-cf47-4681-a94e-085d9632b926" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutWhen" columntype="datetime" guid="65160c58-f425-4370-baf6-b47dc987611d" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutVersionHistoryID" columntype="integer" guid="31bf940c-d22c-4bf8-a430-776b6d4488c7" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishedVersionHistoryID" columntype="integer" guid="8229ebd2-c4d2-43bd-82e9-ae9af6146c97" system="true" visible="true"><properties><fieldcaption>DocumentPublishedVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowStepID" columntype="integer" guid="b7238cf1-94ac-4c59-87f4-f472f78245b2" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowStepID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishFrom" columntype="datetime" guid="5998e7fe-a503-4c5a-8711-9a4cbe77d8a3" system="true" visible="true"><properties><fieldcaption>DocumentPublishFrom</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishTo" columntype="datetime" guid="75b22166-d757-485f-901a-6636cabe930e" system="true" visible="true"><properties><fieldcaption>DocumentPublishTo</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="DocumentCulture" columnsize="50" columntype="text" guid="e123ee40-049c-48b6-9dd8-a51b1e7da6b1" system="true" visible="true"><properties><fieldcaption>DocumentCulture</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field column="DocumentNodeID" columntype="integer" guid="3bc79b36-ba8f-4fea-85a4-c72fdbc315d2" system="true" visible="true"><properties><fieldcaption>DocumentNodeID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPageTitle" columntype="longtext" guid="a2df3057-5b8d-481b-9247-88b970c57a0b" system="true" visible="true"><properties><fieldcaption>DocumentPageTitle</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageKeyWords" columntype="longtext" guid="e6a709b2-d460-4f13-9abf-c0f100e97033" system="true" visible="true"><properties><fieldcaption>DocumentPageKeyWords</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageDescription" columntype="longtext" guid="4af8a60e-4d17-42c6-a830-1f6655aa807e" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentPageDescription</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentContent" columntype="longtext" guid="7cc90d0b-19c9-49fa-a7ce-14104dd32586" system="true" visible="true"><properties><fieldcaption>DocumentContent</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentCustomData" columntype="longtext" guid="8c76cc14-a486-44f9-a1f2-1947192ca6a2" system="true" visible="true"><properties><fieldcaption>DocumentCustomData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTags" columntype="longtext" guid="6a33a0ff-ffd9-4615-a1c8-5e1bba780964" system="true" visible="true"><properties><fieldcaption>DocumentTags</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTagGroupID" columntype="integer" guid="82d94a1c-a0e9-4496-bad0-6192217212bf" system="true" visible="true"><properties><fieldcaption>DocumentTagGroupID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentLastPublished" columntype="datetime" guid="834785f6-f532-435f-b76f-c20dfd9399f6" system="true" visible="true"><properties><fieldcaption>DocumentLastPublished</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentSearchExcluded" columntype="boolean" guid="05110f5f-a8dd-4e30-828c-ef767cfdb1e4" spellcheck="false" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>Page search excluded</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentLastVersionNumber" columnsize="50" columntype="text" guid="88338d99-7f91-4c20-8c84-a3dd97cb53a1" spellcheck="false" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsArchived" columntype="boolean" guid="41cad1db-9aa7-4818-ae85-a9651578e554" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowCycleGUID" columntype="guid" guid="7a8dbf8e-a387-4068-b255-247eff08351a" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsWaitingForTranslation" columntype="boolean" guid="ab09e46a-07b9-4bc2-be12-7c5c54840ba9" system="true"><properties><defaultvalue>false</defaultvalue></properties><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUName" columnsize="440" columntype="text" guid="32f0a3cf-cb9f-490e-a737-362123ec3cd4" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUDescription" columntype="longtext" guid="1f04c541-6ebe-412f-94ee-ddd370c46044" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentSKUShortDescription" columntype="longtext" guid="6a14a367-6f85-4da9-9430-5aa4a6f037c4" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentWorkflowActionStatus" columnsize="450" columntype="text" guid="11d7b5dd-fae8-4f61-af02-ca3a196abcb3" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowActionStatus</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="DocumentCanBePublished" columntype="boolean" guid="8d5d0089-266a-4f9d-9810-05cdb52f8cde" system="true"><properties><defaultvalue>True</defaultvalue></properties></field><field allowempty="true" column="DocumentPageBuilderWidgets" columntype="longtext" guid="b3a3768e-3dfa-4f7c-9e62-de84dd322812" system="true" /><field allowempty="true" column="DocumentPageTemplateConfiguration" columntype="longtext" guid="27ca67f3-bdeb-491e-b96b-8d52bac7d57a" system="true" /><field allowempty="true" column="DocumentABTestConfiguration" columntype="longtext" guid="639cb356-b9c0-4714-99a8-faf4924d06da" system="true" /><field column="DocumentShowInMenu" columntype="boolean" guid="480c8c29-fd4f-4e0a-b002-b3674de8c2ca" system="true" visible="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>DocumentShowInMenu</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentUnpublishedRedirectUrl" columnsize="450" columntype="text" guid="5112f255-bc7d-42b2-b24a-a9008ba2564d" system="true"><properties><fieldcaption>DocumentUnpublishedRedirectUrl</fieldcaption></properties><settings><controlname>URLSelector</controlname></settings></field></form>',
        0);
END

IF @HOTFIXVERSION < 0
BEGIN
UPDATE [CMS_Class] SET 
	[ClassFormDefinition] = '<form version="2"><field column="DocumentID" columntype="integer" guid="04c53ea8-89c6-45fe-b9f8-11c869742937" isPK="true" system="true" visible="true"><properties><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentGUID" columntype="guid" guid="b0dc7e57-96dd-4e5b-829a-4ba9bd84ac0f" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field column="DocumentName" columnsize="100" columntype="text" guid="1e0f27f5-f59a-4fa1-871f-5c2d946453ca" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentName</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedWhen" columntype="datetime" guid="d86fd91f-9650-459d-a6a9-f101ec936cdf" system="true" visible="true"><properties><fieldcaption>DocumentModifiedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentModifiedByUserID" columntype="integer" guid="3db3f1c9-02b4-4d37-abd5-1298a9068ac1" system="true" visible="true"><properties><fieldcaption>DocumentModifiedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentForeignKeyValue" columntype="integer" guid="1ab4dfd9-6e8c-4b4d-9526-528890bc9c47" system="true" visible="true"><properties><fieldcaption>DocumentForeignKeyValue</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedByUserID" columntype="integer" guid="89690d5f-2c54-4788-8926-b38692719e0e" system="true" visible="true"><properties><fieldcaption>DocumentCreatedByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCreatedWhen" columntype="datetime" guid="82f0e9c1-9dfa-42a1-9b4a-a0090bbfad73" system="true" visible="true"><properties><fieldcaption>DocumentCreatedWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutByUserID" columntype="integer" guid="d561f437-cf47-4681-a94e-085d9632b926" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutByUserID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutWhen" columntype="datetime" guid="65160c58-f425-4370-baf6-b47dc987611d" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutWhen</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentCheckedOutVersionHistoryID" columntype="integer" guid="31bf940c-d22c-4bf8-a430-776b6d4488c7" system="true" visible="true"><properties><fieldcaption>DocumentCheckedOutVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishedVersionHistoryID" columntype="integer" guid="8229ebd2-c4d2-43bd-82e9-ae9af6146c97" system="true" visible="true"><properties><fieldcaption>DocumentPublishedVersionHistoryID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowStepID" columntype="integer" guid="b7238cf1-94ac-4c59-87f4-f472f78245b2" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowStepID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishFrom" columntype="datetime" guid="5998e7fe-a503-4c5a-8711-9a4cbe77d8a3" system="true" visible="true"><properties><fieldcaption>DocumentPublishFrom</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentPublishTo" columntype="datetime" guid="75b22166-d757-485f-901a-6636cabe930e" system="true" visible="true"><properties><fieldcaption>DocumentPublishTo</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field column="DocumentCulture" columnsize="50" columntype="text" guid="e123ee40-049c-48b6-9dd8-a51b1e7da6b1" system="true" visible="true"><properties><fieldcaption>DocumentCulture</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>TextBoxControl</controlname><Trim>False</Trim></settings></field><field column="DocumentNodeID" columntype="integer" guid="3bc79b36-ba8f-4fea-85a4-c72fdbc315d2" system="true" visible="true"><properties><fieldcaption>DocumentNodeID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentPageTitle" columntype="longtext" guid="a2df3057-5b8d-481b-9247-88b970c57a0b" system="true" visible="true"><properties><fieldcaption>DocumentPageTitle</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageKeyWords" columntype="longtext" guid="e6a709b2-d460-4f13-9abf-c0f100e97033" system="true" visible="true"><properties><fieldcaption>DocumentPageKeyWords</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textareacontrol</controlname><FilterMode>False</FilterMode><IsTextArea>True</IsTextArea><Wrap>True</Wrap></settings></field><field allowempty="true" column="DocumentPageDescription" columntype="longtext" guid="4af8a60e-4d17-42c6-a830-1f6655aa807e" system="true" translatefield="true" visible="true"><properties><fieldcaption>DocumentPageDescription</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentContent" columntype="longtext" guid="7cc90d0b-19c9-49fa-a7ce-14104dd32586" system="true" visible="true"><properties><fieldcaption>DocumentContent</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentCustomData" columntype="longtext" guid="8c76cc14-a486-44f9-a1f2-1947192ca6a2" system="true" visible="true"><properties><fieldcaption>DocumentCustomData</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTags" columntype="longtext" guid="6a33a0ff-ffd9-4615-a1c8-5e1bba780964" system="true" visible="true"><properties><fieldcaption>DocumentTags</fieldcaption></properties><settings><controlname>textareacontrol</controlname></settings></field><field allowempty="true" column="DocumentTagGroupID" columntype="integer" guid="82d94a1c-a0e9-4496-bad0-6192217212bf" system="true" visible="true"><properties><fieldcaption>DocumentTagGroupID</fieldcaption></properties><settings><controlname>textboxcontrol</controlname></settings></field><field allowempty="true" column="DocumentLastPublished" columntype="datetime" guid="834785f6-f532-435f-b76f-c20dfd9399f6" system="true" visible="true"><properties><fieldcaption>DocumentLastPublished</fieldcaption></properties><settings><controlname>calendarcontrol</controlname></settings></field><field allowempty="true" column="DocumentSearchExcluded" columntype="boolean" guid="05110f5f-a8dd-4e30-828c-ef767cfdb1e4" spellcheck="false" system="true" visible="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>Page search excluded</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentLastVersionNumber" columnsize="50" columntype="text" guid="88338d99-7f91-4c20-8c84-a3dd97cb53a1" spellcheck="false" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsArchived" columntype="boolean" guid="41cad1db-9aa7-4818-ae85-a9651578e554" system="true"><properties><defaultvalue>false</defaultvalue><fieldcaption>DocumentID</fieldcaption></properties><settings><controlname>labelcontrol</controlname></settings></field><field allowempty="true" column="DocumentWorkflowCycleGUID" columntype="guid" guid="7a8dbf8e-a387-4068-b255-247eff08351a" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentIsWaitingForTranslation" columntype="boolean" guid="ab09e46a-07b9-4bc2-be12-7c5c54840ba9" system="true"><properties><defaultvalue>false</defaultvalue></properties><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUName" columnsize="440" columntype="text" guid="32f0a3cf-cb9f-490e-a737-362123ec3cd4" system="true"><settings><controlname>dropdownlistcontrol</controlname></settings></field><field allowempty="true" column="DocumentSKUDescription" columntype="longtext" guid="1f04c541-6ebe-412f-94ee-ddd370c46044" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><MediaDialogConfiguration>True</MediaDialogConfiguration><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentSKUShortDescription" columntype="longtext" guid="6a14a367-6f85-4da9-9430-5aa4a6f037c4" system="true"><settings><Autoresize_Hashtable>True</Autoresize_Hashtable><controlname>bbeditorcontrol</controlname><Dialogs_Anchor_Hide>False</Dialogs_Anchor_Hide><Dialogs_Attachments_Hide>False</Dialogs_Attachments_Hide><Dialogs_Content_Hide>False</Dialogs_Content_Hide><Dialogs_Email_Hide>False</Dialogs_Email_Hide><Dialogs_Libraries_Hide>False</Dialogs_Libraries_Hide><Dialogs_Web_Hide>False</Dialogs_Web_Hide><ShowAdvancedImage>False</ShowAdvancedImage><ShowAdvancedUrl>False</ShowAdvancedUrl></settings></field><field allowempty="true" column="DocumentWorkflowActionStatus" columnsize="450" columntype="text" guid="11d7b5dd-fae8-4f61-af02-ca3a196abcb3" system="true" visible="true"><properties><fieldcaption>DocumentWorkflowActionStatus</fieldcaption></properties><settings><AutoCompleteEnableCaching>False</AutoCompleteEnableCaching><AutoCompleteFirstRowSelected>False</AutoCompleteFirstRowSelected><AutoCompleteShowOnlyCurrentWordInCompletionListItem>False</AutoCompleteShowOnlyCurrentWordInCompletionListItem><controlname>textboxcontrol</controlname><FilterMode>False</FilterMode><Trim>False</Trim></settings></field><field column="DocumentCanBePublished" columntype="boolean" guid="8d5d0089-266a-4f9d-9810-05cdb52f8cde" system="true"><properties><defaultvalue>True</defaultvalue></properties></field><field allowempty="true" column="DocumentPageBuilderWidgets" columntype="longtext" guid="b3a3768e-3dfa-4f7c-9e62-de84dd322812" system="true" /><field allowempty="true" column="DocumentPageTemplateConfiguration" columntype="longtext" guid="27ca67f3-bdeb-491e-b96b-8d52bac7d57a" system="true" /><field allowempty="true" column="DocumentABTestConfiguration" columntype="longtext" guid="639cb356-b9c0-4714-99a8-faf4924d06da" system="true" /><field column="DocumentShowInMenu" columntype="boolean" guid="480c8c29-fd4f-4e0a-b002-b3674de8c2ca" system="true" visible="true"><properties><defaultvalue>False</defaultvalue><fieldcaption>DocumentShowInMenu</fieldcaption></properties><settings><controlname>CheckBoxControl</controlname></settings></field><field allowempty="true" column="DocumentUnpublishedRedirectUrl" columnsize="450" columntype="text" guid="5112f255-bc7d-42b2-b24a-a9008ba2564d" system="true"><properties><fieldcaption>DocumentUnpublishedRedirectUrl</fieldcaption></properties><settings><controlname>URLSelector</controlname></settings></field></form>'
	WHERE [ClassName] = 'cms.document';
END
GO

-- HF13-535
DECLARE @HOTFIXVERSION INT;
SET @HOTFIXVERSION = (SELECT [KeyValue] FROM [CMS_SettingsKey] WHERE [KeyName] = N'CMSHotfixVersion')
IF @HOTFIXVERSION < 192
BEGIN
	IF EXISTS (SELECT 1 FROM CMS_SettingsKey WHERE [KeyName] = 'CMSRichTextEditorLicense')
	BEGIN
		UPDATE [CMS_SettingsKey] SET [KeyValue] = 'Ja2A4wD4B1F2B1D4I4nDc2YRTYKg1Dc2a1JVVG1VJKKYLMPvA1E1H1A1B8C7B5E1F5E4=='
		WHERE [KeyName] = 'CMSRichTextEditorLicense';
	END
END
GO
/* ----------------------------------------------------------------------------*/
/* This SQL command must be at the end and must contain current hotfix version */
/* ----------------------------------------------------------------------------*/
UPDATE [CMS_SettingsKey] SET KeyValue = '192' WHERE KeyName = N'CMSHotfixVersion'
GO

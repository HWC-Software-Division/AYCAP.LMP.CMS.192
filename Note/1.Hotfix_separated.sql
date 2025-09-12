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
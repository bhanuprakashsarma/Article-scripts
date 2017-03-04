CREATE TABLE [dbo].[APEXSQL_BEFORE_AFTER_DATABASE] (
	[ID] [int] NOT NULL,
	[SERVER] [nvarchar](128) NULL,
	[DATABASE] [nvarchar](128) NULL,
	PRIMARY KEY CLUSTERED ([ID] ASC) WITH (
		PAD_INDEX = OFF,
		STATISTICS_NORECOMPUTE = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
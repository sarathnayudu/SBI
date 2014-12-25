CREATE TABLE [dbo].[tblEmail](
	[ID] [uniqueidentifier] NULL,
	[From_Email] [varchar](100) NULL,
	[Password] [varchar](20) NULL,
	[To_Emails] [varchar](500) NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[tblState](
	[StateID] [varchar](2) NOT NULL,
	[State] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'AK','Alaska'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'AL','Alabama'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'AR','Arkansas'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'AZ','Arizona'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'CA','California'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'CO','Colarado'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'CT','Connecticut'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'DC','Delaware'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'DE','District'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'FL','Florida'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'GA','Georgia'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'HI','Hawaii'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'IA','Iowa'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'ID','Idaho'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'IL','Illinois'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'IN','Indiana'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'KS','Kansas'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'KY','Kentucky'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'LA','Louisiana'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MA','Massachusetts'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MD','Maryland'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'ME','Maine'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MI','Michigan'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MN','Minnesota'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MO','Missouri'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MS','Mississippi'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'MT','Montana'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NC','North Carolina'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'ND','North Dakota'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NE','Nebraska'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NH','New Hampshire'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NJ','New Jersey'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NM','New Mexico'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NV','Nevada'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'NY','New York'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'OH','Ohio'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'OK','Oklahoma'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'OR','Oregon'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'PA','penssylvania'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'RI','Rhode Island'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'SC','South Carolina'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'SD','South Dakota'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'TN','Tennessee'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'TX','Texas'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'UT','Utah'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'VA','Virginia'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'VT','Vermont'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'WA','Washington'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'WI','Wisconsin'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'WV','West Virginia'
INSERT INTO [dbo].[tblState] ([StateID],[State]) SELECT 'WY','Wyoming'
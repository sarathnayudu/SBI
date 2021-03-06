/****** Object:  Table [dbo].[tblTimeOffType]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTimeOffType](
	[PK_TimeOffTypeID] [uniqueidentifier] NOT NULL,
	[TimeOffDescription] [varchar](50) NOT NULL,
	[Rec_CreatedBy] [varchar](200) NULL,
	[Rec_CreatedDate] [datetime] NULL,
	[Rec_ModifiedBy] [varchar](200) NULL,
	[Rec_ModifiedDate] [datetime] NULL,
	[ActiveFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_TimeOffTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblState](
	[StateID] [varchar](2) NOT NULL,
	[State] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPageDetails]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPageDetails](
	[Pk_PageID] [uniqueidentifier] NOT NULL,
	[Page_Name] [varchar](100) NOT NULL,
	[Page_Path] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk_PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHolidays]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHolidays](
	[PK_HolidaysID] [uniqueidentifier] NOT NULL,
	[Holidays_Name] [varchar](100) NULL,
	[Holidays_Description] [varchar](800) NULL,
	[Holidays_Date] [datetime] NULL,
	[Rec_CreatedBy] [varchar](200) NULL,
	[Rec_CreatedDate] [datetime] NULL,
	[Rec_ModifiedBy] [varchar](200) NULL,
	[Rec_ModifiedDate] [datetime] NULL,
	[ActiveFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_HolidaysID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrganization]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblOrganization](
	[Pk_OrgID] [uniqueidentifier] NOT NULL,
	[Org_Name] [varchar](100) NOT NULL,
	[Org_Address1] [varchar](100) NOT NULL,
	[Org_Address2] [varchar](100) NULL,
	[Org_City] [varchar](100) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tblOrganization] ADD [Org_State] [varchar](2) NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[tblOrganization] ADD [Org_PostalCode] [varchar](15) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Org_Phone#] [varchar](20) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Org_EmailID] [varchar](150) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Org_Fax] [char](12) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Org_Website_URL] [varchar](250) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Rec_CreatedBy] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Rec_CreatedDate] [datetime] NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Rec_ModifiedBy] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD [Rec_ModifiedDate] [datetime] NOT NULL
ALTER TABLE [dbo].[tblOrganization] ADD PRIMARY KEY CLUSTERED 
(
	[Pk_OrgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrgCustomers]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrgCustomers](
	[PKCustID] [uniqueidentifier] NOT NULL,
	[FK_OrgID] [uniqueidentifier] NULL,
	[Cust_Name] [varchar](100) NOT NULL,
	[Cust_WebSiteURL] [varchar](100) NOT NULL,
	[Cust_Phone] [varchar](20) NOT NULL,
	[Cust_fax] [varchar](15) NOT NULL,
	[Cust_Contact_Name] [varchar](100) NOT NULL,
	[Cust_Contact_EmailAddress] [varchar](100) NOT NULL,
	[Cust_Contact_Phone] [varchar](20) NOT NULL,
	[Cust_AltContact_Name] [varchar](100) NOT NULL,
	[Cust_AltContact_EmailAddress] [varchar](100) NOT NULL,
	[Cust_AltContact_Phone] [varchar](20) NOT NULL,
	[Cust_ShipTo_Address1] [varchar](100) NOT NULL,
	[Cust_ShipTo_Address2] [varchar](100) NOT NULL,
	[Cust_ShipTo_City] [varchar](100) NOT NULL,
	[Cust_ShipTo_State] [varchar](2) NULL,
	[Cust_ShipTo_PostalCode] [char](10) NOT NULL,
	[Cust_BillTo_Address1] [varchar](100) NOT NULL,
	[Cust_BillTo_Address2] [varchar](100) NOT NULL,
	[Cust_BillTo_City] [varchar](100) NOT NULL,
	[Cust_BillTo_State] [varchar](2) NULL,
	[Cust_BillTo_PostalCode] [char](10) NOT NULL,
	[Rec_CreatedBy] [varchar](100) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](100) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCustID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrgClientType]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrgClientType](
	[PK_Org_ClientTypeID] [uniqueidentifier] NOT NULL,
	[FK_OrgID] [uniqueidentifier] NULL,
	[Org_ClientType] [varchar](200) NOT NULL,
	[Rec_CreatedBy] [varchar](200) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](200) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Org_ClientTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrgVendors]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrgVendors](
	[PKCustID] [uniqueidentifier] NOT NULL,
	[FK_OrgID] [uniqueidentifier] NULL,
	[Vendor_Name] [varchar](100) NOT NULL,
	[Vendor_WebSiteURL] [varchar](100) NOT NULL,
	[Vendor_Phone] [varchar](20) NOT NULL,
	[Vendor_fax] [varchar](15) NOT NULL,
	[Vendor_Contact_Name] [varchar](100) NOT NULL,
	[Vendor_Contact_EmailAddress] [varchar](100) NOT NULL,
	[Vendor_Contact_Phone] [varchar](20) NOT NULL,
	[Vendor_AltContact_Name] [varchar](100) NOT NULL,
	[Vendor_AltContact_EmailAddress] [varchar](100) NOT NULL,
	[Vendor_AltContact_Phone] [varchar](20) NOT NULL,
	[Vendor_ShipTo_Address1] [varchar](100) NOT NULL,
	[Vendor_ShipTo_Address2] [varchar](100) NOT NULL,
	[Vendor_ShipTo_City] [varchar](100) NOT NULL,
	[Vendor_ShipTo_State] [varchar](2) NULL,
	[Vendor_ShipTo_PostalCode] [char](10) NOT NULL,
	[Vendor_BillTo_Address1] [varchar](100) NOT NULL,
	[Vendor_BillTo_Address2] [varchar](100) NOT NULL,
	[Vendor_BillTo_City] [varchar](100) NOT NULL,
	[Vendor_BillTo_State] [varchar](2) NULL,
	[Vendor_BillTo_PostalCode] [char](10) NOT NULL,
	[Rec_CreatedBy] [varchar](100) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](100) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
	[Vend_LoginPwd] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCustID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrgRoles]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrgRoles](
	[PK_Org_RoleID] [uniqueidentifier] NOT NULL,
	[FK_OrgID] [uniqueidentifier] NULL,
	[Org_Role_Name] [varchar](50) NOT NULL,
	[Org_Role_Description] [varchar](100) NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Org_RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRolePermissions]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRolePermissions](
	[PK_RolePermission_ID] [uniqueidentifier] NOT NULL,
	[Fk_PageID] [uniqueidentifier] NOT NULL,
	[PermissionType] [varchar](7) NOT NULL,
	[FK_Org_RoleID] [uniqueidentifier] NOT NULL,
	[Rec_CreatedBy] [varchar](200) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](200) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVendInvoice]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVendInvoice](
	[InvoiceID] [uniqueidentifier] NULL,
	[FKCustID] [uniqueidentifier] NULL,
	[Invoice_Amnt] [decimal](8, 2) NULL,
	[Consult_Name] [varchar](50) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Invoice_path] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVendInsCertificate]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVendInsCertificate](
	[InsID] [uniqueidentifier] NULL,
	[FKCustID] [uniqueidentifier] NULL,
	[Effect_End_Date] [datetime] NULL,
	[Certif_path] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrgEmployees]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblOrgEmployees](
	[PK_Org_EmpID] [uniqueidentifier] NOT NULL,
	[Emp_Code] [varchar](10) NOT NULL,
	[FK_OrgID] [uniqueidentifier] NULL,
	[Emp_Fname] [varchar](100) NOT NULL,
	[Emp_MName] [varchar](100) NOT NULL,
	[Emp_Lname] [varchar](100) NOT NULL,
	[Emp_Prefix] [varchar](5) NOT NULL,
	[Emp_CellPhone] [char](12) NOT NULL,
	[Emp_HomePhone] [char](12) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_BusinessPhone] [char](16) NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_EmailID] [varchar](35) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_AlternateEmail] [varchar](35) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_JobTitle] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_LoginPwd] [varchar](20) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_HireDate] [datetime] NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_TerminationDate] [datetime] NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Home_Address1] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Home_Address2] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Home_City] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Home_State] [varchar](2) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Home_PostalCode] [varchar](15) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Bus_Address1] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Bus_Address2] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Bus_City] [varchar](100) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Bus_State] [varchar](2) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Bus_PostalCode] [varchar](15) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [FK_Org_Roles] [uniqueidentifier] NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Rec_CreatedBy] [varchar](200) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Rec_CreatedDate] [datetime] NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Rec_ModifiedBy] [varchar](200) NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Rec_ModifiedDate] [datetime] NOT NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [ActiveFlag] [bit] NOT NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Categ] [varchar](100) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Emp_Salary] [decimal](8, 2) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Doc_Number] [varchar](50) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Doc_ExpDate] [datetime] NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [LCA_Number] [varchar](50) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [LCA_ExpDate] [datetime] NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [Perm_CertNumber] [varchar](50) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [I140_Number] [varchar](50) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD [I485_Number] [varchar](50) NULL
ALTER TABLE [dbo].[tblOrgEmployees] ADD PRIMARY KEY CLUSTERED 
(
	[PK_Org_EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
ALTER TABLE [dbo].[tblOrgEmployees] ADD UNIQUE NONCLUSTERED 
(
	[Emp_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployeeTimeOff]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployeeTimeOff](
	[PK_EmpTimeOffID] [uniqueidentifier] NOT NULL,
	[FK_Org_EmpID] [uniqueidentifier] NULL,
	[FK_TimeOffTypeID] [uniqueidentifier] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[FileName] [varchar](500) NULL,
	[FilePath] [varchar](max) NULL,
	[Approved_Status] [varchar](15) NULL,
	[Rec_CreatedBy] [varchar](200) NULL,
	[Rec_CreatedDate] [datetime] NULL,
	[Rec_ModifiedBy] [varchar](200) NULL,
	[Rec_ModifiedDate] [datetime] NULL,
	[Comments] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_EmpTimeOffID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTimeSheets]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTimeSheets](
	[PK_TimeSheetID] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Mon] [decimal](5, 1) NOT NULL,
	[Tue] [decimal](5, 1) NOT NULL,
	[Wed] [decimal](5, 1) NOT NULL,
	[Thu] [decimal](5, 1) NOT NULL,
	[Fri] [decimal](5, 1) NOT NULL,
	[Sat] [decimal](5, 1) NOT NULL,
	[Sun] [decimal](5, 1) NOT NULL,
	[Total] [decimal](5, 1) NOT NULL,
	[TSFileName] [varchar](100) NULL,
	[TSFilePath] [varchar](1000) NULL,
	[FK_Org_EmpID] [uniqueidentifier] NOT NULL,
	[Rec_CreatedBy] [varchar](200) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](200) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
	[TSStatus] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_TimeSheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProjects]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProjects](
	[PK_Org_ProjectID] [uniqueidentifier] NOT NULL,
	[FK_Org_EmpID] [uniqueidentifier] NOT NULL,
	[Proj_Code] [varchar](10) NOT NULL,
	[Proj_name] [varchar](100) NOT NULL,
	[Proj_Description] [varchar](250) NOT NULL,
	[Proj_StartDate] [datetime] NOT NULL,
	[Proj_EndDate] [datetime] NOT NULL,
	[FK_Client1] [uniqueidentifier] NULL,
	[FK_Client2] [uniqueidentifier] NULL,
	[FK_EndClient] [uniqueidentifier] NULL,
	[BillRate] [decimal](5, 2) NULL,
	[BillingCycle] [int] NULL,
	[OverTime_Allowed] [bit] NULL,
	[OverTime_Rate] [decimal](5, 2) NULL,
	[Rec_CreatedBy] [varchar](200) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](200) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Org_ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Proj_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTasks]    Script Date: 08/16/2012 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTasks](
	[PK_TaskID] [uniqueidentifier] NOT NULL,
	[FK_Org_EmpID] [uniqueidentifier] NOT NULL,
	[FK_TimeSheetID] [uniqueidentifier] NOT NULL,
	[Task_Number] [int] NOT NULL,
	[Task_Date] [datetime] NOT NULL,
	[Task_Name] [varchar](500) NOT NULL,
	[Task_Description] [varchar](max) NULL,
	[Rec_CreatedBy] [varchar](200) NOT NULL,
	[Rec_CreatedDate] [datetime] NOT NULL,
	[Rec_ModifiedBy] [varchar](200) NOT NULL,
	[Rec_ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__tblEmploy__Appro__68D28DBC]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblEmployeeTimeOff] ADD  DEFAULT ('Pending') FOR [Approved_Status]
GO
/****** Object:  Default [DF__tblTimeShee__Mon__1A69E950]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Mon]
GO
/****** Object:  Default [DF__tblTimeShee__Tue__1B5E0D89]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Tue]
GO
/****** Object:  Default [DF__tblTimeShee__Wed__1C5231C2]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Wed]
GO
/****** Object:  Default [DF__tblTimeShee__Thu__1D4655FB]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Thu]
GO
/****** Object:  Default [DF__tblTimeShee__Fri__1E3A7A34]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Fri]
GO
/****** Object:  Default [DF__tblTimeShee__Sat__1F2E9E6D]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Sat]
GO
/****** Object:  Default [DF__tblTimeShee__Sun__2022C2A6]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Sun]
GO
/****** Object:  Default [DF__tblTimeSh__Total__2116E6DF]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [Total]
GO
/****** Object:  Default [DF__tblTimeSh__Activ__22FF2F51]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [ActiveFlag]
GO
/****** Object:  Default [DF__tblTimeSh__TSSta__23F3538A]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets] ADD  DEFAULT ((0)) FOR [TSStatus]
GO
/****** Object:  ForeignKey [FK__tblEmploy__FK_Or__66EA454A]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblEmployeeTimeOff]  WITH CHECK ADD FOREIGN KEY([FK_Org_EmpID])
REFERENCES [dbo].[tblOrgEmployees] ([PK_Org_EmpID])
GO
/****** Object:  ForeignKey [FK__tblEmploy__FK_Ti__67DE6983]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblEmployeeTimeOff]  WITH CHECK ADD FOREIGN KEY([FK_TimeOffTypeID])
REFERENCES [dbo].[tblTimeOffType] ([PK_TimeOffTypeID])
GO
/****** Object:  ForeignKey [Fk_StateID]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrganization]  WITH CHECK ADD  CONSTRAINT [Fk_StateID] FOREIGN KEY([Org_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
ALTER TABLE [dbo].[tblOrganization] CHECK CONSTRAINT [Fk_StateID]
GO
/****** Object:  ForeignKey [FK__tblOrgCli__FK_Or__282DF8C2]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgClientType]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCli__FK_Or__4277DAAA]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgClientType]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCli__FK_Or__436BFEE3]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgClientType]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCli__FK_Or__50C5FA01]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgClientType]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCli__FK_Or__51BA1E3A]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgClientType]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCus__Cust___22751F6C]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgCustomers]  WITH CHECK ADD FOREIGN KEY([Cust_ShipTo_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblOrgCus__Cust___236943A5]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgCustomers]  WITH CHECK ADD FOREIGN KEY([Cust_BillTo_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblOrgCus__FK_Or__2180FB33]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgCustomers]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCus__FK_Or__4460231C]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgCustomers]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgCus__FK_Or__52AE4273]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgCustomers]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__Emp_B__4C6B5938]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([Emp_Bus_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__Emp_H__4D5F7D71]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([Emp_Home_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__45544755]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__46486B8E]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_Org_Roles])
REFERENCES [dbo].[tblOrgRoles] ([PK_Org_RoleID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__4E53A1AA]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__4F47C5E3]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_Org_Roles])
REFERENCES [dbo].[tblOrgRoles] ([PK_Org_RoleID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__53A266AC]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgEmp__FK_Or__54968AE5]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgEmployees]  WITH CHECK ADD FOREIGN KEY([FK_Org_Roles])
REFERENCES [dbo].[tblOrgRoles] ([PK_Org_RoleID])
GO
/****** Object:  ForeignKey [FK__tblOrgRol__FK_Or__339FAB6E]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgRoles]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgRol__FK_Or__473C8FC7]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgRoles]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgRol__FK_Or__558AAF1E]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgRoles]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgVen__FK_Or__2CF2ADDF]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgVendors]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgVen__FK_Or__4830B400]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgVendors]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgVen__FK_Or__567ED357]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgVendors]  WITH CHECK ADD FOREIGN KEY([FK_OrgID])
REFERENCES [dbo].[tblOrganization] ([Pk_OrgID])
GO
/****** Object:  ForeignKey [FK__tblOrgVen__Vendo__2DE6D218]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgVendors]  WITH CHECK ADD FOREIGN KEY([Vendor_ShipTo_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblOrgVen__Vendo__2EDAF651]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblOrgVendors]  WITH CHECK ADD FOREIGN KEY([Vendor_BillTo_State])
REFERENCES [dbo].[tblState] ([StateID])
GO
/****** Object:  ForeignKey [FK__tblProjec__FK_Cl__3429BB53]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblProjects]  WITH CHECK ADD FOREIGN KEY([FK_Client1])
REFERENCES [dbo].[tblOrgCustomers] ([PKCustID])
GO
/****** Object:  ForeignKey [FK__tblProjec__FK_Cl__351DDF8C]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblProjects]  WITH CHECK ADD FOREIGN KEY([FK_Client2])
REFERENCES [dbo].[tblOrgCustomers] ([PKCustID])
GO
/****** Object:  ForeignKey [FK__tblProjec__FK_En__361203C5]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblProjects]  WITH CHECK ADD FOREIGN KEY([FK_EndClient])
REFERENCES [dbo].[tblOrgCustomers] ([PKCustID])
GO
/****** Object:  ForeignKey [FK__tblProjec__FK_Or__370627FE]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblProjects]  WITH CHECK ADD FOREIGN KEY([FK_Org_EmpID])
REFERENCES [dbo].[tblOrgEmployees] ([PK_Org_EmpID])
GO
/****** Object:  ForeignKey [FK__tblRolePe__FK_Or__607251E5]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblRolePermissions]  WITH CHECK ADD FOREIGN KEY([FK_Org_RoleID])
REFERENCES [dbo].[tblOrgRoles] ([PK_Org_RoleID])
GO
/****** Object:  ForeignKey [FK__tblRolePe__Fk_Pa__5F7E2DAC]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblRolePermissions]  WITH CHECK ADD FOREIGN KEY([Fk_PageID])
REFERENCES [dbo].[tblPageDetails] ([Pk_PageID])
GO
/****** Object:  ForeignKey [FK__tblTasks__FK_Org__33008CF0]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD FOREIGN KEY([FK_Org_EmpID])
REFERENCES [dbo].[tblOrgEmployees] ([PK_Org_EmpID])
GO
/****** Object:  ForeignKey [FK__tblTasks__FK_Tim__33F4B129]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD FOREIGN KEY([FK_TimeSheetID])
REFERENCES [dbo].[tblTimeSheets] ([PK_TimeSheetID])
GO
/****** Object:  ForeignKey [FK__tblTimeSh__FK_Or__220B0B18]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblTimeSheets]  WITH CHECK ADD FOREIGN KEY([FK_Org_EmpID])
REFERENCES [dbo].[tblOrgEmployees] ([PK_Org_EmpID])
GO
/****** Object:  ForeignKey [FK__tblVendIn__FKCus__3AA1AEB8]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblVendInsCertificate]  WITH CHECK ADD FOREIGN KEY([FKCustID])
REFERENCES [dbo].[tblOrgVendors] ([PKCustID])
GO
/****** Object:  ForeignKey [FK__tblVendIn__FKCus__38B96646]    Script Date: 08/16/2012 16:48:07 ******/
ALTER TABLE [dbo].[tblVendInvoice]  WITH CHECK ADD FOREIGN KEY([FKCustID])
REFERENCES [dbo].[tblOrgVendors] ([PKCustID])
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblDocuments](
	[DocID] [uniqueidentifier] NULL,
	[Doc_Title] [varchar](200) NULL,
	[Doc_Path] [varchar](200) NULL,
	[Doc_Type] [varchar](100) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[tblEmail]    Script Date: 08/26/2012 21:35:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblEmail](
	[ID] [uniqueidentifier] NULL,
	[From_Email] [varchar](100) NULL,
	[Password] [varchar](20) NULL,
	[To_Emails] [varchar](500) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO





-------------------------------------- Insert Scripts -----------------------------------------------------

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


INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '79E4AF03-79D5-4301-8DA4-4B62D9B520D2','My TimeOff','MyTimeOff.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '7F06FACE-9C51-4A44-9EE4-5D97B9179ECD','My Profile','MyProfile.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT 'E6608DB2-55D0-4C71-AA87-7C9C4BF60266','My Documents','MyDocuments.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '26D3580B-6168-4087-B0B2-82BE9FAF4FEA','My Projects','MyProjects.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '3A42471E-6E4B-430B-83AA-89C90A451D98','My Timesheet','MyTimesheet.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '469F50F7-E839-4727-8DA1-8D7730FEFD6F','Vendor','Vendor.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT 'CB0BBE40-AC19-4410-85DB-94CBDEF403E5','Customer','Customer.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '5097107B-85AD-4A22-875D-A45BA951F202','Admin Options','AdminOptions.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '8A2A2C3E-8470-40DF-984F-E7CDBF4D74E8','Employee','Employee.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '008A536C-0799-4BF3-9314-F667CC77AD05','Organization','Organization.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '008A536C-0799-4BF3-9324-F667CC77AD06','Projects Detail','ProjectsDetail.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '268829B4-0E08-4D6B-9635-FF6600D9D8D4','Time Off Admin','AppTimeOff.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '318829B6-0E08-4D6B-9635-FF6600D9D8D4','Timesheet Admin','AppTimesheet.aspx'
INSERT INTO [dbo].[tblPageDetails] ([Pk_PageID],[Page_Name],[Page_Path]) SELECT '9C763FAB-6803-4621-B23B-FFC330DC23F8','Email Admin','SendMail.aspx'


insert tblOrganization values(NEWID(),'XXXX','',null,'',null,'','','','','','',GetDate(),'',GetDate())

insert tblOrgRoles select NEWID(),(select fK_OrgID=(select top 1 Pk_OrgID from tblOrganization)),'Admin','',1
insert tblOrgRoles select NEWID(),(select fK_OrgID=(select top 1 Pk_OrgID from tblOrganization)),'Employee','',1


insert tblOrgEmployees select NEWID(),'Admin',(select fK_OrgID=(select top 1 Pk_OrgID from tblOrganization)),'Admin',
'','Manager','1','','','','','','','admin','','','','','',null,'','','','',null,'',
(select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'','','','',1,'',null,null,null,null,null,
null,null,null


 insert tblRolePermissions select NewID(),'79e4af03-79d5-4301-8da4-4b62d9b520d2','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'7f06face-9c51-4a44-9ee4-5d97b9179ecd','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'e6608db2-55d0-4c71-aa87-7c9c4bf60266','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'26d3580b-6168-4087-b0b2-82be9faf4fea','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'3a42471e-6e4b-430b-83aa-89c90a451d98','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'469f50f7-e839-4727-8da1-8d7730fefd6f','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'cb0bbe40-ac19-4410-85db-94cbdef403e5','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'5097107b-85ad-4a22-875d-a45ba951f202','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'8a2a2c3e-8470-40df-984f-e7cdbf4d74e8','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'008a536c-0799-4bf3-9314-f667cc77ad05','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'008a536c-0799-4bf3-9324-f667cc77ad06','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'268829b4-0e08-4d6b-9635-ff6600d9d8d4','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'318829b6-0e08-4d6b-9635-ff6600d9d8d4','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
  insert tblRolePermissions select NewID(),'9c763fab-6803-4621-b23b-ffc330dc23f8','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Admin')),'',GETDATE(),'',GETDATE(),1
 
 insert tblRolePermissions select NewID(),'79E4AF03-79D5-4301-8DA4-4B62D9B520D2','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1
insert tblRolePermissions select NewID(),'7F06FACE-9C51-4A44-9EE4-5D97B9179ECD','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1
insert tblRolePermissions select NewID(),'E6608DB2-55D0-4C71-AA87-7C9C4BF60266','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1
insert tblRolePermissions select NewID(),'26D3580B-6168-4087-B0B2-82BE9FAF4FEA','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1
insert tblRolePermissions select NewID(),'3A42471E-6E4B-430B-83AA-89C90A451D98','A,V,D,E',
 (select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1
 
 
 
 
 

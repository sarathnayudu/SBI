/****** Object:  StoredProcedure [dbo].[sp_GetTimeOffType]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetTimeOffType]
(
@PK_TimeOffTypeID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblTimeOffType where 
 (PK_TimeOffTypeID=@PK_TimeOffTypeID or @PK_TimeOffTypeID is null) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetState]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetState] with Encryption
as
begin
 select * from tblState
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPageDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetPageDetails]
(
@Pk_PageID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblPageDetails where Pk_PageID=@Pk_PageID or @Pk_PageID is null
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtHolidays]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtHolidays] 
(
    @PK_HolidaysID uniqueidentifier=null,
	@Holidays_Name varchar(100),
	@Holidays_Description varchar(800),
	@Holidays_Date datetime,
	@Rec_CreatedBy varchar(200),
	@Rec_CreatedDate datetime,
	@Rec_ModifiedBy varchar(200),
	@Rec_ModifiedDate datetime,
	@ActiveFlag bit 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblHolidays where PK_HolidaysID=@PK_HolidaysID)=0)
    begin			
	 insert tblHolidays values(NewID(),@Holidays_Name,@Holidays_Description,@Holidays_Date,@Rec_CreatedBy,@Rec_CreatedDate,
	 @Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Holidays Details Has Been Successfully Submitted'		 
    end	 
     
	 else
		  begin
			   update tblHolidays set Holidays_Name=@Holidays_Name,Holidays_Description=@Holidays_Description,Holidays_Date=@Holidays_Date,
			   Rec_CreatedBy=@Rec_CreatedBy,Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
			   ActiveFlag=@ActiveFlag
			   where PK_HolidaysID=@PK_HolidaysID
			   set @strMsg='Holidays Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelHolidays]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelHolidays]
(
 @PK_HolidaysID uniqueidentifier
) with Encryption
as
begin
 delete tblHolidays where PK_HolidaysID=@PK_HolidaysID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelTimeOffType]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelTimeOffType]
(
 @PK_TimeOffTypeID uniqueidentifier
) with Encryption
as
begin
 delete tblTimeOffType where PK_TimeOffTypeID=@PK_TimeOffTypeID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHolidays]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetHolidays]
(
@PK_HolidaysID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblHolidays where 
 (PK_HolidaysID=@PK_HolidaysID or @PK_HolidaysID is null) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtTimeOffType]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtTimeOffType] 
(
    @PK_TimeOffTypeID uniqueidentifier=null,
	@TimeOffDescription varchar(50),	
	@Rec_CreatedBy varchar(200),
	@Rec_CreatedDate datetime,
	@Rec_ModifiedBy varchar(200),
	@Rec_ModifiedDate datetime,
	@ActiveFlag bit 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblTimeOffType where PK_TimeOffTypeID=@PK_TimeOffTypeID)=0)
    begin			
	 insert tblTimeOffType values(NewID(),@TimeOffDescription,@Rec_CreatedBy,@Rec_CreatedDate,
	 @Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Timeoff Type Details Has Been Successfully Submitted'		 
    end	 
     
	 else
		  begin
			   update tblTimeOffType set TimeOffDescription=@TimeOffDescription,Rec_CreatedBy=@Rec_CreatedBy,
			   Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
			   ActiveFlag=@ActiveFlag
			   where PK_TimeOffTypeID=@PK_TimeOffTypeID
			   set @strMsg='Timeoff Type Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrganization]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrganization] 
(
    @Pk_OrgID uniqueidentifier=null ,
	@Org_Name varchar(100) ,
	@Org_Address1 varchar(100) ,
	@Org_Address2 varchar(100) ,
	@Org_City varchar(100) ,
	@Org_State  varchar(2)=null ,
	@Org_PostalCode varchar(15) ,
	@Org_Phone# varchar(20) ,
	@Org_EmailID varchar(150) ,
	@Org_Fax char(12) ,
	@Org_Website_URL varchar(250) ,
	@Rec_CreatedBy varchar(100) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(100) ,
	@Rec_ModifiedDate datetime 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrganization where Pk_OrgID=@Pk_OrgID)=0)
    begin			
	 insert tblOrganization values(NewID(),@Org_Name,@Org_Address1,@Org_Address2,@Org_City,@Org_State,@Org_PostalCode,@Org_Phone#,@Org_EmailID,
	 @Org_Fax,@Org_Website_URL,@Rec_CreatedBy,@Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate)
	 set @strMsg='Organization Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrganization set Org_Name=@Org_Name,Org_Address1=@Org_Address1,Org_Address2=@Org_Address2,
			   Org_City=@Org_City,Org_State=@Org_State,Org_PostalCode=@Org_PostalCode,Org_Phone#=@Org_Phone#,
			   Org_EmailID=@Org_EmailID,Org_Fax=@Org_Fax,Org_Website_URL=@Org_Website_URL,Rec_CreatedBy=@Rec_CreatedBy,
			   Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate
			   where Pk_OrgID=@Pk_OrgID
			   set @strMsg='Organization Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgDetails]
(
@Pk_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrganization where Pk_OrgID=@Pk_OrgID or @Pk_OrgID is null
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelOrgCustomers]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DelOrgCustomers]
(
 @PKCustID uniqueidentifier
) with Encryption
as
begin
 delete tblOrgCustomers where PKCustID=@PKCustID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgCustDetails]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgCustDetails]
(
@PKCustID uniqueidentifier=null,
@FK_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrgCustomers where 
 (PKCustID=@PKCustID or @PKCustID is null) and
 (FK_OrgID=@FK_OrgID or @FK_OrgID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgCliTypDetails]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgCliTypDetails]
(
@PK_Org_ClientTypeID uniqueidentifier=null,
@FK_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrgClientType where 
 (PK_Org_ClientTypeID=@PK_Org_ClientTypeID or @PK_Org_ClientTypeID is null) and
 (FK_OrgID=@FK_OrgID or @FK_OrgID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelOrgVendors]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DelOrgVendors]
(
 @PKCustID uniqueidentifier
) with Encryption
as
begin
 delete tblOrgVendors where PKCustID=@PKCustID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelOrgRoles]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DelOrgRoles]
(
 @PK_Org_RoleID uniqueidentifier
) with Encryption
as
begin
 delete tblOrgRoles where PK_Org_RoleID=@PK_Org_RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelCliTypDetails]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DelCliTypDetails]
(
 @PK_Org_ClientTypeID uniqueidentifier
) with Encryption
as
begin
 delete tblOrgClientType where PK_Org_ClientTypeID=@PK_Org_ClientTypeID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckVendorLogin]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CheckVendorLogin] 
(
@Vendor_Contact_EmailAddress varchar(100),
@Vend_LoginPwd varchar(20)
) with Encryption
as
 declare @strMsg varchar(200)
 declare @strCustID varchar(200)
begin
 
 if((select PKCustID from tblOrgVendors where (Vendor_Contact_EmailAddress=@Vendor_Contact_EmailAddress or (@Vendor_Contact_EmailAddress='Admin')) and Vend_LoginPwd=@Vend_LoginPwd
 COLLATE SQL_Latin1_General_CP1_CS_AS)is not null)
    begin
    
          if(@Vendor_Contact_EmailAddress!='Admin')
           begin
            set @strMsg='valid-'+(select Vendor_Contact_EmailAddress from tblOrgVendors where Vendor_Contact_EmailAddress=@Vendor_Contact_EmailAddress)                         
            set @strCustID= (select PKCustID from tblOrgVendors where Vendor_Contact_EmailAddress=@Vendor_Contact_EmailAddress)             
            set @strMsg=@strMsg+','+@strCustID
           end  
          else
            set @strMsg='valid-'+'admin'          
      
      end
    else
      begin
      set @strMsg='Sorry! Incorrect UserID or Password'
      end     
     
  select @strMsg                    
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrgCustomers]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrgCustomers] 
(
    @PKCustID uniqueidentifier =null,
	@FK_OrgID uniqueidentifier ,
	@Cust_Name varchar(100) ,
	@Cust_WebSiteURL varchar(100) ,
	@Cust_Phone varchar(20) ,
	@Cust_fax varchar(15) ,
	@Cust_Contact_Name varchar(100) ,
	@Cust_Contact_EmailAddress varchar(100) ,
	@Cust_Contact_Phone varchar(20) ,
	@Cust_AltContact_Name varchar(100) ,
	@Cust_AltContact_EmailAddress varchar(100) ,
	@Cust_AltContact_Phone varchar(20) ,
	@Cust_ShipTo_Address1 varchar(100) ,
	@Cust_ShipTo_Address2 varchar(100) ,
	@Cust_ShipTo_City varchar(100) ,
	@Cust_ShipTo_State varchar(2)=null ,
	@Cust_ShipTo_PostalCode char(10) ,
	@Cust_BillTo_Address1 varchar(100) ,
	@Cust_BillTo_Address2 varchar(100) ,
	@Cust_BillTo_City varchar(100) ,
	@Cust_BillTo_State varchar(2)=null ,
	@Cust_BillTo_PostalCode char(10) ,
	@Rec_CreatedBy varchar(100) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(100) ,
	@Rec_ModifiedDate datetime ,
	@ActiveFlag bit 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrgCustomers where PKCustID=@PKCustID)=0)
    begin			
	 insert tblOrgCustomers values(NewID(),@FK_OrgID,@Cust_Name,@Cust_WebSiteURL,@Cust_Phone,@Cust_fax,@Cust_Contact_Name,
	 @Cust_Contact_EmailAddress,@Cust_Contact_Phone,@Cust_AltContact_Name,@Cust_AltContact_EmailAddress,
	 @Cust_AltContact_Phone,@Cust_ShipTo_Address1,@Cust_ShipTo_Address2,@Cust_ShipTo_City,@Cust_ShipTo_State,@Cust_ShipTo_PostalCode,
	 @Cust_BillTo_Address1,@Cust_BillTo_Address2,@Cust_BillTo_City,@Cust_BillTo_State,@Cust_BillTo_PostalCode,@Rec_CreatedBy,
	 @Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Customer Details Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrgCustomers set FK_OrgID=@FK_OrgID,Cust_Name=@Cust_Name,Cust_WebSiteURL=@Cust_WebSiteURL,Cust_Phone=@Cust_Phone,
			   Cust_fax=@Cust_fax,Cust_Contact_Name=@Cust_Contact_Name,Cust_Contact_EmailAddress=@Cust_Contact_EmailAddress,
			   Cust_Contact_Phone=@Cust_Contact_Phone,Cust_AltContact_Name=@Cust_AltContact_Name,Cust_AltContact_EmailAddress=@Cust_AltContact_EmailAddress,
			 Cust_AltContact_Phone=@Cust_AltContact_Phone,Cust_ShipTo_Address1=@Cust_ShipTo_Address1,Cust_ShipTo_Address2=@Cust_ShipTo_Address2,
			 Cust_ShipTo_City=@Cust_ShipTo_City,Cust_ShipTo_State=@Cust_ShipTo_State,Cust_ShipTo_PostalCode=@Cust_ShipTo_PostalCode,
			 Cust_BillTo_Address1=@Cust_BillTo_Address1,Cust_BillTo_Address2=@Cust_BillTo_Address2,Cust_BillTo_City=@Cust_BillTo_City,
			 Cust_BillTo_State=@Cust_BillTo_State,Cust_BillTo_PostalCode=@Cust_BillTo_PostalCode,Rec_CreatedBy=@Rec_CreatedBy,
			 Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,ActiveFlag=@ActiveFlag
			   where PKCustID=@PKCustID
			   set @strMsg='Customer Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrgClientType]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrgClientType] 
(
    @PK_Org_ClientTypeID uniqueidentifier=null ,
	@FK_OrgID uniqueidentifier ,
	@Org_ClientType varchar(200) ,
	@Rec_CreatedBy varchar(200) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(200) ,
	@Rec_ModifiedDate datetime ,
	@ActiveFlag bit 
	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrgClientType where PK_Org_ClientTypeID=@PK_Org_ClientTypeID)=0)
    begin			
	 insert tblOrgClientType values(NewID(),@FK_OrgID,@Org_ClientType,@Rec_CreatedBy,@Rec_CreatedDate,
	 @Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Organization Client Type Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrgClientType set FK_OrgID=@FK_OrgID,Org_ClientType=@Org_ClientType,Rec_CreatedBy=@Rec_CreatedBy,
			   Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
			   ActiveFlag=@ActiveFlag
			   where PK_Org_ClientTypeID=@PK_Org_ClientTypeID
			   set @strMsg='Organization Client Type Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgVendors]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgVendors]
(
@PKCustID uniqueidentifier=null,
@FK_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrgVendors where 
 (PKCustID=@PKCustID or @PKCustID is null) and
 (FK_OrgID=@FK_OrgID or @FK_OrgID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgRoles]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgRoles]
(
@PK_Org_RoleID uniqueidentifier=null,
@FK_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrgRoles where 
 (PK_Org_RoleID=@PK_Org_RoleID or @PK_Org_RoleID is null) and
 (FK_OrgID=@FK_OrgID or @FK_OrgID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrgVendors]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrgVendors] 
(
    @PKCustID uniqueidentifier=null ,
	@FK_OrgID uniqueidentifier ,
	@Vendor_Name varchar(100) ,
	@Vendor_WebSiteURL varchar(100) ,
	@Vendor_Phone varchar(20) ,
	@Vendor_fax varchar(15) ,
	@Vendor_Contact_Name varchar(100) ,
	@Vendor_Contact_EmailAddress varchar(100) ,
	@Vendor_Contact_Phone varchar(20) ,
	@Vendor_AltContact_Name varchar(100) ,
	@Vendor_AltContact_EmailAddress varchar(100) ,
	@Vendor_AltContact_Phone varchar(20) ,
	@Vendor_ShipTo_Address1 varchar(100) ,
	@Vendor_ShipTo_Address2 varchar(100) ,
	@Vendor_ShipTo_City varchar(100) ,
	@Vendor_ShipTo_State varchar(2)=null ,
	@Vendor_ShipTo_PostalCode char(10) ,
	@Vendor_BillTo_Address1 varchar(100) ,
	@Vendor_BillTo_Address2 varchar(100) ,
	@Vendor_BillTo_City varchar(100) ,
	@Vendor_BillTo_State varchar(2)=null ,
	@Vendor_BillTo_PostalCode char(10) ,
	@Rec_CreatedBy varchar(100) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(100) ,
	@Rec_ModifiedDate datetime ,
	@ActiveFlag bit,
	@Vend_LoginPwd varchar(20)
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrgVendors where PKCustID=@PKCustID)=0)
    begin			
	 insert tblOrgVendors values(NewID(),@FK_OrgID,@Vendor_Name,@Vendor_WebSiteURL,@Vendor_Phone,@Vendor_fax,@Vendor_Contact_Name,
	 @Vendor_Contact_EmailAddress,@Vendor_Contact_Phone,@Vendor_AltContact_Name,@Vendor_AltContact_EmailAddress,
	 @Vendor_AltContact_Phone,@Vendor_ShipTo_Address1,@Vendor_ShipTo_Address2,@Vendor_ShipTo_City,@Vendor_ShipTo_State,@Vendor_ShipTo_PostalCode,
	 @Vendor_BillTo_Address1,@Vendor_BillTo_Address2,@Vendor_BillTo_City,@Vendor_BillTo_State,@Vendor_BillTo_PostalCode,@Rec_CreatedBy,
	 @Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag,@Vend_LoginPwd)
	 set @strMsg='Vendor Details Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrgVendors set FK_OrgID=@FK_OrgID,Vendor_Name=@Vendor_Name,Vendor_WebSiteURL=@Vendor_WebSiteURL,Vendor_Phone=@Vendor_Phone,
			   Vendor_fax=@Vendor_fax,Vendor_Contact_Name=@Vendor_Contact_Name,Vendor_Contact_EmailAddress=@Vendor_Contact_EmailAddress,
			   Vendor_Contact_Phone=@Vendor_Contact_Phone,Vendor_AltContact_Name=@Vendor_AltContact_Name,Vendor_AltContact_EmailAddress=@Vendor_AltContact_EmailAddress,
			 Vendor_AltContact_Phone=@Vendor_AltContact_Phone,Vendor_ShipTo_Address1=@Vendor_ShipTo_Address1,Vendor_ShipTo_Address2=@Vendor_ShipTo_Address2,
			 Vendor_ShipTo_City=@Vendor_ShipTo_City,Vendor_ShipTo_State=@Vendor_ShipTo_State,Vendor_ShipTo_PostalCode=@Vendor_ShipTo_PostalCode,
			 Vendor_BillTo_Address1=@Vendor_BillTo_Address1,Vendor_BillTo_Address2=@Vendor_BillTo_Address2,Vendor_BillTo_City=@Vendor_BillTo_City,
			 Vendor_BillTo_State=@Vendor_BillTo_State,Vendor_BillTo_PostalCode=@Vendor_BillTo_PostalCode,Rec_CreatedBy=@Rec_CreatedBy,
			 Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,ActiveFlag=@ActiveFlag,
			 Vend_LoginPwd=@Vend_LoginPwd
			   where PKCustID=@PKCustID
			   set @strMsg='Vendor Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrgRoles]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrgRoles]
(
    @PK_Org_RoleID uniqueidentifier=null ,
	@FK_OrgID uniqueidentifier ,
	@Org_Role_Name varchar(50) ,
	@Org_Role_Description varchar(100),
	@ActiveFlag bit 
	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrgRoles where PK_Org_RoleID=@PK_Org_RoleID)=0)
    begin			
	 insert tblOrgRoles values(NewID(),@FK_OrgID,@Org_Role_Name,@Org_Role_Description,@ActiveFlag)
	 set @strMsg='Organization Roles Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrgRoles set FK_OrgID=@FK_OrgID,Org_Role_Name=@Org_Role_Name,
			   Org_Role_Description=@Org_Role_Description,ActiveFlag=@ActiveFlag
			   where PK_Org_RoleID=@PK_Org_RoleID
			   set @strMsg='Organization Roles Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtVendInvoice]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtVendInvoice]
(
    @InvoiceID uniqueidentifier=null ,
	@FKCustID uniqueidentifier ,
	@Invoice_Amnt decimal(8, 2) ,
	@Consult_Name varchar(50),
	@Start_Date datetime,
	@End_Date datetime,
	@Invoice_path varchar(max) 
	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblVendInvoice where InvoiceID=@InvoiceID)=0)
    begin			
	 insert tblVendInvoice values(NewID(),@FKCustID,@Invoice_Amnt,@Consult_Name,@Start_Date,@End_Date,@Invoice_path)
	 set @strMsg='Vendor Invoice Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblVendInvoice set FKCustID=@FKCustID,Invoice_Amnt=@Invoice_Amnt,Consult_Name=@Consult_Name,Start_Date=@Start_Date,
			   End_Date=@End_Date,Invoice_path=@Invoice_path
			   where InvoiceID=@InvoiceID
			   set @strMsg='Vendor Invoice Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtVendInsCertificate]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtVendInsCertificate]
(
    @InsID uniqueidentifier=null ,
	@FKCustID uniqueidentifier ,
	@Effect_End_Date datetime ,
	@Certif_path varchar(max)
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblVendInsCertificate where InsID=@InsID)=0)
    begin			
	 insert tblVendInsCertificate values(NewID(),@FKCustID,@Effect_End_Date,@Certif_path)
	 set @strMsg='Vendor Insurance Certificate Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblVendInsCertificate set FKCustID=@FKCustID,Effect_End_Date=@Effect_End_Date,Certif_path=@Certif_path
			   where InsID=@InsID
			   set @strMsg='Vendor Insurance Certificate Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtOrgEmployees]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtOrgEmployees]
(
    @PK_Org_EmpID uniqueidentifier=null ,
    @Emp_Code varchar(10),
	@FK_OrgID uniqueidentifier ,
	@Emp_Fname varchar(100) ,
	@Emp_MName varchar(100) ,
	@Emp_Lname varchar(100) ,
	@Emp_Prefix varchar(5) ,
	@Emp_CellPhone char(12) ,
	@Emp_HomePhone char(12) ,
	@Emp_BusinessPhone char(16) ,
	@Emp_EmailID varchar(35) ,
	@Emp_AlternateEmail varchar(35) ,
	@Emp_JobTitle varchar(100) ,
	@Emp_LoginPwd varchar(20) ,
	@Emp_HireDate datetime=null ,
	@Emp_TerminationDate datetime=null ,
	@Emp_Home_Address1 varchar(100) ,
	@Emp_Home_Address2 varchar(100) ,
	@Emp_Home_City varchar(100) ,
	@Emp_Home_State varchar(2)=null ,
	@Emp_Home_PostalCode varchar(15) ,
	@Emp_Bus_Address1 varchar(100) ,
	@Emp_Bus_Address2 varchar(100) ,
	@Emp_Bus_City varchar(100) ,
	@Emp_Bus_State varchar(2)=null ,
	@Emp_Bus_PostalCode varchar(15) ,
	@FK_Org_Roles uniqueidentifier=null ,
	@Rec_CreatedBy varchar(200) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(200) ,
	@Rec_ModifiedDate datetime ,
	@ActiveFlag bit,
	@Emp_Categ varchar(100) ,
    @Emp_Salary decimal(8,2)=null ,
	@Doc_Number varchar(50) ,
	@Doc_ExpDate datetime=null ,
	@LCA_Number varchar(50) ,
	@LCA_ExpDate datetime=null ,
	@Perm_CertNumber varchar(50) ,
	@I140_Number varchar(50) ,
	@I485_Number varchar(50) 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblOrgEmployees where PK_Org_EmpID=@PK_Org_EmpID)=0)
    begin			
	 insert tblOrgEmployees values(NEWID(),@Emp_Code,@FK_OrgID,@Emp_Fname,@Emp_MName,@Emp_Lname,@Emp_Prefix,@Emp_CellPhone,
	        @Emp_HomePhone,@Emp_BusinessPhone,@Emp_EmailID,@Emp_AlternateEmail,@Emp_JobTitle,@Emp_LoginPwd,@Emp_HireDate,
	        @Emp_TerminationDate,@Emp_Home_Address1,@Emp_Home_Address2,@Emp_Home_City,@Emp_Home_State,@Emp_Home_PostalCode,
	        @Emp_Bus_Address1,@Emp_Bus_Address2,@Emp_Bus_City,@Emp_Bus_State,@Emp_Bus_PostalCode,@FK_Org_Roles,@Rec_CreatedBy,
	        @Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag,@Emp_Categ,@Emp_Salary,@Doc_Number,@Doc_ExpDate,@LCA_Number,
	        @LCA_ExpDate,@Perm_CertNumber,@I140_Number,@I485_Number)
	 set @strMsg='Employee Record Has Been Successfully Inserted'		 
    end	 
     
	 else
		  begin
			   update tblOrgEmployees set FK_OrgID=@FK_OrgID,Emp_Fname=@Emp_Fname,Emp_MName=@Emp_MName,Emp_Lname=@Emp_Lname,
			   Emp_Prefix=@Emp_Prefix,Emp_CellPhone=@Emp_CellPhone,Emp_HomePhone=@Emp_HomePhone,Emp_BusinessPhone=@Emp_BusinessPhone,
			   Emp_EmailID=@Emp_EmailID,Emp_AlternateEmail=@Emp_AlternateEmail,Emp_JobTitle=@Emp_JobTitle,Emp_LoginPwd=@Emp_LoginPwd,
			   Emp_HireDate=@Emp_HireDate,Emp_TerminationDate=@Emp_TerminationDate,Emp_Home_Address1=@Emp_Home_Address1,
			   Emp_Home_Address2=@Emp_Home_Address2,Emp_Home_City=@Emp_Home_City,Emp_Home_State=@Emp_Home_State,Emp_Home_PostalCode=@Emp_Home_PostalCode,
	           Emp_Bus_Address1=@Emp_Bus_Address1,Emp_Bus_Address2=@Emp_Bus_Address2,Emp_Bus_City=@Emp_Bus_City,Emp_Bus_State=@Emp_Bus_State,
	           Emp_Bus_PostalCode=@Emp_Bus_PostalCode,FK_Org_Roles=@FK_Org_Roles,Rec_CreatedBy=@Rec_CreatedBy,Rec_CreatedDate=@Rec_CreatedDate,
	           Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,ActiveFlag=@ActiveFlag,Emp_Categ=@Emp_Categ,
	           Emp_Salary=@Emp_Salary,Doc_Number=@Doc_Number,Doc_ExpDate=@Doc_ExpDate,LCA_Number=@LCA_Number,LCA_ExpDate=@LCA_ExpDate,
	           Perm_CertNumber=@Perm_CertNumber,I140_Number=@I140_Number,I485_Number=@I485_Number
			   where PK_Org_EmpID=@PK_Org_EmpID
			   set @strMsg='Employee Record Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtRolePermissions]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtRolePermissions] 
(
    @PK_RolePermission_ID uniqueidentifier=null,
	@Fk_PageID uniqueidentifier,
	@PermissionType varchar(7), -- The values will be A-Add, V-View, D-Delete, E-Edit
	@FK_Org_RoleID uniqueidentifier,
	@Rec_CreatedBy varchar(100) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(100) ,
	@Rec_ModifiedDate datetime ,
	@ActiveFlag bit	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblRolePermissions where PK_RolePermission_ID=@PK_RolePermission_ID)=0)
    begin			
	 insert tblRolePermissions values(NewID(),@Fk_PageID,@PermissionType,@FK_Org_RoleID,@Rec_CreatedBy,@Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Permissions Has Been Successfully Given'		 
    end	 
     
	 else
		  begin
			   update tblRolePermissions set Fk_PageID=@Fk_PageID,PermissionType=@PermissionType,FK_Org_RoleID=@FK_Org_RoleID,
			   Rec_CreatedBy=@Rec_CreatedBy,Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
			   ActiveFlag=@ActiveFlag
			   where PK_RolePermission_ID=@PK_RolePermission_ID
			   set @strMsg='Permissions Given Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchOrgEmpDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SearchOrgEmpDetails] 
(
@Emp_Fname varchar(100)=null,
@Emp_Lname varchar(100)=null,
@Emp_CellPhone char(12)=null,
@Emp_HomePhone char(12)=null,
@Emp_BusinessPhone char(12)=null,
@Emp_EmailID varchar(35)=null
) with Encryption
as
begin
 select * from tblOrgEmployees where 
 (Emp_Fname=@Emp_Fname or @Emp_Fname is null) and
 (Emp_Lname=@Emp_Lname or @Emp_Lname is null) and
 (Emp_CellPhone=@Emp_CellPhone or @Emp_CellPhone is null) and
 (Emp_HomePhone=@Emp_HomePhone or @Emp_HomePhone is null) and
 (Emp_BusinessPhone=@Emp_BusinessPhone or @Emp_BusinessPhone is null) and
 (Emp_EmailID=@Emp_EmailID or @Emp_EmailID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrgEmpDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetOrgEmpDetails]
(
@PK_Org_EmpID uniqueidentifier=null,
@FK_OrgID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblOrgEmployees OE inner join tblOrgRoles TOR on TOR.PK_Org_RoleID=OE.FK_Org_Roles where 
 (OE.PK_Org_EmpID=@PK_Org_EmpID or @PK_Org_EmpID is null) and
 (OE.FK_OrgID=@FK_OrgID or @FK_OrgID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRolePermissions]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetRolePermissions]
(
@Pk_RolePermission_ID uniqueidentifier=null
) with Encryption
as
begin 
select * from tblPageDetails P  cross join tblOrgRoles O left outer join tblRolePermissions R on 
               P.Pk_PageID=R.Fk_PageID and O.PK_Org_RoleID=R.FK_Org_RoleID 
       where  
  (R.Pk_RolePermission_ID=@Pk_RolePermission_ID or @Pk_RolePermission_ID is null)and O.Org_Role_Name='Admin' 
  
  union
  
select top 5* from tblPageDetails P  cross join tblOrgRoles O left outer join tblRolePermissions R on 
               P.Pk_PageID=R.Fk_PageID and O.PK_Org_RoleID=R.FK_Org_RoleID 
       where  
  (R.Pk_RolePermission_ID=@Pk_RolePermission_ID or @Pk_RolePermission_ID is null) and O.Org_Role_Name!='Admin' order by O.Org_Role_Name asc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVendInvoice]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetVendInvoice]
(
@InvoiceID uniqueidentifier=null,
@FKCustID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblVendInvoice where 
 (InvoiceID=@InvoiceID or @InvoiceID is null) and
 (FKCustID=@FKCustID or @FKCustID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetVendInsCertificate]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetVendInsCertificate]
(
@InsID uniqueidentifier=null,
@FKCustID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblVendInsCertificate where 
 (InsID=@InsID or @InsID is null) and
 (FKCustID=@FKCustID or @FKCustID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDetail]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_GetUserDetail]
(
 @Emp_Code varchar(10)
) with Encryption
as
begin
  select * from tblOrgEmployees OE inner join tblOrgRoles ORO on OE.FK_Org_Roles=ORO.PK_Org_RoleID 
                      inner join tblRolePermissions RP on ORO.PK_Org_RoleID=RP.FK_Org_RoleID
                      inner join tblPageDetails PD on RP.FK_PageID=PD.Pk_PageID
             where OE.Emp_Code=@Emp_Code
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLogin]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CheckLogin] 
(
@Emp_EmailID varchar(35),
@Emp_LoginPwd varchar(20)
) with Encryption
as
 declare @strMsg varchar(200)
begin
 
 if((select count(*) from tblOrgEmployees where (Emp_EmailID=@Emp_EmailID or (@Emp_EmailID='Admin' and Emp_Code='admin')) and Emp_LoginPwd=@Emp_LoginPwd
 COLLATE SQL_Latin1_General_CP1_CS_AS)>0)
    begin
      if(((select count(*) from tblOrgEmployees OE inner join tblOrgRoles ORO on OE.FK_Org_Roles=ORO.PK_Org_RoleID 
                      inner join tblRolePermissions RP on ORO.PK_Org_RoleID=RP.FK_Org_RoleID
                      inner join tblPageDetails PD on RP.FK_PageID=PD.Pk_PageID
             where OE.Emp_EmailID=@Emp_EmailID)>0) or @Emp_EmailID='Admin')
          begin
          if(@Emp_EmailID!='Admin')
            set @strMsg='valid-'+(select Emp_Code from tblOrgEmployees where emp_emailid=@Emp_EmailID)
          else
            set @strMsg='valid-'+'admin'
          end
       else
         begin
          set @strMsg='Sorry!you cannot login now.Please contact Administrator'
         end
      end
    else
      begin
      set @strMsg='Sorry! Incorrect UserID or Password'
      end     
     
  select @strMsg                    
    end
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeForgotPassword]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChangeForgotPassword]
(              
	 @Emp_EmailID varchar(35)	 
) with Encryption

  as
  begin
		declare @strMsg varchar(200)

		if((select count(*) from tblOrgEmployees where  Emp_EmailID=@Emp_EmailID)>0)
			  begin			   
			   set @strMsg=(select Emp_LoginPwd from tblOrgEmployees where Emp_EmailID=@Emp_EmailID)
			  end
		else
			  begin
				set @strMsg='NotValid'
			  end
  select @strMsg
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelOrgEmployees]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DelOrgEmployees]
(
 @PK_Org_EmpID uniqueidentifier
) with Encryption
as
begin
 delete tblOrgEmployees where PK_Org_EmpID=@PK_Org_EmpID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelEmployeeTimeOff]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelEmployeeTimeOff]
(
 @PK_EmpTimeOffID uniqueidentifier
) with Encryption
as
begin
 delete tblEmployeeTimeOff where PK_EmpTimeOffID=@PK_EmpTimeOffID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveTimesheets]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ApproveTimesheets] 
(
@PK_TimeSheetID uniqueidentifier=null,
@Approved_Status varchar(15)
) with Encryption
as
begin
 Update tblTimeSheets set TSStatus=@Approved_Status where PK_TimeSheetID=@PK_TimeSheetID 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ApproveTimeOff]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ApproveTimeOff] 
(
@PK_EmpTimeOffID uniqueidentifier=null,
@Approved_Status varchar(15)
) with Encryption
as
begin
 Update tblEmployeeTimeOff set Approved_Status=@Approved_Status where PK_EmpTimeOffID=@PK_EmpTimeOffID 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeTimeOff]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetEmployeeTimeOff] --null,null,'10-10-2011','10-12-2011'
(
@PK_EmpTimeOffID uniqueidentifier=null,
@FK_Org_EmpID uniqueidentifier=null,
@StartDate datetime=null,
@EndDate datetime=null
) with Encryption
as
begin
 select * from tblEmployeeTimeOff ET inner join tblOrgEmployees OE on ET.FK_Org_EmpID=OE.PK_Org_EmpID  where 
 (PK_EmpTimeOffID=@PK_EmpTimeOffID or @PK_EmpTimeOffID is null) and 
 (FK_Org_EmpID=@FK_Org_EmpID or @FK_Org_EmpID is null) and 
 ((ET.StartDate >= @StartDate and ET.EndDate<= @EndDate) or @StartDate is null)
 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelProjects]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelProjects]
(
 @PK_Org_ProjectID uniqueidentifier
) with Encryption
as
begin
 delete tblProjects where PK_Org_ProjectID=@PK_Org_ProjectID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtEmployeeTimeOff]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtEmployeeTimeOff] 
(
   @PK_EmpTimeOffID uniqueidentifier=null ,
   @FK_Org_EmpID uniqueidentifier ,
   @FK_TimeOffTypeID uniqueidentifier=null,
   @StartDate datetime ,
   @EndDate datetime, 
   @FileName varchar(500) ,
   @FilePath varchar(max),
   @Approved_Status Varchar(15),	
   @Rec_CreatedBy varchar(200),
   @Rec_CreatedDate datetime,
   @Rec_ModifiedBy varchar(200),
   @Rec_ModifiedDate datetime,
   @Comments varchar(200)	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblEmployeeTimeOff where PK_EmpTimeOffID=@PK_EmpTimeOffID)=0)
    begin			
	 insert tblEmployeeTimeOff values(NewID(),@FK_Org_EmpID,@FK_TimeOffTypeID,@StartDate,@EndDate,@FileName,@FilePath,@Approved_Status,
	 @Rec_CreatedBy,@Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@Comments)
	 set @strMsg='Employee Timeoff Details Has Been Successfully Submitted'		 
    end	 
     
	 else
		  begin
			   update tblEmployeeTimeOff set FK_Org_EmpID=@FK_Org_EmpID,FK_TimeOffTypeID=@FK_TimeOffTypeID,StartDate=@StartDate,
			   EndDate=@EndDate,FileName=@FileName,FilePath=@FilePath,Approved_Status=@Approved_Status,Rec_CreatedBy=@Rec_CreatedBy,
			   Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,Comments=@Comments			   
			   where PK_EmpTimeOffID=@PK_EmpTimeOffID
			   set @strMsg='Employee Timeoff Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTimeSheetDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetTimeSheetDetails]
(
 @PK_Org_EmpID uniqueidentifier ,        
 @StartDate datetime,        
 @EndDate datetime  
) with Encryption        
        
AS    
begin
	select * from tblTimeSheets
	where FK_Org_EmpID=@PK_Org_EmpID and StartDate=@StartDate and EndDate=@EndDate
	and activeflag=1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProjects]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetProjects]
(
@PK_Org_ProjectID uniqueidentifier=null,
@FK_Org_EmpID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblProjects P left outer join tblOrgCustomers C on P.FK_EndClient=C.PKCustID where 
 (P.PK_Org_ProjectID=@PK_Org_ProjectID or @PK_Org_ProjectID is null) and
 (P.FK_Org_EmpID=@FK_Org_EmpID or @FK_Org_EmpID is null)
end
GO

/****** Object:  StoredProcedure [dbo].[sp_MissingTimesheet]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MissingTimesheet]  
(
 @FK_Org_EmpID uniqueidentifier=null,
 @Startdate Datetime,
 @EndDate Datetime
) with Encryption
as
begin

Declare @WeekDates Table
(
      MYID INT IDENTITY,
      WeekStartDate Datetime,
      WeekEndDate Datetime
    
)
 
Declare @tblMissingTimeSheets Table
(
      MYID INT IDENTITY,
      PK_Org_EmpID Uniqueidentifier,
        Emp_Name varchar(200),
        Emp_EmailID varchar(35),
      WeekStartDate Datetime,
      WeekEndDate Datetime
    
)
 
 

Declare @CurrentDate Datetime
Declare @StartdateWeekStart Datetime
Declare @StartdateWeekEnd Datetime
Declare @EnddateWeekStart Datetime
Declare @EnddateWeekEnd Datetime
Declare @Counter Int
Declare @NextWeekStart Datetime
Declare @NextWeekEnd Datetime
 

 
-- Get the Week for the Starting Date
Select @CurrentDate=@StartDate
select @StartdateWeekStart=DATEADD(dd, -(DATEPART(dw, @CurrentDate)-2), @CurrentDate),
@StartdateWeekEnd=DATEADD(dd, 8-(DATEPART(dw, @CurrentDate)), @CurrentDate)
 
 
-- Get the Week for the End Date
Select @CurrentDate=@EndDate
select @EnddateWeekStart=DATEADD(dd, -(DATEPART(dw, @CurrentDate)-2), @CurrentDate),
@EnddateWeekEnd=DATEADD(dd, 8-(DATEPART(dw, @CurrentDate)), @CurrentDate)
 
 
-- We got the Start and the End Weeks
-- Now get the next week Start and End Dates
Select @NextWeekStart=DateAdd(dw,7,@StartdateWeekStart ),@NextWeekEnd=DateAdd(dw,7,@StartdateWeekEnd)
 
 
--Select @Startdate [Start Date] ,@EndDate [End Date],
--@StartdateWeekStart [Start Date Week Start]
--,@StartdateWeekEnd [Start Date Week End],
--@EnddateWeekStart [End Date Week Start],
--@EnddateWeekEnd [End Date Week Start],
--@NextWeekStart [Next Week Start],
--@NextWeekEnd [Next Week End]
 
Insert into @WeekDates
select @StartdateWeekStart,@StartdateWeekEnd
 
-- If the next weekend is same or greater then the End Date Week then we dont need to proceed as we reached the end date
If @NextWeekEnd < @EnddateWeekEnd
BEGIN
      -- get the Next week into the table
      Insert into @WeekDates
      select @NextWeekStart,@NextWeekEnd
    
 
 
 
      Select @Counter=1
      While @Counter = 1
      BEGIN
    
     
     
            Select @NextWeekStart=DateAdd(dw,7,@NextWeekStart),@NextWeekEnd=DateAdd(dw,7,@NextWeekEnd)
 
           -- Print @NextWeekStart
           -- Print @NextWeekEnd
            --If it reaches the end then break the loop
            If @NextWeekEnd >= @EnddateWeekEnd
            BEGIN
          
                 
                  Select @Counter=0
            END
          
            Insert into @WeekDates
            Select @NextWeekStart,@NextWeekEnd
    
           
      END
END
 
Declare @NoofWeekDayRecs int
 Select @NoofWeekDayRecs=max(MYID) from @WeekDates
 Select @Counter=1
 --Select * from @WeekDates
 While @COunter <= @NoofWeekDayRecs
BEGIN
     
      Select @Startdate=WeekStartDate,@EndDate=WeekEndDate from @WeekDates where MYID=@Counter
     
      Insert into @tblMissingTimeSheets
      (PK_Org_EmpID,Emp_Name ,Emp_EmailID,WeekStartDate,WeekEndDate)
     
      select e.PK_Org_EmpID,e.Emp_Fname+' '+e.Emp_lName ,e.Emp_EmailID,@Startdate,@EndDate
      from tblOrgEmployees e
      left Join tblTimeSheets ts on ts.FK_Org_EmpID=e.PK_Org_EmpID and ts.StartDate=@Startdate and ts.enddate=@EndDate
      --where e.PK_Org_EmpID='0941F2AF-A970-4F3F-BE19-DE89D488AF36'
      Where e.Emp_Fname <> 'Admin' and ts.startdate is NULL and ts.EndDate is NULL
      and (PK_Org_EmpID=@FK_Org_EmpID or @FK_Org_EmpID is null)
     
 
 
      --Select @counter,@Startdate,@EndDate
      Select @counter=@Counter + 1
END
 -- Now loop throug each week Date for each employee
 
 
--Select * from @WeekDates
select * from @tblMissingTimeSheets 
order by WeekStartDate

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTimeSheet]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateTimeSheet] 
(
    @PK_TimeSheetID uniqueidentifier,	
	@StartDate datetime ,
	@EndDate datetime ,
	@TSFileName varchar(100) ,
	@TSFilePath varchar(1000)
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblTimeSheets where PK_TimeSheetID=@PK_TimeSheetID and StartDate=@StartDate and EndDate=@EndDate)>0)
    begin			
	   update tblTimeSheets set TSFileName=@TSFileName,TSFilePath=@TSFilePath			   
			   where PK_TimeSheetID=@PK_TimeSheetID
			   set @strMsg='Timesheet successfully Updated.'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchTimeSheetDetails]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SearchTimeSheetDetails] 
(
@PK_TimeSheetID uniqueidentifier=null,
@FK_Org_EmpID uniqueidentifier=null,
@StartDate datetime=null,
@EndDate datetime=null
) with Encryption
as
begin
 select * from tblTimeSheets TS inner join tblOrgEmployees OE on TS.FK_Org_EmpID=OE.PK_Org_EmpID 
 
  where   
 (TS.PK_TimeSheetID=@PK_TimeSheetID or @PK_TimeSheetID is null) and   
 (TS.FK_Org_EmpID=@FK_Org_EmpID or @FK_Org_EmpID is null) and   
 (((TS.StartDate >= @StartDate and TS.StartDate<= @EndDate)or (TS.EndDate >= @StartDate and TS.EndDate<= @EndDate)) 
   or @StartDate is null)  
   
 order by EndDate  
 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtProjects]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtProjects] 
(
    @PK_Org_ProjectID uniqueidentifier=null ,
	@FK_Org_EmpID uniqueidentifier ,
	@Proj_Code varchar(10) ,
	@Proj_name varchar(100) ,
	@Proj_Description varchar(250) ,
	@Proj_StartDate datetime ,
	@Proj_EndDate datetime ,
	@FK_Client1 uniqueidentifier=null ,
	@FK_Client2 uniqueidentifier=null ,
	@FK_EndClient uniqueidentifier=null ,
	@BillRate decimal(5, 2)=null ,
	@BillingCycle int=null ,
	@OverTime_Allowed Bit =null,
    @OverTime_Rate decimal(5, 2)=null,
	@Rec_CreatedBy varchar(200) ,
	@Rec_CreatedDate datetime ,
	@Rec_ModifiedBy varchar(200) ,
	@Rec_ModifiedDate datetime ,	
	@ActiveFlag bit 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblProjects where PK_Org_ProjectID=@PK_Org_ProjectID)=0)
    begin			
	 insert tblProjects values(NewID(),@FK_Org_EmpID,@Proj_Code,@Proj_name,@Proj_Description,@Proj_StartDate,@Proj_EndDate,
	 @FK_Client1,@FK_Client2,@FK_EndClient,@BillRate,@BillingCycle,@OverTime_Allowed,@OverTime_Rate,@Rec_CreatedBy,
	 @Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@ActiveFlag)
	 set @strMsg='Project Details Has Been Successfully Submitted'		 
    end	 
     
	 else
		  begin
			   update tblProjects set FK_Org_EmpID=@FK_Org_EmpID,Proj_Code=@Proj_Code,Proj_name=@Proj_name,
			   Proj_Description=@Proj_Description,Proj_StartDate=@Proj_StartDate,Proj_EndDate=@Proj_EndDate,
	           FK_Client1=@FK_Client1,FK_Client2=@FK_Client2,FK_EndClient=@FK_EndClient,BillRate=@BillRate,BillingCycle=@BillingCycle,
	           OverTime_Allowed=@OverTime_Allowed,OverTime_Rate=@OverTime_Rate,Rec_CreatedBy=@Rec_CreatedBy,
	           Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
	           ActiveFlag=@ActiveFlag
			   where PK_Org_ProjectID=@PK_Org_ProjectID
			   set @strMsg='Project Details Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdttblTimeSheet]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdttblTimeSheet] 
(
    @PK_TimeSheetID uniqueidentifier=null,	
	@StartDate DateTime ,
	@EndDate datetime ,
	@Mon decimal(5, 1) ,
	@Tue decimal(5, 1) ,
	@Wed decimal(5, 1) ,
	@Thu decimal(5, 1) ,
	@Fri decimal(5, 1) ,
	@Sat decimal(5, 1) ,
	@Sun decimal(5, 1) ,
	@Total decimal(5, 1) ,
	@TSFileName varchar(100)  ,
	@TSFilePath varchar(1000) ,
	@FK_Org_EmpID uniqueidentifier ,
	@Rec_CreatedBy varchar(200),
	@Rec_CreatedDate datetime,
	@Rec_ModifiedBy varchar(200),
	@Rec_ModifiedDate datetime,
	@Activeflag bit,
	@TSStatus tinyint	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblTimeSheets where PK_TimeSheetID=@PK_TimeSheetID)=0)
    begin			
	 insert tblTimeSheets values(NewID(),@StartDate,@EndDate,@Mon,@Tue,@Wed,@Thu,@Fri,@Sat,@Sun,@Total,@TSFileName,@TSFilePath,
	 @FK_Org_EmpID,@Rec_CreatedBy,@Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate,@Activeflag,@TSStatus)
	 set @strMsg='Timesheet successfully posted.'		 
    end	 
     
	 else
		  begin
			   update tblTimeSheets set StartDate=@StartDate,EndDate=@EndDate,Mon=@Mon,Tue=@Tue,Wed=@Wed,Thu=@Thu,Fri=@Fri,Sat=@Sat,
			   Sun=@Sun,Total=@Total,TSFileName=@TSFileName,TSFilePath=@TSFilePath,FK_Org_EmpID=@FK_Org_EmpID,Rec_CreatedBy=@Rec_CreatedBy,
			   Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,Rec_ModifiedDate=@Rec_ModifiedDate,
			   Activeflag=@Activeflag,TSStatus=@TSStatus
			   where PK_TimeSheetID=@PK_TimeSheetID
			   set @strMsg='Timesheet successfully Updated.'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtTasks]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsOrUpdtTasks]
(
    @PK_TaskID uniqueidentifier=null ,
	@FK_Org_EmpID uniqueidentifier ,
	@FK_TimeSheetID uniqueidentifier ,
	@Task_Number int,
	@Task_Date datetime,
	@Task_Name Varchar(500),
    @Task_Description varchar(max),
    @Rec_CreatedBy varchar(200) ,
    @Rec_CreatedDate datetime ,
    @Rec_ModifiedBy varchar(200) ,
    @Rec_ModifiedDate datetime 	
) with Encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblTasks where PK_TaskID=@PK_TaskID)=0)
    begin			
	 insert tblTasks values(NewID(),@FK_Org_EmpID,@FK_TimeSheetID,@Task_Number,@Task_Date,@Task_Name,@Task_Description,@Rec_CreatedBy,@Rec_CreatedDate,@Rec_ModifiedBy,@Rec_ModifiedDate)
	 set @strMsg='Task Has Been Successfully Posted'		 
    end	 
     
	 else
		  begin
			   update tblTasks set FK_Org_EmpID=@FK_Org_EmpID,FK_TimeSheetID=@FK_TimeSheetID,Task_Number=@Task_Number,Task_Date=@Task_Date,Task_Name=@Task_Name,
			   Task_Description=@Task_Description,Rec_CreatedBy=@Rec_CreatedBy,Rec_CreatedDate=@Rec_CreatedDate,Rec_ModifiedBy=@Rec_ModifiedBy,
			   Rec_ModifiedDate=@Rec_ModifiedDate
			   where PK_TaskID=@PK_TaskID
			   set @strMsg='Task Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTasks]    Script Date: 08/16/2012 16:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetTasks]
(
@PK_TaskID uniqueidentifier=null,
@FK_Org_EmpID uniqueidentifier=null,
@FK_TimeSheetID uniqueidentifier=null
) with Encryption
as
begin
 select * from tblTasks where 
 (PK_TaskID=@PK_TaskID or @PK_TaskID is null) and
 (FK_Org_EmpID=@FK_Org_EmpID or @FK_Org_EmpID is null) and
 (FK_TimeSheetID=@FK_TimeSheetID or @FK_TimeSheetID is null)
 
 order by Task_Number asc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelTasks]    Script Date: 08/16/2012 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelTasks]
(
 @FK_TimeSheetID uniqueidentifier,
 @FK_Org_EmpID uniqueidentifier
) with Encryption
as
begin
 delete tblTasks where FK_TimeSheetID=@FK_TimeSheetID and FK_Org_EmpID=@FK_Org_EmpID
end
GO

/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtDocuments]    Script Date: 08/21/2012 09:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsOrUpdtDocuments]
(
    @DocID uniqueidentifier=null,
    @Doc_Title varchar(200),
    @Doc_Path varchar(200),
    @Doc_Type varchar(100)
	
) with encryption
as
 declare @strMsg varchar(200)
 
begin
 if((select count(*) from tblDocuments where DocID=@DocID)=0)
    begin			
	 insert tblDocuments values(NewID(),@Doc_Title,@Doc_Path,@Doc_Type)
	 set @strMsg='Document Has Been Successfully Uploaded'		 
    end	 
     
	 else
		  begin
			   update tblDocuments set Doc_Title=@Doc_Title,Doc_Path=@Doc_Path,Doc_Type=@Doc_Type
			   where DocID=@DocID
			   set @strMsg='Document Has Been Successfully Updated'
		  end 	  
    select @strMsg
end
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDocuments]    Script Date: 08/21/2012 09:44:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetDocuments]
(
 @Doc_Type varchar(100)=null
) with encryption
as
begin
 select * from tblDocuments TD where 
 (TD.Doc_Type=@Doc_Type or @Doc_Type is null)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DelDocuments]    Script Date: 08/21/2012 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DelDocuments]
(
 @DocID uniqueidentifier
) with encryption
as
begin
 delete tblDocuments where DocID=@DocID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsOrUpdtEmail]    Script Date: 08/26/2012 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_InsOrUpdtEmail]
(
    @ID uniqueidentifier=null,
    @From_Email varchar(100),
    @Password varchar(20),
    @To_Emails varchar(500),
	@case varchar(20)
)
as
 declare @strMsg varchar(200)
 
begin
if(@case='fromemail')
 begin
 if((select count(*) from tblEmail where ID=@ID)=0)
    begin			
	 insert tblEmail values(NewID(),@From_Email,@Password,@To_Emails)
	 set @strMsg='From Email Has Been Successfully Set'		 
    end	 
     
	 else
		  begin
			   update tblEmail set From_Email=@From_Email,Password=@Password
			   where ID=@ID
			   set @strMsg='From Email Has Been Successfully Updated'
		  end 
    end	
 else  
 begin
 
			   update tblEmail set To_Emails=@To_Emails			   
			   set @strMsg='To Emails Has Been Successfully Updated'
		   
  end	
    select @strMsg
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmail]    Script Date: 08/26/2012 21:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetEmail]
(
@ID uniqueidentifier=null
)
as
begin
 select * from tblEmail where 
 (@ID=@ID or @ID is null) 
end
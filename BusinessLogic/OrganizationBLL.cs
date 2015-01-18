# region "Namespaces"
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataAccess;
#endregion

namespace BusinessLogic
{
    public class OrganizationBLL
    {

        OrganizationDAL oDal = new OrganizationDAL();
        # region "Properties Declaration"
        char _add = 'N';
        char _view = 'N';
        char _delete = 'N';
        char _edit = 'N';
        private string _orgName = "";
        private string _address1 = "";
        private string _address2 = "";
        private string _city = "";        
        private string _state = null;
        private string _postalCode = "";
        private string _addressPers1 = "";
        private string _addressPers2 = "";
        private string _cityPers = "";
        private string _statePers = null;
        private string _postalCodePers = "";
        private string _phoneNumber = "";
        private string _emailID = "";
        private string _faxNumber = "";
        private string _websiteUrl = "";
        private string _createdBy = "";
        private DateTime _createdDate = System.DateTime.Now;
        private string _modifiedBy = "";
        private DateTime _modifiedDate = System.DateTime.Now;
        private Guid? _clientTypeID = null;
        private Guid? _orgID=null ;
        private string _clientType = "";        
        private byte _status = 1;
        private Guid? _custID = null;
        private string _custName = "";
        private string _contactName="";
        private string _contactEmailAddress="";
        private string _contactPhoneNumber="";
        private string _altContactName="";
        private string _altContactEmailAddress="";
        private string _altContactPhoneNumber="";
        private string _vendorName="";
        private Guid? _org_empID= null;
        private string _orgEmpCode = "";
        private string _firstName = "";
        private string _middleName = "";
        private string _lastName = "";
        private string _prefix = "";
        private string _cellPhone = "";
        private string _homePhone = "";
        private string _buisnsPhone = "";
        private string _jobTitle = "";
        private string _loginPwd = "";
        private DateTime? _hireDate =System.DateTime.Now;
        private DateTime? _terminationDate = System.DateTime.Now;
        private string _empCateg = "";
        private decimal? _empSal = null;
        private string _docNo = "";
        private DateTime? _docExpDate = null;
        private string _lcaNo = "";
        private DateTime? _lcaExpDate = null;
        private string _permCertNo = "";
        private string _i140No = "";
        private string _i485No = "";
        private int? _org_Roles=null;
        private Guid? _orgRoleID = null;
        private string _orgRoleName = "";
        private string _orgRoleDesc = "";
        private string _shipToAddr1 = "";
        private string _shipToAddr2 = "";
        private string _shipToCity = "";
        private string _shipToState = null;
        private string _shipToPCode = "";
        private string _billToAddr1 = "";
        private string _billToAddr2 = "";
        private string _billToCity = "";
        private string _billToState = null;
        private string _billToPCode = "";
        private Guid? _rolePermissionID=null;
        private Guid? _pageID = null;
        private string _permissionType = "";
        private Guid? _timesheetID = null;        
        private decimal _mon = 0;
        private decimal _tue = 0;
        private decimal _wed = 0;
        private decimal _thu = 0;
        private decimal _fri = 0;
        private decimal _sat = 0;
        private decimal _sun = 0;
        private decimal _tot = 0;
        private string _fileName = "";
        private string _filePath = "";
        byte _approved = 0;
        private Guid? _taskID = null;
        private int _tskNumber;
        private DateTime _tskDate = System.DateTime.Now;
        private string _tskName = "";
        private string _tskDesc = "";
        private int _tsStatus = 0;
        private string _comments = "";
        private byte? _activeStatus = null;

        private Guid? _orgProjectID = null;
        private string _projCode = "";
        private string _projName = "";
        private string _projDesc = "";
        private DateTime? _startDate = System.DateTime.Now;
        private DateTime? _endDate = System.DateTime.Now;
        private Guid? _client1 = null;
        private Guid? _client2 = null;
        private Guid? _endClient = null;
        private decimal? _billRate=null;
        private int? _billCycle=null;
        private byte? _overTimeAllow = null;
        private decimal? _overTimeRate = null;

        private Guid? _timeOffTypeID = null;
        private string _timeOffDesc = "";
        private Guid? _empTimeOffTypeID = null;
        private string _appStatus = "";
        private Guid? _holidaysID = null;
        private string _holName = "";
        private string _holDesc = "";
        private DateTime _holDate = System.DateTime.Now;

        private Guid? _insCertID = null;
        private string _certPath = "";
        private Guid? _invoiceID = null;
        private decimal _invAmnt ;
        private string _consultName = "";
        private string _invPath = "";

        private Guid? _docID = null;
        private string _docTitle = "";
        private string _docPath = "";
        private string _docType = "";

        private Guid? _ID = null;
        private string _frmEmail = "";
        private string _password = "";
        private string _smtpHost = "";
        private int _smtpPort;
        private string _toEmails = "";

        private Guid? _ratingScaleID = null;
        private string _ratingScale = "";
        private byte _singleSelection = 1;

        private Guid? _ratingScaleTitleID = null;
        private string _ratingTitle = "";
        private string _description = "";
        private int _ratingOrder;

        private Guid? _reviewPeriodID = null;
        private string _periodName = "";

        private Guid? _templateID = null;
        private string _templateName = "";
        private string _instructions = "";        

        private Guid? _quesID = null;
        private string _questions = "";
        private int? _completedBy=null;

        private Guid? _evaluationID = null;
        private string _evalDocPath = "";
        private int _processed ;
        private string _employerEval = "";
        private string _employeeEval = "";
        private byte? _onlyAdmin=0;
        private string _evalGrade = "";
        private string _supervComm = "";       
        private DateTime _empSignedDate = System.DateTime.Now;
        private DateTime _supervisorSignedDate = System.DateTime.Now;
        private string _employeeSumm = "";

        DataSet _oDsCliTypDetails = null;
        DataSet _oDsOrgCustDetails = null;
        DataSet _oDsOrgVendors = null;
        DataSet _oDsOrgRoles=null;
        DataSet _oDsOrgEmpDetails = null;
        DataSet _oDsPageDetails = null;
        DataSet _oDsPagePermissions = null;
        DataSet _oDsEmpDetails = null;
        DataSet _oDsTSDetails = null;
        DataSet _oDsMissingTS = null;
        DataSet _oDsProjDetails = null;
        DataSet _oDsTimeOffType = null;
        DataSet _oDsEmpTimeOff = null;
        DataSet _oDsHolidays = null;
        DataSet _oDsTasks = null;
        DataSet _oDsVendInvoice = null;
        DataSet _oDsVendInsCert = null;
        DataSet _oDsDocuments = null;
        DataSet _oDsEmail = null;
        DataSet _oDsRatingScale = null;
        DataSet _oDsRatingScaleTitle = null;
        DataSet _oDsReviewPeriod = null;
        DataSet _oDsRatingTemplate = null;
        DataSet _oDsRatTempQues = null;
        DataSet _oDsEmpEvaluation = null;

        #endregion

        #region "Methods"

        public string InsOrUpdtOrganization()
        {
            SqlParameter[] sqlParams = new SqlParameter[15];
            try
            {
                sqlParams[0] = new SqlParameter("@Pk_OrgID", this.OrgID);
                sqlParams[1] = new SqlParameter("@Org_Name", this.OrgName);
                sqlParams[2] = new SqlParameter("@Org_Address1", this.Address1);
                sqlParams[3] = new SqlParameter("@Org_Address2", this.Address2);
                sqlParams[4] = new SqlParameter("@Org_City", this.City);
                sqlParams[5] = new SqlParameter("@Org_State", this.State);
                sqlParams[6] = new SqlParameter("@Org_PostalCode", this.PostalCode);
                sqlParams[7] = new SqlParameter("@Org_Phone#", this.PhoneNumber);
                sqlParams[8] = new SqlParameter("@Org_EmailID", this.EmailID);
                sqlParams[9] = new SqlParameter("@Org_Fax", this.FaxNumber);
                sqlParams[10] = new SqlParameter("@Org_Website_URL", this.WebsiteUrl);
                sqlParams[11] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
                sqlParams[12] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
                sqlParams[13] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
                sqlParams[14] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);

                return oDal.InsOrUpdtOrganization(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                sqlParams = null;
            }
        }

        public void GetOrgDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            DataSet oDsOrgDetails = null;
            try
            {
                sqlParams[0] = new SqlParameter("@Pk_OrgID", this.OrgID);
                oDsOrgDetails = oDal.GetOrgDetails(sqlParams);
                if (oDsOrgDetails.Tables[0].Rows.Count > 0)
                {
                    this.OrgID = new Guid(oDsOrgDetails.Tables[0].Rows[0]["Pk_OrgID"].ToString());
                    this.OrgName = oDsOrgDetails.Tables[0].Rows[0]["Org_Name"].ToString();
                    this.Address1 = oDsOrgDetails.Tables[0].Rows[0]["Org_Address1"].ToString();
                    this.Address2 = oDsOrgDetails.Tables[0].Rows[0]["Org_Address2"].ToString();
                    this.City = oDsOrgDetails.Tables[0].Rows[0]["Org_City"].ToString();
                    this.State = oDsOrgDetails.Tables[0].Rows[0]["Org_State"].ToString();
                    this.PostalCode = oDsOrgDetails.Tables[0].Rows[0]["Org_PostalCode"].ToString();
                    this.PhoneNumber = oDsOrgDetails.Tables[0].Rows[0]["Org_Phone#"].ToString();
                    this.EmailID = oDsOrgDetails.Tables[0].Rows[0]["Org_EmailID"].ToString();
                    this.FaxNumber = oDsOrgDetails.Tables[0].Rows[0]["Org_Fax"].ToString();
                    this.WebsiteUrl = oDsOrgDetails.Tables[0].Rows[0]["Org_Website_URL"].ToString();
                    this.CreatedBy = oDsOrgDetails.Tables[0].Rows[0]["Rec_CreatedBy"].ToString();
                    this.CreatedDate = Convert.ToDateTime(oDsOrgDetails.Tables[0].Rows[0]["Rec_CreatedDate"].ToString());
                    this.ModifiedBy = oDsOrgDetails.Tables[0].Rows[0]["Rec_ModifiedBy"].ToString();
                    this.ModifiedDate = Convert.ToDateTime(oDsOrgDetails.Tables[0].Rows[0]["Rec_ModifiedDate"].ToString());
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                sqlParams = null;
                oDsOrgDetails.Dispose();
            }

        }      
            
        
        public string InsOrUpdtOrgClientType()
        {
            SqlParameter[] sqlParams = new SqlParameter[8];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_ClientTypeID", this.ClientTypeID);
                sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
                sqlParams[2] = new SqlParameter("@Org_ClientType", this.ClientType);
                sqlParams[3] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
                sqlParams[4] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
                sqlParams[5] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
                sqlParams[6] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
                sqlParams[7] = new SqlParameter("@ActiveFlag", this.Status);
                return oDal.InsOrUpdtOrgClientType(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                sqlParams = null;
            }
        }

        public void GetCliTypDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];            
            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_ClientTypeID", this.ClientTypeID);
                sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
                this.oDsCliTypDetails = oDal.GetCliTypDetails(sqlParams);
                
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                sqlParams = null;
                this.oDsCliTypDetails.Dispose();
            }
        }

        public void DelCliTypDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_ClientTypeID", this.ClientTypeID);
                oDal.DelCliTypDetails(sqlParams);

            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetStates()
        {            
            try
            {                
                return oDal.GetStates();
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtOrgCustomers()
        {
            SqlParameter[] sqlParams = new SqlParameter[27];

            sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
            sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
            sqlParams[2] = new SqlParameter("@Cust_Name", this.CustName);
            sqlParams[3] = new SqlParameter("@Cust_WebsiteURL", this.WebsiteUrl);
            sqlParams[4] = new SqlParameter("@Cust_Phone", this.PhoneNumber);
            sqlParams[5] = new SqlParameter("@Cust_fax", this.FaxNumber);
            sqlParams[6] = new SqlParameter("@Cust_Contact_Name", this.ContactName);
            sqlParams[7] = new SqlParameter("@Cust_Contact_EmailAddress", this.ContactEmailAddress);
            sqlParams[8] = new SqlParameter("@Cust_Contact_Phone", this.ContactPhoneNumber);
            sqlParams[9] = new SqlParameter("@Cust_AltContact_Name", this.AltContactName);
            sqlParams[10] = new SqlParameter("@Cust_AltContact_EmailAddress", this.AltContactEmailAddress);
            sqlParams[11] = new SqlParameter("@Cust_AltContact_Phone", this.AltContactPhoneNumber);
            sqlParams[12] = new SqlParameter("@Cust_ShipTo_Address1", this.ShipToAddr1);
            sqlParams[13] = new SqlParameter("@Cust_ShipTo_Address2", this.ShipToAddr2);
            sqlParams[14] = new SqlParameter("@Cust_ShipTo_City", this.ShipToCity);
            sqlParams[15] = new SqlParameter("@Cust_ShipTo_State", this.ShipToState);
            sqlParams[16] = new SqlParameter("@Cust_ShipTo_PostalCode", this.ShipToPCode);
            sqlParams[17] = new SqlParameter("@Cust_BillTo_Address1", this.BillToAddr1);
            sqlParams[18] = new SqlParameter("@Cust_BillTo_Address2", this.BillToAddr2);
            sqlParams[19] = new SqlParameter("@Cust_BillTo_City", this.BillToCity);
            sqlParams[20] = new SqlParameter("@Cust_BillTo_State", this.BillToState);
            sqlParams[21] = new SqlParameter("@Cust_BillTo_PostalCode", this.BillToPCode);
            sqlParams[22] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[23] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[24] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[25] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[26] = new SqlParameter("@ActiveFlag", this.Status);

           return oDal.InsOrUpdtOrgCustomers(sqlParams);
        }

        public void GetOrgCustDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
                this.oDsOrgCustDetails = oDal.GetOrgCustDetails(sqlParams);

                if (oDsOrgCustDetails.Tables[0].Rows.Count > 0)
                {                    
                    this.CustID = new Guid(oDsOrgCustDetails.Tables[0].Rows[0]["PKCustID"].ToString());
                    this.CustName = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_Name"].ToString();
                    this.WebsiteUrl = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_WebSiteURL"].ToString();
                    this.PhoneNumber = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_Phone"].ToString();
                    this.FaxNumber = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_fax"].ToString();
                    this.ContactName = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_Contact_Name"].ToString();
                    this.ContactEmailAddress = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_Contact_EmailAddress"].ToString();
                    this.ContactPhoneNumber = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_Contact_Phone"].ToString();
                    this.AltContactName = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_AltContact_Name"].ToString();
                    this.AltContactEmailAddress = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_AltContact_EmailAddress"].ToString();
                    this.AltContactPhoneNumber = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_AltContact_Phone"].ToString();
                    this.Status = Convert.ToByte(Convert.ToBoolean(oDsOrgCustDetails.Tables[0].Rows[0]["ActiveFlag"].ToString()));
                    this.ShipToAddr1 = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_ShipTo_Address1"].ToString();
                    this.ShipToAddr2 = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_ShipTo_Address2"].ToString();
                    this.ShipToCity = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_ShipTo_City"].ToString();
                    this.ShipToState = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_ShipTo_State"].ToString();
                    this.ShipToPCode = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_ShipTo_PostalCode"].ToString();
                    this.BillToAddr1 = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_BillTo_Address1"].ToString();
                    this.BillToAddr2 = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_BillTo_Address2"].ToString();
                    this.BillToCity = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_BillTo_City"].ToString();
                    this.BillToState = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_BillTo_State"].ToString();
                    this.BillToPCode = oDsOrgCustDetails.Tables[0].Rows[0]["Cust_BillTo_PostalCode"].ToString();
                    this.CreatedBy = oDsOrgCustDetails.Tables[0].Rows[0]["Rec_CreatedBy"].ToString();
                    this.CreatedDate = Convert.ToDateTime(oDsOrgCustDetails.Tables[0].Rows[0]["Rec_CreatedDate"].ToString());
                    this.ModifiedBy = oDsOrgCustDetails.Tables[0].Rows[0]["Rec_ModifiedBy"].ToString();
                    this.ModifiedDate = Convert.ToDateTime(oDsOrgCustDetails.Tables[0].Rows[0]["Rec_ModifiedDate"].ToString());
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                sqlParams = null;
                oDsOrgCustDetails.Dispose();
            }
        }

        public void DelOrgCustomers()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
                oDal.DelOrgCustomers(sqlParams);

            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtOrgVendors()
        {
            SqlParameter[] sqlParams = new SqlParameter[28];

            sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
            sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
            sqlParams[2] = new SqlParameter("@Vendor_Name", this.VendorName);
            sqlParams[3] = new SqlParameter("@Vendor_WebSiteURL", this.WebsiteUrl);
            sqlParams[4] = new SqlParameter("@Vendor_Phone", this.PhoneNumber);
            sqlParams[5] = new SqlParameter("@Vendor_fax", this.FaxNumber);
            sqlParams[6] = new SqlParameter("@Vendor_Contact_Name", this.ContactName);
            sqlParams[7] = new SqlParameter("@Vendor_Contact_EmailAddress", this.ContactEmailAddress);
            sqlParams[8] = new SqlParameter("@Vendor_Contact_Phone", this.ContactPhoneNumber);
            sqlParams[9] = new SqlParameter("@Vendor_AltContact_Name", this.AltContactName);
            sqlParams[10] = new SqlParameter("@Vendor_AltContact_EmailAddress", this.AltContactEmailAddress);
            sqlParams[11] = new SqlParameter("@Vendor_AltContact_Phone", this.AltContactPhoneNumber);
            sqlParams[12] = new SqlParameter("@Vendor_ShipTo_Address1", this.ShipToAddr1);
            sqlParams[13] = new SqlParameter("@Vendor_ShipTo_Address2", this.ShipToAddr2);
            sqlParams[14] = new SqlParameter("@Vendor_ShipTo_City", this.ShipToCity);
            sqlParams[15] = new SqlParameter("@Vendor_ShipTo_State", this.ShipToState);
            sqlParams[16] = new SqlParameter("@Vendor_ShipTo_PostalCode", this.ShipToPCode);
            sqlParams[17] = new SqlParameter("@Vendor_BillTo_Address1", this.BillToAddr1);
            sqlParams[18] = new SqlParameter("@Vendor_BillTo_Address2", this.BillToAddr2);
            sqlParams[19] = new SqlParameter("@Vendor_BillTo_City", this.BillToCity);
            sqlParams[20] = new SqlParameter("@Vendor_BillTo_State", this.BillToState);
            sqlParams[21] = new SqlParameter("@Vendor_BillTo_PostalCode", this.BillToPCode);
            sqlParams[22] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[23] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[24] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[25] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[26] = new SqlParameter("@ActiveFlag", this.Status);
            sqlParams[27] = new SqlParameter("@Vend_LoginPwd", this.LoginPassword);

            return oDal.InsOrUpdtOrgVendors(sqlParams);
        }

        public void GetOrgVendors()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
            this.oDsOrgVendors = oDal.GetOrgVendors(sqlParams);

            if (oDsOrgVendors.Tables[0].Rows.Count > 0)
            {                
                this.CustID = new Guid(oDsOrgVendors.Tables[0].Rows[0]["PKCustID"].ToString());
                this.VendorName = oDsOrgVendors.Tables[0].Rows[0]["Vendor_Name"].ToString();
                this.WebsiteUrl = oDsOrgVendors.Tables[0].Rows[0]["Vendor_WebSiteURL"].ToString();
                this.PhoneNumber = oDsOrgVendors.Tables[0].Rows[0]["Vendor_Phone"].ToString();
                this.FaxNumber = oDsOrgVendors.Tables[0].Rows[0]["Vendor_fax"].ToString();
                this.ContactName = oDsOrgVendors.Tables[0].Rows[0]["Vendor_Contact_Name"].ToString();
                this.ContactEmailAddress = oDsOrgVendors.Tables[0].Rows[0]["Vendor_Contact_EmailAddress"].ToString();
                this.ContactPhoneNumber = oDsOrgVendors.Tables[0].Rows[0]["Vendor_Contact_Phone"].ToString();
                this.AltContactName = oDsOrgVendors.Tables[0].Rows[0]["Vendor_AltContact_Name"].ToString();
                this.AltContactEmailAddress = oDsOrgVendors.Tables[0].Rows[0]["Vendor_AltContact_EmailAddress"].ToString();
                this.AltContactPhoneNumber = oDsOrgVendors.Tables[0].Rows[0]["Vendor_AltContact_Phone"].ToString();
                this.Status = Convert.ToByte(Convert.ToBoolean(oDsOrgVendors.Tables[0].Rows[0]["ActiveFlag"].ToString()));
                this.LoginPassword = oDsOrgVendors.Tables[0].Rows[0]["Vend_LoginPwd"].ToString();
                this.ShipToAddr1 = oDsOrgVendors.Tables[0].Rows[0]["Vendor_ShipTo_Address1"].ToString();
                this.ShipToAddr2 = oDsOrgVendors.Tables[0].Rows[0]["Vendor_ShipTo_Address2"].ToString();
                this.ShipToCity = oDsOrgVendors.Tables[0].Rows[0]["Vendor_ShipTo_City"].ToString();
                this.ShipToState = oDsOrgVendors.Tables[0].Rows[0]["Vendor_ShipTo_State"].ToString();
                this.ShipToPCode = oDsOrgVendors.Tables[0].Rows[0]["Vendor_ShipTo_PostalCode"].ToString();
                this.BillToAddr1 = oDsOrgVendors.Tables[0].Rows[0]["Vendor_BillTo_Address1"].ToString();
                this.BillToAddr2 = oDsOrgVendors.Tables[0].Rows[0]["Vendor_BillTo_Address2"].ToString();
                this.BillToCity = oDsOrgVendors.Tables[0].Rows[0]["Vendor_BillTo_City"].ToString();
                this.BillToState = oDsOrgVendors.Tables[0].Rows[0]["Vendor_BillTo_State"].ToString();
                this.BillToPCode = oDsOrgVendors.Tables[0].Rows[0]["Vendor_BillTo_PostalCode"].ToString();
                this.CreatedBy = oDsOrgVendors.Tables[0].Rows[0]["Rec_CreatedBy"].ToString();
                this.CreatedDate = Convert.ToDateTime(oDsOrgVendors.Tables[0].Rows[0]["Rec_CreatedDate"].ToString());
                this.ModifiedBy = oDsOrgVendors.Tables[0].Rows[0]["Rec_ModifiedBy"].ToString();
                this.ModifiedDate = Convert.ToDateTime(oDsOrgVendors.Tables[0].Rows[0]["Rec_ModifiedDate"].ToString());
            }

        }

        public void DelOrgVendors()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PKCustID", this.CustID);
                oDal.DelOrgVendors(sqlParams);

            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }


        public string InsOrUpdtOrgEmployees()
        {
            SqlParameter[] sqlParams = new SqlParameter[41];

            sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
            sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
            sqlParams[2] = new SqlParameter("@Emp_Fname", this.FirstName);
            sqlParams[3] = new SqlParameter("@Emp_Mname", this.MiddleName);
            sqlParams[4] = new SqlParameter("@Emp_Lname", this.LastName);
            sqlParams[5] = new SqlParameter("@Emp_Prefix", this.Prefix);
            sqlParams[6] = new SqlParameter("@Emp_CellPhone", this.CellPhone);
            sqlParams[7] = new SqlParameter("@Emp_HomePhone", this.HomePhone);
            sqlParams[8] = new SqlParameter("@Emp_BusinessPhone", this.BuisinessPhone);
            sqlParams[9] = new SqlParameter("@Emp_EmailID", this.EmailID);
            sqlParams[10] = new SqlParameter("@Emp_AlternateEmail", this.AltContactEmailAddress);
            sqlParams[11] = new SqlParameter("@Emp_JobTitle", this.JobTitle);
            sqlParams[12] = new SqlParameter("@Emp_LoginPwd", this.LoginPassword);
            sqlParams[13] = new SqlParameter("@Emp_HireDate", this.HiredDate);
            sqlParams[14] = new SqlParameter("@Emp_TerminationDate", this.TerminationDate);
            sqlParams[15] = new SqlParameter("@Emp_Home_Address1", this.AddressPers1);
            sqlParams[16] = new SqlParameter("@Emp_Home_Address2", this.AddressPers2);
            sqlParams[17] = new SqlParameter("@Emp_Home_City", this.CityPers);
            sqlParams[18] = new SqlParameter("@Emp_Home_State", this.StatePers);
            sqlParams[19] = new SqlParameter("@Emp_Home_PostalCode", this.PostalCodePers);
            sqlParams[20] = new SqlParameter("@Emp_Bus_Address1", this.Address1);
            sqlParams[21] = new SqlParameter("@Emp_Bus_Address2", this.Address2);
            sqlParams[22] = new SqlParameter("@Emp_Bus_City", this.City);
            sqlParams[23] = new SqlParameter("@Emp_Bus_State", this.State);
            sqlParams[24] = new SqlParameter("@Emp_Bus_PostalCode", this.PostalCode);
            sqlParams[25] = new SqlParameter("@FK_Org_Roles", this.OrgRoleID);
            sqlParams[26] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[27] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[28] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[29] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[30] = new SqlParameter("@ActiveFlag", this.Status);
            sqlParams[31] = new SqlParameter("@Emp_Code", this.OrgEmpCode);
            sqlParams[32] = new SqlParameter("@Emp_Categ", this.EmpCateg);
            sqlParams[33] = new SqlParameter("@Emp_Salary", this.EmpSal);
            sqlParams[34] = new SqlParameter("@Doc_Number", this.DocNo);
            sqlParams[35] = new SqlParameter("@Doc_ExpDate", this.DocExpDate);
            sqlParams[36] = new SqlParameter("@LCA_Number", this.LcaNo);
            sqlParams[37] = new SqlParameter("@LCA_ExpDate", this.LcaExpDate);
            sqlParams[38] = new SqlParameter("@Perm_CertNumber", this.PermCertNo);
            sqlParams[39] = new SqlParameter("@I140_Number", this.I140No);
            sqlParams[40] = new SqlParameter("@I485_Number", this.I485No);

            return oDal.InsOrUpdtOrgEmployees(sqlParams);
        }

        public void GetOrgEmpDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
            this.oDsOrgEmpDetails = oDal.GetOrgEmpDetails(sqlParams);

            if (this.OrgEmpId != null)
            {
                this.Prefix = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Prefix"].ToString();
                this.OrgEmpCode = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Code"].ToString();
                this.FirstName = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Fname"].ToString();
                this.MiddleName = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_MName"].ToString();
                this.LastName = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_LName"].ToString();
                if (oDsOrgEmpDetails.Tables[0].Rows[0]["FK_Org_Roles"].ToString() != "")
                    this.OrgRoleID = new Guid(oDsOrgEmpDetails.Tables[0].Rows[0]["FK_Org_Roles"].ToString());
                else
                    this.OrgRoleID = null;
                this.EmailID = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_EmailID"].ToString();
                this.AltContactEmailAddress = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_AlternateEmail"].ToString();
                this.CellPhone = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_CellPhone"].ToString();
                this.HomePhone = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_HomePhone"].ToString();
                this.BuisinessPhone = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_BusinessPhone"].ToString();
                this.Status = Convert.ToByte(Convert.ToBoolean(oDsOrgEmpDetails.Tables[0].Rows[0]["ActiveFlag"].ToString()));
                this.AddressPers1 = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Home_Address1"].ToString();
                this.AddressPers2 = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Home_Address2"].ToString();
                this.CityPers = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Home_City"].ToString();
                this.StatePers = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Home_State"].ToString();                
                this.PostalCodePers = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Home_PostalCode"].ToString();
                this.Address1 = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Bus_Address1"].ToString();
                this.Address2 = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Bus_Address2"].ToString();
                this.City = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Bus_City"].ToString();                
                this.State =oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Bus_State"].ToString();
                
                this.PostalCode = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Bus_PostalCode"].ToString();
                this.JobTitle = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_JobTitle"].ToString();
                this.LoginPassword = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_LoginPwd"].ToString();
                this.HiredDate = Convert.ToDateTime(oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_HireDate"].ToString());
                if (oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_TerminationDate"].ToString() != "")
                    this.TerminationDate = Convert.ToDateTime(oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_TerminationDate"].ToString());
                else
                    this.TerminationDate = null;
                this.EmpCateg = oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Categ"].ToString();
                if (oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Salary"].ToString() != "")
                    this.EmpSal = Convert.ToDecimal(oDsOrgEmpDetails.Tables[0].Rows[0]["Emp_Salary"].ToString());                
                this.DocNo = oDsOrgEmpDetails.Tables[0].Rows[0]["Doc_Number"].ToString();
                this.LcaNo = oDsOrgEmpDetails.Tables[0].Rows[0]["LCA_Number"].ToString();
                this.PermCertNo = oDsOrgEmpDetails.Tables[0].Rows[0]["Perm_CertNumber"].ToString();
                this.I140No = oDsOrgEmpDetails.Tables[0].Rows[0]["I140_Number"].ToString();
                this.I485No = oDsOrgEmpDetails.Tables[0].Rows[0]["I485_Number"].ToString();
                if (oDsOrgEmpDetails.Tables[0].Rows[0]["Doc_ExpDate"].ToString() != "")
                    this.DocExpDate = Convert.ToDateTime(oDsOrgEmpDetails.Tables[0].Rows[0]["Doc_ExpDate"].ToString());
                else
                    this.DocExpDate = null;
                if (oDsOrgEmpDetails.Tables[0].Rows[0]["LCA_ExpDate"].ToString() != "")
                    this.LcaExpDate = Convert.ToDateTime(oDsOrgEmpDetails.Tables[0].Rows[0]["LCA_ExpDate"].ToString());
                else
                    this.LcaExpDate = null;
            }

        }
        public void GetTimeSheetAdminEmpDetails()
        {

            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
            this.oDsOrgEmpDetails = oDal.GetActiveEmpDetails(sqlParams);
        }

        public void GetTimeOffAdminEmpDetails()
        {

            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
            this.oDsOrgEmpDetails = oDal.GetActiveEmpDetails(sqlParams);
        }



        public void SearchOrgEmpDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[7];
            sqlParams[0] = new SqlParameter("@Emp_Fname", this.FirstName);
            sqlParams[1] = new SqlParameter("@Emp_Lname", this.LastName);
            sqlParams[2] = new SqlParameter("@Emp_CellPhone", this.CellPhone);
            sqlParams[3] = new SqlParameter("@Emp_HomePhone", this.HomePhone);
            sqlParams[4] = new SqlParameter("@Emp_BusinessPhone", this.BuisinessPhone);
            sqlParams[5] = new SqlParameter("@Emp_EmailID", this.EmailID);
            sqlParams[6] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            this.oDsOrgEmpDetails = oDal.SearchOrgEmpDetails(sqlParams);
        }

        public void DelOrgEmpDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
                oDal.DelOrgEmpDetails(sqlParams);

            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtOrgRoles()
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@PK_Org_RoleID", this.OrgRoleID);
            sqlParams[1] = new SqlParameter("@FK_OrgID", this.OrgID);
            sqlParams[2] = new SqlParameter("@Org_Role_Name", this.OrgRoleName);
            sqlParams[3] = new SqlParameter("@Org_Role_Description", this.OrgRoleDesc);
            sqlParams[4] = new SqlParameter("@ActiveFlag", this.Status);

            return oDal.InsOrUpdtOrgRoles(sqlParams);
        }

        public void GetOrgRoles()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_Org_RoleID", this.OrgRoleID);
            this.oDsOrgRoles = oDal.GetOrgRoles(sqlParams);
        }

        public void DelOrgRoles()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_RoleID", this.OrgRoleID);
                oDal.DelOrgRoles(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtRolePermissions()
        {
            SqlParameter[] sqlParams = new SqlParameter[9];

            sqlParams[0] = new SqlParameter("@PK_RolePermission_ID", this.RolePermissionID);
            sqlParams[1] = new SqlParameter("@Fk_PageID", this.PageID);
            sqlParams[2] = new SqlParameter("@PermissionType", this.PermissionType);
            sqlParams[3] = new SqlParameter("@FK_Org_RoleID", this.OrgRoleID);
            sqlParams[4] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[5] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[6] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[7] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[8] = new SqlParameter("@ActiveFlag", this.Status);

            return oDal.InsOrUpdtRolePermissions(sqlParams);
        }

        public void GetRolePermissions()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@Pk_RolePermission_ID", this.RolePermissionID);
            this.oDsPagePermissions = oDal.GetRolePermissions(sqlParams);
        }

        public void GetPageDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@Pk_PageID", this.PageID);
            this.oDsPageDetails = oDal.GetPageDetails(sqlParams);   
        }

        public string CheckLogin()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@Emp_EmailID", this.EmailID);
            sqlParams[1] = new SqlParameter("@Emp_LoginPwd", this.LoginPassword);

            return oDal.CheckLogin(sqlParams);
        }

        public string CheckVendorLogin()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];

            sqlParams[0] = new SqlParameter("@Vendor_Contact_EmailAddress", this.EmailID);
            sqlParams[1] = new SqlParameter("@Vend_LoginPwd", this.LoginPassword);

            return oDal.CheckVendorLogin(sqlParams);
        }

        public void GetUserDetail()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@Emp_Code", this.OrgEmpCode);
            this.oDsEmpDetails = oDal.GetUserDetail(sqlParams);
            if (this.oDsEmpDetails.Tables[0].Rows.Count > 0)
            {
                this.OrgEmpId = new Guid(oDsEmpDetails.Tables[0].Rows[0]["PK_Org_EmpID"].ToString());
                this.FirstName = oDsEmpDetails.Tables[0].Rows[0]["Emp_Fname"].ToString();
                this.MiddleName = oDsEmpDetails.Tables[0].Rows[0]["Emp_MName"].ToString();
                this.LastName = oDsEmpDetails.Tables[0].Rows[0]["Emp_Lname"].ToString();
                this.Prefix = oDsEmpDetails.Tables[0].Rows[0]["Emp_Prefix"].ToString();

                if (oDsEmpDetails.Tables[0].Rows[0]["FK_Org_Roles"].ToString() != "")
                {
                    this.OrgRoleID = new Guid(oDsEmpDetails.Tables[0].Rows[0]["FK_Org_Roles"].ToString());
                    this.OrgRoleName = oDsEmpDetails.Tables[0].Rows[0]["Org_Role_Name"].ToString();
                }
                else
                    this.OrgRoleID = null;
                this.EmailID = oDsEmpDetails.Tables[0].Rows[0]["Emp_EmailID"].ToString();
                this.AltContactEmailAddress = oDsEmpDetails.Tables[0].Rows[0]["Emp_AlternateEmail"].ToString();
                this.CellPhone = oDsEmpDetails.Tables[0].Rows[0]["Emp_CellPhone"].ToString();
                this.HomePhone = oDsEmpDetails.Tables[0].Rows[0]["Emp_HomePhone"].ToString();
                this.BuisinessPhone = oDsEmpDetails.Tables[0].Rows[0]["Emp_BusinessPhone"].ToString();
                this.Status = Convert.ToByte(Convert.ToBoolean(oDsEmpDetails.Tables[0].Rows[0]["ActiveFlag"].ToString()));
                this.AddressPers1 = oDsEmpDetails.Tables[0].Rows[0]["Emp_Home_Address1"].ToString();
                this.AddressPers2 = oDsEmpDetails.Tables[0].Rows[0]["Emp_Home_Address2"].ToString();
                this.CityPers = oDsEmpDetails.Tables[0].Rows[0]["Emp_Home_City"].ToString();
                this.StatePers = oDsEmpDetails.Tables[0].Rows[0]["Emp_Home_State"].ToString();
                this.PostalCodePers = oDsEmpDetails.Tables[0].Rows[0]["Emp_Home_PostalCode"].ToString();
                this.Address1 = oDsEmpDetails.Tables[0].Rows[0]["Emp_Bus_Address1"].ToString();
                this.Address2 = oDsEmpDetails.Tables[0].Rows[0]["Emp_Bus_Address2"].ToString();
                this.City = oDsEmpDetails.Tables[0].Rows[0]["Emp_Bus_City"].ToString();
                this.State = oDsEmpDetails.Tables[0].Rows[0]["Emp_Bus_State"].ToString();

                this.PostalCode = oDsEmpDetails.Tables[0].Rows[0]["Emp_Bus_PostalCode"].ToString();
                this.JobTitle = oDsEmpDetails.Tables[0].Rows[0]["Emp_JobTitle"].ToString();
                this.LoginPassword = oDsEmpDetails.Tables[0].Rows[0]["Emp_LoginPwd"].ToString();
                this.HiredDate = Convert.ToDateTime(oDsEmpDetails.Tables[0].Rows[0]["Emp_HireDate"].ToString());
                if (oDsEmpDetails.Tables[0].Rows[0]["Emp_TerminationDate"].ToString() != "")
                    this.TerminationDate = Convert.ToDateTime(oDsEmpDetails.Tables[0].Rows[0]["Emp_TerminationDate"].ToString());
                else
                    this.TerminationDate = null;

            }
        }       

        public string InsOrUpdtTimeSheet()
        {
            SqlParameter[] sqlParams = new SqlParameter[20];

            sqlParams[0] = new SqlParameter("@PK_TimeSheetID", this.TimesheetID);
            sqlParams[1] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[2] = new SqlParameter("@EndDate", this.EndDate);            
            sqlParams[3] = new SqlParameter("@Mon", this.Mon);
            sqlParams[4] = new SqlParameter("@Tue", this.Tue);
            sqlParams[5] = new SqlParameter("@Wed", this.Wed);
            sqlParams[6] = new SqlParameter("@Thu", this.Thu);
            sqlParams[7] = new SqlParameter("@Fri", this.Fri);
            sqlParams[8] = new SqlParameter("@Sat", this.Sat);
            sqlParams[9] = new SqlParameter("@Sun", this.Sun);
            sqlParams[10] = new SqlParameter("@Total", this.Total);
            sqlParams[11] = new SqlParameter("@TSFileName", this.FileName);
            sqlParams[12] = new SqlParameter("@TSFilePath", this.FilePath);
            sqlParams[13] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[14] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[15] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[16] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[17] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[18] = new SqlParameter("@Activeflag", this.Status);
            sqlParams[19] = new SqlParameter("@TSStatus", this.Approved);
            return oDal.InsOrUpdtTimeSheet(sqlParams);
        }

        public string UpdateTimeSheet()
        {
            SqlParameter[] sqlParams = new SqlParameter[5];

            sqlParams[0] = new SqlParameter("@PK_TimeSheetID", this.TimesheetID);
            sqlParams[1] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[2] = new SqlParameter("@EndDate", this.EndDate);
            sqlParams[3] = new SqlParameter("@TSFileName", this.FileName);
            sqlParams[4] = new SqlParameter("@TSFilePath", this.FilePath);            
            return oDal.UpdateTimeSheet(sqlParams);
        }

        public void GetTimeSheetDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@PK_Org_EmpID", this.OrgEmpId);
            sqlParams[1] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[2] = new SqlParameter("@EndDate", this.EndDate);
            this.oDsTSDetails = oDal.GetTimeSheetDetails(sqlParams);
            if (this.oDsTSDetails.Tables[0].Rows.Count > 0)
            {
                this.TimesheetID = new Guid(oDsTSDetails.Tables[0].Rows[0]["PK_TimeSheetID"].ToString());
                this.Mon = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Mon"].ToString());
                this.Tue = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Tue"].ToString());
                this.Wed = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Wed"].ToString());
                this.Thu = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Thu"].ToString());
                this.Fri = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Fri"].ToString());
                this.Sat = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Sat"].ToString());
                this.Sun = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Sun"].ToString());
                this.Total = Convert.ToDecimal(oDsTSDetails.Tables[0].Rows[0]["Total"].ToString());
                this.FileName = oDsTSDetails.Tables[0].Rows[0]["TSFileName"].ToString();
                this.FilePath = oDsTSDetails.Tables[0].Rows[0]["TSFilePath"].ToString();                
            }                       
        }

        public string InsOrUpdtTasks()
        {
            SqlParameter[] sqlParams = new SqlParameter[11];
            
            sqlParams[0] = new SqlParameter("@PK_TaskID", this.TaskID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@FK_TimeSheetID", this.TimesheetID);
            sqlParams[3] = new SqlParameter("@Task_Number", this.TskNumber);
            sqlParams[4] = new SqlParameter("@Task_Date", this.TskDate);
            sqlParams[5] = new SqlParameter("@Task_Name", this.TskName);
            sqlParams[6] = new SqlParameter("@Task_Description", this.TskDesc);            
            sqlParams[7] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[8] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[9] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[10] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            
            return oDal.InsOrUpdtTasks(sqlParams);
        }

        public void GetTasks()
        {
            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@PK_TaskID", this.TaskID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@FK_TimeSheetID", this.TimesheetID);
            this.oDsTasks = oDal.GetTasks(sqlParams);
        }

        public void DelTasks()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@FK_TimeSheetID", this.TimesheetID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
             oDal.DelTasks(sqlParams);
        } 

        public string InsOrUpdtProjects()
        {
            SqlParameter[] sqlParams = new SqlParameter[22];

            sqlParams[0] = new SqlParameter("@PK_Org_ProjectID", this.OrgProjectID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@Proj_Code", this.ProjCode);
            sqlParams[3] = new SqlParameter("@Proj_name", this.ProjName);
            sqlParams[4] = new SqlParameter("@Proj_Description", this.ProjDesc);
            sqlParams[5] = new SqlParameter("@Proj_StartDate", this.StartDate);
            sqlParams[6] = new SqlParameter("@Proj_EndDate", this.EndDate);
            sqlParams[7] = new SqlParameter("@FK_Client1", this.Client1);
            sqlParams[8] = new SqlParameter("@FK_Client2", this.Client2);
            sqlParams[9] = new SqlParameter("@FK_EndClient", this.EndClient);
            sqlParams[10] = new SqlParameter("@BillRate", this.BillRate);
            sqlParams[11] = new SqlParameter("@BillingCycle", this.BillingCycle);
            sqlParams[12] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[13] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[14] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[15] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);            
            sqlParams[16] = new SqlParameter("@ActiveFlag", this.Status);
            sqlParams[17] = new SqlParameter("@OverTime_Allowed", this.OverTimeAllow);
            sqlParams[18] = new SqlParameter("@OverTime_Rate", this.OverTimeRate);
            sqlParams[19] = new SqlParameter("@Terms", this.Terms);
            sqlParams[20] = new SqlParameter("@EmailTo", this.EmailTo);
            sqlParams[21] = new SqlParameter("@EmailCCTo", this.EmailCC);

            return oDal.InsOrUpdtProjects(sqlParams);
        }

        public void GetProjects()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@PK_Org_ProjectID", this.OrgProjectID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            this.oDsProjDetails = oDal.GetProjects(sqlParams);
            if (this.oDsProjDetails.Tables[0].Rows.Count > 0)
            {
                this.ProjCode = this.oDsProjDetails.Tables[0].Rows[0]["Proj_Code"].ToString();
                this.ProjName = this.oDsProjDetails.Tables[0].Rows[0]["Proj_name"].ToString();
                this.ProjDesc = this.oDsProjDetails.Tables[0].Rows[0]["Proj_Description"].ToString();
                if (this.oDsProjDetails.Tables[0].Rows[0]["Proj_StartDate"].ToString() != "")
                    this.StartDate = Convert.ToDateTime(this.oDsProjDetails.Tables[0].Rows[0]["Proj_StartDate"].ToString());
                if (this.oDsProjDetails.Tables[0].Rows[0]["Proj_EndDate"].ToString() != "")
                    this.EndDate = Convert.ToDateTime(this.oDsProjDetails.Tables[0].Rows[0]["Proj_EndDate"].ToString());
                if (this.oDsProjDetails.Tables[0].Rows[0]["FK_Client1"].ToString() != "")
                this.Client1 =new Guid(this.oDsProjDetails.Tables[0].Rows[0]["FK_Client1"].ToString());

                if (this.oDsProjDetails.Tables[0].Rows[0]["FK_Client2"].ToString() != "")
                this.Client2 = new Guid(this.oDsProjDetails.Tables[0].Rows[0]["FK_Client2"].ToString());

                if (this.oDsProjDetails.Tables[0].Rows[0]["FK_EndClient"].ToString() != "")
                this.EndClient = new Guid(this.oDsProjDetails.Tables[0].Rows[0]["FK_EndClient"].ToString());

                if (this.oDsProjDetails.Tables[0].Rows[0]["BillRate"].ToString() != "")
                this.BillRate =Convert.ToDecimal(this.oDsProjDetails.Tables[0].Rows[0]["BillRate"].ToString());
                if (this.oDsProjDetails.Tables[0].Rows[0]["BillingCycle"].ToString() != "")
                this.BillingCycle = Convert.ToInt32(this.oDsProjDetails.Tables[0].Rows[0]["BillingCycle"].ToString());
                if (this.oDsProjDetails.Tables[0].Rows[0]["OverTime_Allowed"].ToString() != "")
                    this.OverTimeAllow = Convert.ToByte(Convert.ToBoolean(this.oDsProjDetails.Tables[0].Rows[0]["OverTime_Allowed"].ToString()));
                if (this.oDsProjDetails.Tables[0].Rows[0]["OverTime_Rate"].ToString() != "")
                    this.OverTimeRate = Convert.ToDecimal(this.oDsProjDetails.Tables[0].Rows[0]["OverTime_Rate"].ToString());
                this.Status = Convert.ToByte(Convert.ToBoolean(this.oDsProjDetails.Tables[0].Rows[0]["ActiveFlag"].ToString()));
                this.Terms = this.oDsProjDetails.Tables[0].Rows[0]["Terms"].ToString();
                this.EmailTo=this.oDsProjDetails.Tables[0].Rows[0]["EmailTO"].ToString();
                this.EmailCC = this.oDsProjDetails.Tables[0].Rows[0]["EmailCCTo"].ToString();
                this.Cust_Name = this.oDsProjDetails.Tables[0].Rows[0]["Cust_Name"].ToString();
            }
        }

        public void DelProjects()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];

            try
            {
                sqlParams[0] = new SqlParameter("@PK_Org_ProjectID", this.OrgProjectID);
                oDal.DelProjects(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtTimeOffType()
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@PK_TimeOffTypeID", this.TimeOffTypeID);
            sqlParams[1] = new SqlParameter("@TimeOffDescription", this.TimeOffDesc);           
            sqlParams[2] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[3] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[4] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[5] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[6] = new SqlParameter("@ActiveFlag", this.Status);

            return oDal.InsOrUpdtTimeOffType(sqlParams);
        }

        public void GetTimeOffType()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_TimeOffTypeID", this.TimeOffTypeID);
            this.oDsTimeOffType = oDal.GetTimeOffType(sqlParams);
            
        }

        public void DelTimeOffType()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_TimeOffTypeID", this.TimeOffTypeID);
                oDal.DelTimeOffType(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        
        public string InsOrUpdtEmployeeTimeOff()
        {
            SqlParameter[] sqlParams = new SqlParameter[13];

            sqlParams[0] = new SqlParameter("@PK_EmpTimeOffID", this.EmpTimeOffTypeID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@FK_TimeOffTypeID", this.TimeOffTypeID);
            sqlParams[3] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[4] = new SqlParameter("@EndDate", this.EndDate);
            sqlParams[5] = new SqlParameter("@FileName", this.FileName);
            sqlParams[6] = new SqlParameter("@FilePath", this.FilePath);
            sqlParams[7] = new SqlParameter("@Approved_Status", this.AppStatus);
            sqlParams[8] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[9] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[10] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[11] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[12] = new SqlParameter("@Comments", this.Comments);            

            return oDal.InsOrUpdtEmployeeTimeOff(sqlParams);
        }

        public void GetEmployeeTimeOff()
        {
            SqlParameter[] sqlParams = new SqlParameter[4];
            sqlParams[0] = new SqlParameter("@PK_EmpTimeOffID", this.EmpTimeOffTypeID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[3] = new SqlParameter("@EndDate", this.EndDate);
            this.oDsEmpTimeOff = oDal.GetEmployeeTimeOff(sqlParams);
        }

        public void DelEmployeeTimeOff()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_EmpTimeOffID", this.EmpTimeOffTypeID);
                oDal.DelEmployeeTimeOff(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        
        public string InsOrUpdtHolidays()
        {
            SqlParameter[] sqlParams = new SqlParameter[9];

            sqlParams[0] = new SqlParameter("@PK_HolidaysID", this.HolidaysID);
            sqlParams[1] = new SqlParameter("@Holidays_Name", this.HolName);
            sqlParams[2] = new SqlParameter("@Holidays_Description", this.HolDesc);
            sqlParams[3] = new SqlParameter("@Holidays_Date", this.HolDate);
            sqlParams[4] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[5] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[6] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[7] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[8] = new SqlParameter("@ActiveFlag", this.Status);
            return oDal.InsOrUpdtHolidays(sqlParams);
        }

        public void GetHolidays()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_HolidaysID", this.HolidaysID);            
            this.oDsHolidays = oDal.GetHolidays(sqlParams);
        }

        public void DelHolidays()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_HolidaysID", this.HolidaysID);
                oDal.DelHolidays(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string ChangeForgotPassword()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {                
                sqlParams[0] = new SqlParameter("@Emp_EmailID", this.EmailID);                
                return oDal.ChangeForgotPassword(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void ApproveTimeOff()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_EmpTimeOffID", this.EmpTimeOffTypeID);
                sqlParams[1] = new SqlParameter("@Approved_Status", this.AppStatus);
                oDal.ApproveTimeOff(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void SearchTimeSheetDetails()
        {
            SqlParameter[] sqlParams = new SqlParameter[4];
            sqlParams[0] = new SqlParameter("@PK_TimeSheetID", this.TimesheetID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[3] = new SqlParameter("@EndDate", this.EndDate);
            this.oDsTSDetails = oDal.SearchTimeSheetDetails(sqlParams);
        }

        public void MissingTimesheet()
        {
            SqlParameter[] sqlParams = new SqlParameter[3];
           
            sqlParams[0] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[1] = new SqlParameter("@StartDate", this.StartDate);
            sqlParams[2] = new SqlParameter("@EndDate", this.EndDate);
            this.oDsMissingTS = oDal.MissingTimesheet(sqlParams);
        }

        public void ApproveTimesheets()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_TimeSheetID", this.TimesheetID);
                sqlParams[1] = new SqlParameter("@Approved_Status", this.TsStatus);
                oDal.ApproveTimesheets(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtVendInsCertificate()
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@InsID", this.InsCertID);
            sqlParams[1] = new SqlParameter("@FKCustID", this.CustID);
            sqlParams[2] = new SqlParameter("@Effect_End_Date", this.EndDate);
            sqlParams[3] = new SqlParameter("@Certif_path", this.CertPath);
            return oDal.InsOrUpdtVendInsCertificate(sqlParams);
        }

        public void GetVendInsCertificate()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@InsID", this.InsCertID);
            sqlParams[1] = new SqlParameter("@FKCustID", this.CustID);
            this.oDsVendInsCert = oDal.GetVendInsCertificate(sqlParams);
        }

        public string InsOrUpdtVendInvoice()
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@InvoiceID", this.InvoiceID);
            sqlParams[1] = new SqlParameter("@FKCustID", this.CustID);
            sqlParams[2] = new SqlParameter("@Invoice_Amnt", this.InvAmnt);
            sqlParams[3] = new SqlParameter("@Consult_Name", this.ConsultName);
            sqlParams[4] = new SqlParameter("@Start_Date", this.StartDate);
            sqlParams[5] = new SqlParameter("@End_Date", this.EndDate);
            sqlParams[6] = new SqlParameter("@Invoice_path", this.InvPath);
            return oDal.InsOrUpdtVendInvoice(sqlParams);
        }

        public void GetVendInvoice()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@InvoiceID", this.InvoiceID);
            sqlParams[1] = new SqlParameter("@FKCustID", this.CustID);
            this.oDsVendInvoice = oDal.GetVendInvoice(sqlParams);
        }

        public string InsOrUpdtDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@DocID", this.DocID);
            sqlParams[1] = new SqlParameter("@Doc_Title", this.DocTitle);
            sqlParams[2] = new SqlParameter("@Doc_Path", this.DocPath);
            sqlParams[3] = new SqlParameter("@Doc_Type", this.DocType);
            
            return oDal.InsOrUpdtDocuments(sqlParams);
        }

        public void GetDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@Doc_Type", this.DocType);
            this.oDsDocuments = oDal.GetDocuments(sqlParams);
        }

        public string InsOrUpdtEmpDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[4];

            sqlParams[0] = new SqlParameter("@DocID", this.DocID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@Doc_Title", this.DocTitle);
            sqlParams[3] = new SqlParameter("@Doc_Path", this.DocPath);           

            return oDal.InsOrUpdtEmpDocuments(sqlParams);
        }

        public void GetEmpDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            this.oDsDocuments = oDal.GetEmpDocuments(sqlParams);
        }

        public void DelDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@DocID", this.DocID);
                oDal.DelDocuments(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelEmpDocuments()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@DocID", this.DocID);
                oDal.DelEmpDocuments(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtEmail(string strCase)
        {
            SqlParameter[] sqlParams = new SqlParameter[7];

            sqlParams[0] = new SqlParameter("@ID", this.ID);
            sqlParams[1] = new SqlParameter("@From_Email", this.FrmEmail);
            sqlParams[2] = new SqlParameter("@Password", this.Password);
            sqlParams[3] = new SqlParameter("@To_Emails", this.ToEmails);
            sqlParams[4] = new SqlParameter("@case", strCase);
            sqlParams[5] = new SqlParameter("@Smtp_Host", this.SmtpHost);
            sqlParams[6] = new SqlParameter("@Smtp_Port", this.SmtpPort);

            return oDal.InsOrUpdtEmail(sqlParams);
        }

        public void GetEmail()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@ID", this.ID);
            this.oDsEmail = oDal.GetEmail(sqlParams);
        }

        public string InsOrUpdtRatingScale()
        {
            SqlParameter[] sqlParams = new SqlParameter[8];

            sqlParams[0] = new SqlParameter("@PK_RatingScaleID", this.RatingScaleID);
            sqlParams[1] = new SqlParameter("@Rating_Scale", this.RatingScale);
            sqlParams[2] = new SqlParameter("@Single_Selection", this.SingleSelection);
            sqlParams[3] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[4] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[5] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[6] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[7] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);

            return oDal.InsOrUpdtRatingScale(sqlParams);
        }

        public string InsOrUpdtRatingScaleTitle()
        {
            SqlParameter[] sqlParams = new SqlParameter[10];

            sqlParams[0] = new SqlParameter("@PK_RatingScaleTitleID", this.RatingScaleTitleID);
            sqlParams[1] = new SqlParameter("@FK_RatingScaleID", this.RatingScaleID);
            sqlParams[2] = new SqlParameter("@Title", this.RatingTitle);
            sqlParams[3] = new SqlParameter("@Description", this.Description);
            sqlParams[4] = new SqlParameter("@Rating_Order", this.RatingOrder);
            sqlParams[5] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[6] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[7] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[8] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[9] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);

            return oDal.InsOrUpdtRatingScaleTitle(sqlParams);
        }

        public string InsOrUpdtReviewPeriod()
        {
            SqlParameter[] sqlParams = new SqlParameter[9];

            sqlParams[0] = new SqlParameter("@PK_ReviewPeriodID", this.ReviewPeriodID);
            sqlParams[1] = new SqlParameter("@Period_Name", this.PeriodName);
            sqlParams[2] = new SqlParameter("@Start_Date", this.StartDate);
            sqlParams[3] = new SqlParameter("@End_Date", this.EndDate);
            sqlParams[4] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[5] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[6] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[7] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[8] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);

            return oDal.InsOrUpdtReviewPeriod(sqlParams);
        }

        public string InsOrUpdtRatingTemplate()
        {
            SqlParameter[] sqlParams = new SqlParameter[10];

            sqlParams[0] = new SqlParameter("@PK_TemplateID", this.TemplateID);
            sqlParams[1] = new SqlParameter("@Template_Name", this.TemplateName);
            sqlParams[2] = new SqlParameter("@FK_RatingScaleID", this.RatingScaleID);
            sqlParams[3] = new SqlParameter("@FK_ReviewPeriodID", this.ReviewPeriodID);
            sqlParams[4] = new SqlParameter("@Instructions", this.Instructions);
            sqlParams[5] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[6] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[7] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[8] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[9] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            
            return oDal.InsOrUpdtRatingTemplate(sqlParams);
        }

        public string InsOrUpdtRatTemplQues()
        {
            SqlParameter[] sqlParams = new SqlParameter[9];

            sqlParams[0] = new SqlParameter("@PK_QuesID", this.QuesID);
            sqlParams[1] = new SqlParameter("@FK_TemplateID", this.TemplateID);
            sqlParams[2] = new SqlParameter("@Questions", this.Questions);            
            sqlParams[3] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[4] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[5] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[6] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[7] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[8] = new SqlParameter("@Completed_By", this.CompletedBy);

            return oDal.InsOrUpdtRatTemplQues(sqlParams);
        }

        public string InsOrUpdtEmpEvaluation()
        {
            SqlParameter[] sqlParams = new SqlParameter[18];

            sqlParams[0] = new SqlParameter("@PK_EvaluationID", this.EvaluationID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@FK_TemplateID", this.TemplateID);
            sqlParams[3] = new SqlParameter("@Eval_Doc_Path", this.EvalDocPath);
            sqlParams[4] = new SqlParameter("@Processed", this.Processed);
            sqlParams[5] = new SqlParameter("@Employer_Eval", this.EmployerEval);
            sqlParams[6] = new SqlParameter("@Employee_Eval", this.EmployeeEval);
            sqlParams[7] = new SqlParameter("@Only_Admin", this.OnlyAdmin);
            sqlParams[8] = new SqlParameter("@Eval_Grade", this.EvalGrade);
            sqlParams[9] = new SqlParameter("@Superv_Comments", this.SupervComm);  
            sqlParams[10] = new SqlParameter("@Emp_Signed_Date", this.EmpSignedDate);
            sqlParams[11] = new SqlParameter("@Supervisor_Signed_Date", this.SupervisorSignedDate);            
            sqlParams[12] = new SqlParameter("@ActiveFlag", this.ActiveStatus);
            sqlParams[13] = new SqlParameter("@Rec_CreatedBy", this.CreatedBy);
            sqlParams[14] = new SqlParameter("@Rec_CreatedDate", this.CreatedDate);
            sqlParams[15] = new SqlParameter("@Rec_ModifiedBy", this.ModifiedBy);
            sqlParams[16] = new SqlParameter("@Rec_ModifiedDate", this.ModifiedDate);
            sqlParams[17] = new SqlParameter("@Employee_Summary", this.EmployeeSumm);

            return oDal.InsOrUpdtEmpEvaluation(sqlParams);
        }

        public void GetRatingScale()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_RatingScaleID", this.RatingScaleID);
            this.oDsRatingScale = oDal.GetRatingScale(sqlParams);
        }

        public void GetRatingScaleTitle()
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@PK_RatingScaleTitleID", this.RatingScaleTitleID);
            sqlParams[1] = new SqlParameter("@FK_RatingScaleID", this.RatingScaleID);
            this.oDsRatingScaleTitle = oDal.GetRatingScaleTitle(sqlParams);
        }

        public void GetReviewPeriod()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_ReviewPeriodID", this.ReviewPeriodID);
            this.oDsReviewPeriod = oDal.GetReviewPeriod(sqlParams);
        }

        public void GetRatingTemplate()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@PK_TemplateID", this.TemplateID);
            this.oDsRatingTemplate = oDal.GetRatingTemplate(sqlParams);
        }

        public void GetRatTemplQues()
        {
            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@PK_QuesID", this.QuesID);
            sqlParams[1] = new SqlParameter("@FK_TemplateID", this.TemplateID);
            sqlParams[2] = new SqlParameter("@Completed_By", this.CompletedBy);
            this.oDsRatTempQues = oDal.GetRatTemplQues(sqlParams);
        }

        public void GetEmpEvaluation()
        {
            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@PK_EvaluationID", this.EvaluationID);
            sqlParams[1] = new SqlParameter("@FK_Org_EmpID", this.OrgEmpId);
            sqlParams[2] = new SqlParameter("@Only_Admin", this.OnlyAdmin);
            this.oDsEmpEvaluation = oDal.GetEmpEvaluation(sqlParams);
        }

        public void DelRatingScale()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_RatingScaleID", this.RatingScaleID);
                oDal.DelRatingScale(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatingScaleTitle()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_RatingScaleTitleID", this.RatingScaleTitleID);
                oDal.DelRatingScaleTitle(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelReviewPeriod()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_ReviewPeriodID", this.ReviewPeriodID);
                oDal.DelReviewPeriod(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatingTemplate()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_TemplateID", this.TemplateID);
                oDal.DelRatingTemplate(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatTemplQues()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_QuesID", this.QuesID);
                oDal.DelRatTemplQues(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelEmpEvaluation()
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            try
            {
                sqlParams[0] = new SqlParameter("@PK_EvaluationID", this.EvaluationID);
                oDal.DelEmpEvaluation(sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

       #endregion

        #region "Properties Definition"
        public string OrgName
        {
            get { return _orgName; }
            set { _orgName = value; }
        }
        public string Address1
        {
            get { return _address1; }
            set { _address1 = value; }
        }
        public string Address2
        {
            get { return _address2; }
            set { _address2 = value; }
        }
        public string City
        {
            get { return _city; }
            set { _city = value; }
        }
        public string State
        {
            get { return _state; }
            set { _state = value; }
        }
        public string PostalCode
        {
            get { return _postalCode; }
            set { _postalCode = value; }
        }
        public string AddressPers1
        {
            get { return _addressPers1; }
            set { _addressPers1 = value; }
        }
        public string AddressPers2
        {
            get { return _addressPers2; }
            set { _addressPers2 = value; }
        }
        public string CityPers
        {
            get { return _cityPers; }
            set { _cityPers = value; }
        }
        public string StatePers
        {
            get { return _statePers; }
            set { _statePers = value; }
        }
        public string PostalCodePers
        {
            get { return _postalCodePers; }
            set { _postalCodePers = value; }
        } 
        public string PhoneNumber
        {
            get { return _phoneNumber; }
            set { _phoneNumber = value; }
        }
        public string EmailID
        {
            get { return _emailID; }
            set { _emailID = value; }
        }
        public string FaxNumber
        {
            get { return _faxNumber; }
            set { _faxNumber = value; }
        }
        public string WebsiteUrl
        {
            get { return _websiteUrl; }
            set { _websiteUrl = value; }
        }

        public Guid? ClientTypeID
        {
            get { return _clientTypeID; }
            set { _clientTypeID = value; }
        }
        public Guid? OrgID
        {
            get { return _orgID; }
            set { _orgID = value; }
        }
        public string ClientType
        {
            get { return _clientType; }
            set { _clientType = value; }
        }
        public string CreatedBy
        {
            get { return _createdBy; }
            set { _createdBy = value; }
        }
        public DateTime CreatedDate
        {
            get { return _createdDate; }
            set { _createdDate = value; }
        }
        public string ModifiedBy
        {
            get { return _modifiedBy; }
            set { _modifiedBy = value; }
        }
        public DateTime ModifiedDate
        {
            get { return _modifiedDate; }
            set { _modifiedDate = value; }
        }
        public byte Status
        {
            get { return _status; }
            set { _status = value; }
        }
        public Guid? CustID
        {
            get { return _custID; }
            set { _custID = value; }
        }
        public string CustName
        {
            get { return _custName; }
            set {_custName=value; }
        }
        public string VendorName
        {
            get { return _vendorName; }
            set {_vendorName=value; }
        }
        public string ContactName
        {
            get { return _contactName; }
            set { _contactName=value; }
        }
        public string ContactEmailAddress
        {
            get { return _contactEmailAddress; }
            set {_contactEmailAddress=value; }
        }
        public string ContactPhoneNumber
        {
            get { return _contactPhoneNumber; }
            set {_contactPhoneNumber=value; }
        }
        public string AltContactName
        {
            get { return _altContactName; }
            set {_altContactName=value; }
        }
        public string AltContactEmailAddress
        {
            get {return _altContactEmailAddress; }
            set {_altContactEmailAddress=value; }
        }
        public string AltContactPhoneNumber
        {
            get {return _altContactPhoneNumber; }
            set {_altContactPhoneNumber=value; }
        }
        public Guid? OrgEmpId
        {
            get { return _org_empID; }
            set { _org_empID = value; }
        }
        public string OrgEmpCode
        {
            get { return _orgEmpCode; }
            set { _orgEmpCode = value; }
        }
        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }
        public string MiddleName
        {
            get { return _middleName; }
            set { _middleName = value; }
        }
        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }
        public string Prefix
        {
            get { return _prefix; }
            set { _prefix = value; }
        }
        public string CellPhone
        {
            get { return _cellPhone; }
            set { _cellPhone = value; }
        }
        public string HomePhone
        {
            get { return _homePhone; }
            set { _homePhone = value; }
        }
        public string BuisinessPhone
        {
            get { return _buisnsPhone; }
            set { _buisnsPhone = value; }
        }
        public string JobTitle
        {
            get { return _jobTitle; }
            set { _jobTitle = value; }
        }
        public string LoginPassword
        {
            get { return _loginPwd; }
            set { _loginPwd = value; }
        }
        public DateTime? HiredDate
        {
            get { return _hireDate; }
            set { _hireDate = value; }
        }
        public DateTime? TerminationDate
        {
            get { return _terminationDate; }
            set { _terminationDate = value; }
        }
        public string EmpCateg
        {
            get { return _empCateg; }
            set { _empCateg = value; }
        }
        public Decimal? EmpSal
        {
            get { return _empSal; }
            set { _empSal = value; }
        }
        public string DocNo
        {
            get { return _docNo; }
            set { _docNo = value; }
        }
        public DateTime? DocExpDate
        {
            get { return _docExpDate; }
            set { _docExpDate = value; }
        }
        public string LcaNo
        {
            get { return _lcaNo; }
            set { _lcaNo = value; }
        }
        public DateTime? LcaExpDate
        {
            get { return _lcaExpDate; }
            set { _lcaExpDate = value; }
        }
        public string PermCertNo
        {
            get { return _permCertNo; }
            set { _permCertNo = value; }
        }
        public string I140No
        {
            get { return _i140No; }
            set { _i140No = value; }
        }
        public string I485No
        {
            get { return _i485No; }
            set { _i485No = value; }
        }
        public int? OrgRoles
        {
            get { return _org_Roles; }
            set { _org_Roles = value; }
        }
        public Guid? OrgRoleID
        {
            get { return _orgRoleID; }
            set { _orgRoleID = value; }
        }
        public string OrgRoleName
        {
            get { return _orgRoleName; }
            set { _orgRoleName = value; }
        }
        public string OrgRoleDesc
        {
            get { return _orgRoleDesc; }
            set { _orgRoleDesc = value; }
        }
        public string ShipToAddr1
        {
            get { return _shipToAddr1; }
            set { _shipToAddr1 = value; }
        }
        public string ShipToAddr2
        {
            get { return _shipToAddr2; }
            set { _shipToAddr2 = value; }
        }
        public string ShipToCity
        {
            get { return _shipToCity; }
            set { _shipToCity = value; }
        }
        public string ShipToState
        {
            get { return _shipToState; }
            set { _shipToState = value; }
        }   
        public string ShipToPCode
        {
            get { return _shipToPCode; }
            set { _shipToPCode = value; }
        }
        public string BillToAddr1
        {
            get { return _billToAddr1; }
            set { _billToAddr1 = value; }
        }
        public string BillToAddr2
        {
            get { return _billToAddr2; }
            set { _billToAddr2 = value; }
        }
        public string BillToCity
        {
            get { return _billToCity; }
            set { _billToCity = value; }
        }
        public string BillToState
        {
            get { return _billToState; }
            set { _billToState = value; }
        }
        public string BillToPCode
        {
            get { return _billToPCode; }
            set { _billToPCode = value; }
        }
        public DataSet oDsCliTypDetails
        {
            get { return _oDsCliTypDetails; }
            set { _oDsCliTypDetails = value; }
        }
        public DataSet oDsOrgCustDetails
        {
            get { return _oDsOrgCustDetails; }
            set { _oDsOrgCustDetails = value; }
        }
        public DataSet oDsOrgVendors
        {
            get { return  _oDsOrgVendors; }
            set { _oDsOrgVendors = value; }
        }
        public DataSet oDsOrgRoles
        {
            get {return _oDsOrgRoles; }
            set { _oDsOrgRoles=value; }                
        }
        public DataSet oDsOrgEmpDetails
        {
            get { return _oDsOrgEmpDetails; }
            set { _oDsOrgEmpDetails = value; }
        }
        public Guid? RolePermissionID
        {
            get { return _rolePermissionID; }
            set { _rolePermissionID = value; }
        }
        public Guid? PageID
        {
            get { return _pageID; }
            set { _pageID = value; }
        }
        public string PermissionType
        {
            get { return _permissionType; }
            set { _permissionType = value; }
        }
        public DataSet oDsPageDetails
        {
            get { return _oDsPageDetails; }
            set { _oDsPageDetails = value; }
        }
        public DataSet oDsPagePermissions
        {
            get { return _oDsPagePermissions; }
            set { _oDsPagePermissions = value; }
        }
        public DataSet oDsEmpDetails
        {
            get { return _oDsEmpDetails; }
            set { _oDsEmpDetails = value; }
        }
        public char Add
        {
            get { return _add; }
            set { _add = value; }
        }
        public char View
        {
            get { return _view; }
            set { _view = value; }
        }
        public char Delete
        {
            get { return _delete; }
            set { _delete = value; }
        }
        public char Edit
        {
            get { return _edit; }
            set { _edit = value; }
        }
        public Guid? TimesheetID
        {
            get { return _timesheetID; }
            set { _timesheetID = value; }
        }
       
        public decimal Mon
        {
            get { return _mon; }
            set { _mon = value; }
        }
        public decimal Tue
        {
            get { return _tue; }
            set { _tue = value; }
        }
        public decimal Wed
        {
            get { return _wed; }
            set { _wed = value; }
        }
        public decimal Thu
        {
            get { return _thu; }
            set { _thu = value; }
        }
        public decimal Fri
        {
            get { return _fri; }
            set { _fri = value; }
        }
        public decimal Sat
        {
            get { return _sat; }
            set { _sat = value; }
        }
        public decimal Sun
        {
            get { return _sun; }
            set { _sun = value; }
        }
        public decimal Total
        {
            get { return _tot; }
            set { _tot = value; }
        }
        public string FileName
        {
            get { return _fileName; }
            set { _fileName = value; }
        }
        public string FilePath
        {
            get { return _filePath; }
            set { _filePath = value; }
        }
        public byte Approved
        {
            get { return _approved; }
            set { _approved = value; }
        }
        public DataSet oDsTSDetails
        {
            get { return _oDsTSDetails; }
            set { _oDsTSDetails = value; }
        }
        public Guid? OrgProjectID
        {
            get { return _orgProjectID; }
            set { _orgProjectID = value; }
        }
        public string ProjCode
        {
            get { return _projCode; }
            set { _projCode = value; }
        }
        public string ProjName
        {
            get { return _projName; }
            set { _projName = value; }
        }
        public string ProjDesc
        {
            get { return _projDesc; }
            set { _projDesc = value; }
        }
        public DateTime? StartDate
        {
            get { return _startDate; }
            set { _startDate = value; }
        }
        public DateTime? EndDate
        {
            get { return _endDate; }
            set { _endDate = value; }
        }
        public Guid? Client1
        {
            get { return _client1; }
            set { _client1 = value; }
        }
        public Guid? Client2
        {
            get { return _client2; }
            set { _client2 = value; }
        }
        public Guid? EndClient
        {
            get { return _endClient; }
            set { _endClient = value; }
        }
        public decimal? BillRate
        {
            get { return _billRate; }
            set { _billRate = value; }
        }
        public int? BillingCycle
        {
            get { return _billCycle; }
            set { _billCycle = value; }
        }
        public byte? OverTimeAllow
        {
            get { return _overTimeAllow; }
            set { _overTimeAllow = value; }
        }
        public decimal? OverTimeRate
        {
            get { return _overTimeRate; }
            set { _overTimeRate = value; }
        }
        public DataSet oDsProjDetails
        {
            get { return _oDsProjDetails; }
            set { _oDsProjDetails = value; }
        }
        public Guid? TimeOffTypeID
        {
            get { return _timeOffTypeID; }
            set { _timeOffTypeID = value; }
        }
        public string TimeOffDesc
        {
            get { return _timeOffDesc; }
            set { _timeOffDesc = value; }
        }
        public Guid? EmpTimeOffTypeID
        {
            get { return _empTimeOffTypeID; }
            set { _empTimeOffTypeID = value; }
        }
        public string AppStatus
        {
            get { return _appStatus; }
            set { _appStatus = value; }
        }
        public Guid? HolidaysID
        {
            get { return _holidaysID; }
            set { _holidaysID = value; }
        }
        public string HolName
        {
            get { return _holName; }
            set { _holName = value; }
        }
        public string HolDesc
        {
            get { return _holDesc; }
            set { _holDesc = value; }
        }
        public DataSet oDsTimeOffType
        {
            get { return _oDsTimeOffType; }
            set { _oDsTimeOffType = value; }
        }
        public DataSet oDsEmpTimeOff
        {
            get { return _oDsEmpTimeOff; }
            set { _oDsEmpTimeOff = value; }
        }
        public DataSet oDsHolidays
        {
            get { return _oDsHolidays; }
            set { _oDsHolidays = value; }
        }
        public DateTime HolDate
        {
            get { return _holDate; }
            set { _holDate = value; }
        }
        public Guid? TaskID
        {
            get { return _taskID; }
            set { _taskID = value; }
        }
        public int TskNumber
        {
            get { return _tskNumber; }
            set { _tskNumber = value; }
        }
        public DateTime TskDate
        {
            get { return _tskDate; }
            set { _tskDate = value; }
        }
        public string TskName
        {
            get { return _tskName; }
            set { _tskName = value; }
        }
        public string TskDesc
        {
            get { return _tskDesc; }
            set { _tskDesc = value; }
        }
        public DataSet oDsTasks
        {
            get { return _oDsTasks; }
            set { _oDsTasks = value; }
        }
        public int TsStatus
        {
            get { return _tsStatus; }
            set { _tsStatus = value; }
        }
        public string Comments
        {
            get { return _comments; }
            set { _comments = value; }
        }
        public DataSet oDsMissingTS
        {
            get { return _oDsMissingTS; }
            set { _oDsMissingTS = value; }
        }
        public Guid? InsCertID
        {
            get { return _insCertID; }
            set { _insCertID = value; }
        }
        public string CertPath
        {
            get { return _certPath; }
            set { _certPath = value; }
        }
        public Guid? InvoiceID
        {
            get { return _invoiceID; }
            set { _invoiceID = value; }
        }
        public decimal InvAmnt
        {
            get { return _invAmnt; }
            set { _invAmnt = value; }
        }
        public string ConsultName
        {
            get { return _consultName; }
            set { _consultName = value; }
        }
        public string InvPath
        {
            get { return _invPath; }
            set { _invPath = value; }
        }       
        public DataSet oDsVendInsCert
        {
            get { return _oDsVendInsCert; }
            set { _oDsVendInsCert = value; }
        }
        public DataSet oDsVendInvoice
        {
            get { return _oDsVendInvoice; }
            set { _oDsVendInvoice = value; }
        }
        public DataSet oDsDocuments
        {
            get { return _oDsDocuments; }
            set { _oDsDocuments = value; }
        }
        public Guid? DocID
        {
            get { return _docID; }
            set { _docID = value; }
        }
        public string DocTitle
        {
            get { return _docTitle; }
            set { _docTitle = value; }
        }
        public string DocPath
        {
            get { return _docPath; }
            set { _docPath = value; }
        } 
        public string DocType
        {
            get { return _docType; }
            set { _docType = value; }
        }

        public Guid? ID
        {
            get { return _ID; }
            set { _ID = value; }
        }
        public string FrmEmail
        {
            get { return _frmEmail; }
            set { _frmEmail = value; }
        }
        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        public string SmtpHost
        {
            get { return _smtpHost; }
            set { _smtpHost = value; }
        }
        public int SmtpPort
        {
            get { return _smtpPort; }
            set { _smtpPort = value; }
        }
        public string ToEmails
        {
            get { return _toEmails; }
            set { _toEmails = value; }
        }
        public DataSet oDsEmail
        {
            get { return _oDsEmail; }
            set { _oDsEmail = value; }
        }

        public byte? ActiveStatus
        {
            get { return _activeStatus; }
            set { _activeStatus = value; }
        }

        public Guid? RatingScaleID
        {
            get { return _ratingScaleID; }
            set { _ratingScaleID = value; }
        }
        public string RatingScale
        {
            get { return _ratingScale; }
            set { _ratingScale = value; }
        }

        public byte SingleSelection
        {
            get { return _singleSelection; }
            set { _singleSelection = value; }
        }

        public Guid? RatingScaleTitleID
        {
            get { return _ratingScaleTitleID; }
            set { _ratingScaleTitleID = value; }
        }
        public string RatingTitle
        {
            get { return _ratingTitle; }
            set { _ratingTitle = value; }
        }
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }
        public int RatingOrder
        {
            get { return _ratingOrder; }
            set { _ratingOrder = value; }
        }

        public Guid? ReviewPeriodID
        {
            get { return _reviewPeriodID; }
            set { _reviewPeriodID = value; }
        }
        public string PeriodName
        {
            get { return _periodName; }
            set { _periodName = value; }
        }

        public DataSet oDsRatingScale
        {
            get { return _oDsRatingScale; }
            set { _oDsRatingScale = value; }
        }

        public DataSet oDsRatingScaleTitle
        {
            get { return _oDsRatingScaleTitle; }
            set { _oDsRatingScaleTitle = value; }
        }

        public DataSet oDsReviewPeriod
        {
            get { return _oDsReviewPeriod; }
            set { _oDsReviewPeriod = value; }
        }

        public Guid? TemplateID
        {
            get { return _templateID; }
            set { _templateID = value; }
        }
        public string TemplateName
        {
            get { return _templateName; }
            set { _templateName = value; }
        }

        public string Instructions
        {
            get { return _instructions; }
            set { _instructions = value; }
        }

        public Guid? QuesID
        {
            get { return _quesID; }
            set { _quesID = value; }
        }
        public string Questions
        {
            get { return _questions; }
            set { _questions = value; }
        }

        public int? CompletedBy
        {
            get { return _completedBy; }
            set { _completedBy = value; }
        }

        public DataSet oDsRatingTemplate
        {
            get { return _oDsRatingTemplate; }
            set { _oDsRatingTemplate = value; }
        }

        public DataSet oDsRatTempQues
        {
            get { return _oDsRatTempQues; }
            set { _oDsRatTempQues = value; }
        }

        public Guid? EvaluationID
        {
            get { return _evaluationID; }
            set { _evaluationID = value; }
        }
        public string EvalDocPath
        {
            get { return _evalDocPath; }
            set { _evalDocPath = value; }
        }

        public int Processed
        {
            get { return _processed; }
            set { _processed = value; }
        }

        public string EmployerEval
        {
            get { return _employerEval; }
            set { _employerEval = value; }
        }

        public string EmployeeEval
        {
            get { return _employeeEval; }
            set { _employeeEval = value; }
        }

        public byte? OnlyAdmin
        {
            get { return _onlyAdmin; }
            set { _onlyAdmin = value; }
        }

        public string EvalGrade
        {
            get { return _evalGrade; }
            set { _evalGrade = value; }
        }

        public string SupervComm
        {
            get { return _supervComm; }
            set { _supervComm = value; }
        }        

        public DateTime EmpSignedDate
        {
            get { return _empSignedDate; }
            set { _empSignedDate = value; }
        }

        public DateTime SupervisorSignedDate
        {
            get { return _supervisorSignedDate; }
            set { _supervisorSignedDate = value; }
        }

        public string EmployeeSumm
        {
            get { return _employeeSumm; }
            set { _employeeSumm = value; }
        } 

        public DataSet oDsEmpEvaluation
        {
            get { return _oDsEmpEvaluation; }
            set { _oDsEmpEvaluation = value; }
        }

        public string _EmailTo = "", _Terms = "", _EmailCC = "";
        public string EmailTo
        {
            get { return _EmailTo; }
            set { _EmailTo = value; }
        }
        public string Terms
        {
            get { return _Terms; }
            set { _Terms = value; }
        }
        public string EmailCC
        {
            get { return _EmailCC; }
            set { _EmailCC = value; }
        }

        #endregion       
                

    
        public DataTable SearchProjects(string srchTxt)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@SearchFor", srchTxt);
            return oDal.SearchProjects(sqlParams);
        }

        public string Cust_Name { get; set; }
    }

}


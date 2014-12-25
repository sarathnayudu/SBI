#region "Namespaces"
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
#endregion

namespace DataAccess
{

    public class OrganizationDAL
    {
        #region "Connection String"
        private string sql_con = ConfigurationSettings.AppSettings["constr"].ToString();
        #endregion

        #region "Methods"
        public string InsOrUpdtOrganization(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrganization", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetOrgDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgDetails = null;
            try
            {
                oDsOrgDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgDetails", sqlParams);
                return oDsOrgDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
       

        public string InsOrUpdtOrgClientType(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrgClientType", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetCliTypDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsCliTypDetails = null;
            try
            {
                oDsCliTypDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgCliTypDetails", sqlParams);
                return oDsCliTypDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelCliTypDetails(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelCliTypDetails", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetStates()
        {
            DataSet oDsStates = null;
            try
            {
                oDsStates = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetState");
                return oDsStates;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtOrgCustomers(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrgCustomers", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;

            }

        }

        public DataSet GetOrgCustDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgCustDetails = null;
            try
            {
                oDsOrgCustDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgCustDetails", sqlParams);
                return oDsOrgCustDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
       

        public void DelOrgCustomers(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelOrgCustomers", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public string InsOrUpdtOrgVendors(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrgVendors", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetOrgVendors(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgVendors = null;
            try
            {
                oDsOrgVendors = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgVendors", sqlParams);
                return oDsOrgVendors;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }       

        public void DelOrgVendors(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelOrgVendors", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        
        public string InsOrUpdtOrgEmployees(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrgEmployees", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetOrgEmpDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgEmpDetails = null;
            try
            {
                oDsOrgEmpDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgEmpDetails", sqlParams);
                return oDsOrgEmpDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public DataSet GetActiveEmpDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgEmpDetails = null;
            try
            {
                oDsOrgEmpDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgActiveEmpDetails");
                return oDsOrgEmpDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet SearchOrgEmpDetails(SqlParameter[] sqlParams)
        {
            DataSet oDsOrgEmpDetails = null;
            try
            {
                oDsOrgEmpDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_SearchOrgEmpDetails", sqlParams);
                return oDsOrgEmpDetails;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelOrgEmpDetails(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelOrgEmployees", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtOrgRoles(SqlParameter[] sqlParams)
        {
            try 
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtOrgRoles", sqlParams);
                return strMsg;            
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetOrgRoles(SqlParameter[] sqlParams)
        {
            DataSet ODsOrgRoles = null;
            ODsOrgRoles = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetOrgRoles", sqlParams);
            return ODsOrgRoles;
        }

        public void DelOrgRoles(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelOrgRoles", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtRolePermissions(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtRolePermissions", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetRolePermissions(SqlParameter[] sqlParams)
        {
            DataSet ODsRolePermissions = null;
            ODsRolePermissions = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetRolePermissions", sqlParams);
            return ODsRolePermissions;
        }

        public DataSet GetPageDetails(SqlParameter[] sqlParams)
        {
            DataSet ODsPageDetails = null;
            ODsPageDetails = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetPageDetails", sqlParams);
            return ODsPageDetails;
        }

        public string CheckLogin(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_CheckLogin", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public string CheckVendorLogin(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_CheckVendorLogin", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetUserDetail(SqlParameter[] sqlParams)
        {
            try
            {
                DataSet ODsUserDetail = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetUserDetail", sqlParams);
                return ODsUserDetail;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtTimeSheet(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdttblTimeSheet", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string UpdateTimeSheet(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_UpdateTimeSheet", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetTimeSheetDetails(SqlParameter[] sqlParams)
        {
            try
            {
                DataSet ODsTimeSheet = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetTimeSheetDetails", sqlParams);
                return ODsTimeSheet;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public string InsOrUpdtTasks(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtTasks", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public DataSet GetTasks(SqlParameter[] sqlParams)
        {
            try
            {
                DataSet ODsTasks = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetTasks", sqlParams);
                return ODsTasks;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public void DelTasks(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelTasks", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }


        public string InsOrUpdtProjects(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtProjects", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetProjects(SqlParameter[] sqlParams)
        {
            DataSet ODsProjects = null;
            ODsProjects = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetProjects", sqlParams);
            return ODsProjects;
        }

        public void DelProjects(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelProjects", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtTimeOffType(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtTimeOffType", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetTimeOffType(SqlParameter[] sqlParams)
        {
            DataSet ODsTimeOffType = null;
            ODsTimeOffType = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetTimeOffType", sqlParams);
            return ODsTimeOffType;
        }

        public void DelTimeOffType(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelTimeOffType", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtEmployeeTimeOff(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtEmployeeTimeOff", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetEmployeeTimeOff(SqlParameter[] sqlParams)
        {
            DataSet ODsEmpTimeOff = null;
            ODsEmpTimeOff = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetEmployeeTimeOff", sqlParams);
            return ODsEmpTimeOff;
        }

        public void DelEmployeeTimeOff(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelEmployeeTimeOff", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtHolidays(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtHolidays", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetHolidays(SqlParameter[] sqlParams)
        {
            DataSet ODsHolidays = null;
            ODsHolidays = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetHolidays", sqlParams);
            return ODsHolidays;
        }

        public void DelHolidays(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelHolidays", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string ChangeForgotPassword(SqlParameter[] sqlParams)
        {
            try
            {
                string strChangePass = null;
                strChangePass = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_ChangeForgotPassword", sqlParams);
                return strChangePass;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void ApproveTimeOff(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_ApproveTimeOff", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet SearchTimeSheetDetails(SqlParameter[] sqlParams)
        {
            DataSet ODsTimesheet = null;
            ODsTimesheet = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_SearchTimeSheetDetails", sqlParams);
            return ODsTimesheet;
        }

        public DataSet MissingTimesheet(SqlParameter[] sqlParams)
        {
            DataSet ODsTimesheet = null;
            ODsTimesheet = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_MissingTimesheet", sqlParams);
            return ODsTimesheet;
        }

        public void ApproveTimesheets(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_ApproveTimesheets", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtVendInsCertificate(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtVendInsCertificate", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetVendInsCertificate(SqlParameter[] sqlParams)
        {
            DataSet ODsVendInsCertificate = null;
            ODsVendInsCertificate = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetVendInsCertificate", sqlParams);
            return ODsVendInsCertificate;
        }

        public string InsOrUpdtVendInvoice(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtVendInvoice", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetVendInvoice(SqlParameter[] sqlParams)
        {
            DataSet ODsVendInvoice = null;
            ODsVendInvoice = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetVendInvoice", sqlParams);
            return ODsVendInvoice;
        }

        public string InsOrUpdtDocuments(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtDocuments", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }


        public DataSet GetDocuments(SqlParameter[] sqlParams)
        {
            DataSet ODsDocuments = null;
            ODsDocuments = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetDocuments", sqlParams);
            return ODsDocuments;
        }

        public string InsOrUpdtEmpDocuments(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtEmpDocuments", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }


        public DataSet GetEmpDocuments(SqlParameter[] sqlParams)
        {
            DataSet ODsDocuments = null;
            ODsDocuments = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetEmpDocuments", sqlParams);
            return ODsDocuments;
        }

        public void DelDocuments(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelDocuments", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelEmpDocuments(SqlParameter[] sqlParams)
        {
            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelEmpDocuments", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtEmail(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtEmail", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetEmail(SqlParameter[] sqlParams)
        {
            DataSet oDsEmail = null;
            oDsEmail = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetEmail", sqlParams);
            return oDsEmail;
        }


        public string InsOrUpdtRatingScale(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtRatingScale", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtRatingScaleTitle(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtRatingScaleTitle", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtReviewPeriod(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtReviewPeriod", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtRatingTemplate(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtRatingTemplate", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtRatTemplQues(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtRatTemplQues", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public string InsOrUpdtEmpEvaluation(SqlParameter[] sqlParams)
        {
            try
            {
                string strMsg = (string)SqlHelper.ExecuteScalar(sql_con, CommandType.StoredProcedure, "sp_InsOrUpdtEmpEvaluation", sqlParams);
                return strMsg;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public DataSet GetRatingScale(SqlParameter[] sqlParams)
        {
            DataSet oDsRatingScale = null;
            oDsRatingScale = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetRatingScale", sqlParams);
            return oDsRatingScale;
        }

        public DataSet GetRatingScaleTitle(SqlParameter[] sqlParams)
        {
            DataSet oDsRatingScaleTitle = null;
            oDsRatingScaleTitle = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetRatingScaleTitle", sqlParams);
            return oDsRatingScaleTitle;
        }

        public DataSet GetReviewPeriod(SqlParameter[] sqlParams)
        {
            DataSet oDsReviewPeriod = null;
            oDsReviewPeriod = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetReviewPeriod", sqlParams);
            return oDsReviewPeriod;
        }

        public DataSet GetRatingTemplate(SqlParameter[] sqlParams)
        {
            DataSet oDsRatingTemplate = null;
            oDsRatingTemplate = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetRatingTemplate", sqlParams);
            return oDsRatingTemplate;
        }

        public DataSet GetRatTemplQues(SqlParameter[] sqlParams)
        {
            DataSet oDsRatTemplQues = null;
            oDsRatTemplQues = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetRatTemplQues", sqlParams);
            return oDsRatTemplQues;
        }

        public DataSet GetEmpEvaluation(SqlParameter[] sqlParams)
        {
            DataSet oDsEmpEvaluation = null;
            oDsEmpEvaluation = SqlHelper.ExecuteDataset(sql_con, CommandType.StoredProcedure, "sp_GetEmpEvaluation", sqlParams);
            return oDsEmpEvaluation;
        }

        public void DelRatingScale(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelRatingScale", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatingScaleTitle(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelRatingScaleTitle", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelReviewPeriod(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelReviewPeriod", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatingTemplate(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelRatingTemplate", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelRatTemplQues(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelRatTemplQues", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        public void DelEmpEvaluation(SqlParameter[] sqlParams)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(sql_con, CommandType.StoredProcedure, "sp_DelEmpEvaluation", sqlParams);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }

        #endregion
    }
}


    





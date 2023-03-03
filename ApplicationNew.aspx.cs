using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data;
using PEAApplication.BAL;
using System.Linq;
using System.IO;
using System.Web;
using PEAApplication.BAL.Model.Delete;
using PEAApplication.BAL.DAL.Set;
//using PEAApplication.BAL.DAL.Delete;

namespace PEAApplication
{
    public partial class ApplicationNew : System.Web.UI.Page
    {
        #region variables
        /// <summary>
        /// Call Data Variables
        /// </summary>
        DataVariable v = new DataVariable();
        #endregion

        #region Control's Event Changed
        /// <summary>
        /// Populate Form Controls Onclick
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(panEmp.GetType(), "clientScript, " <client type =\"text/javascript\">document.getElementById('').value= = "
            //  "</script>", true);
            if (Session["sUsername"] == null )
            {
                Response.Redirect("/Login.aspx", false);
            }

            v.sUsername = (string)Session["sUsername"];
            v.sFullName = (string)Session["sFullName"];
            v.sID1 = v.sUsername;//(string)Session["sId"];

            Logged_User.Text = v.sFullName;
            if (!IsPostBack)
            {
                PaneName.Value = Request.Form[PaneName.UniqueID];
                loadNewApplication();
            }
        }       
        //protected void SetAccordionPane(int idx)
        //{
        //    //var s = "<script type=\"text/javascript\">var paneIndex = "
        //    //  + idx + "</script>";
        //    ClientScript.RegisterStartupScript(panEmp.GetType(), "<script type=\"text/javascript\">var paneIndex = "
        //     + idx + "</script>", true);

        //}
        protected void ddlProvince_SelectedIndexChanged(Object sender, EventArgs e)
        {
            v.iProvinceId = Convert.ToDecimal(ddlProvince.SelectedValue);
            v.sProvince = ddlProvince.SelectedItem.Text;
            loadCity(v.iProvinceId);
        }
        protected void ddlCity_SelectedIndexChanged(Object sender, EventArgs e)
        {
            v.iCityId = Convert.ToDecimal(ddlCity.SelectedValue);
            v.sCity = ddlCity.SelectedItem.Text;
            loadSuburb(v.iCityId);
        }
        protected void ddlSuburb_SelectedIndexChanged(Object sender, EventArgs e)
        {
            v.iSuburbId = Convert.ToDecimal(ddlSuburb.SelectedValue);
            v.sSurbub = ddlSuburb.SelectedItem.Text;
            loadPostalCode(v.iSuburbId);
        }
        protected void ddlPostalCode_SelectedIndexChanged(Object sender, EventArgs e)
        {
            v.iPostalCodeId = Convert.ToDecimal(ddlPostalCode.SelectedValue);
        }
        protected void ddlBusinessType_SelectedIndexChanged(Object sender, EventArgs e)
        {
           // string selectedValue = string.Format("Selected Value:{0} and Selected Text:{1}",
          //ddlBusinessType.SelectedValue, ddlBusinessType.SelectedItem.Text);
         // ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('" + selectedValue + "')", true);
         v.iBusinessTypeId= Convert.ToDecimal(ddlBusinessType.SelectedValue);
        }
        protected void gvOperatingDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                v.sSurname = (gvOperatingDetails.FooterRow.FindControl("txt_SurnameFooter") as TextBox).Text.Trim();
                v.sFullName = (gvOperatingDetails.FooterRow.FindControl("txt_FullnameFooter") as TextBox).Text.Trim();
                v.sIDNo = (gvOperatingDetails.FooterRow.FindControl("txt_IdnumberFooter") as TextBox).Text.Trim();
                try
                {
                    setSessionOperatingDetails();
                    loadSessionOperatingDetails();
                    v.sResult = "New Row Added";
                }
                catch (Exception ex)
                {
                    v.sResult =ex.Message;
                }
            }
        }
        protected void gvOperatingDetails_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOperatingDetails.EditIndex = e.NewEditIndex;
            loadSessionOperatingDetails();
        }
        protected void gvOperatingDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOperatingDetails.EditIndex = -1;
            loadSessionOperatingDetails();
        }
        protected void gvOperatingDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            v.sSESSION_ID = (gvOperatingDetails.Rows[e.RowIndex].FindControl("lbl_SessionId") as Label).Text.Trim();
            v.sIDNo = (gvOperatingDetails.Rows[e.RowIndex].FindControl("lbl_IdNumber") as Label).Text.Trim();
            try
            {
                SessionDeleteOperatingDetailDAL deleteSession=new SessionDeleteOperatingDetailDAL();
                deleteSession.DeleteOperatingDetail(v.sSESSION_ID, v.sIDNo);
                loadSessionOperatingDetails();
                v.sResult = "Row Deleted";
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        protected void gvOperatingDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            v.sSESSION_ID = (gvOperatingDetails.Rows[e.RowIndex].FindControl("lbl_SessionId") as Label).Text.Trim();
            v.sSurname = (gvOperatingDetails.Rows[e.RowIndex].FindControl("txt_Surname") as TextBox).Text.Trim();
            v.sFullName = (gvOperatingDetails.Rows[e.RowIndex].FindControl("txt_Fullname") as TextBox).Text.Trim();
            v.sIDNo = (gvOperatingDetails.Rows[e.RowIndex].FindControl("txt_IdNumber") as TextBox).Text.Trim();
            try
                {
                    updateSessionOperatingDetails();
                    gvOperatingDetails.EditIndex = -1;
                    loadSessionOperatingDetails();
                    v.sResult = "Row updated";
                }
                catch (Exception ex)
                {
                    v.sResult =ex.Message;
                }           
        }
        protected void gvAttachment_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        protected void gvAttachment_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void gvAttachment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }
        protected void gvAttachment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            v.sSESSION_ID = (gvAttachment.Rows[e.RowIndex].FindControl("lbl_SessionId") as Label).Text.Trim();
            v.sType = (gvAttachment.Rows[e.RowIndex].FindControl("lbl_Type") as Label).Text.Trim();
            try
            {
                SessionDeleteAttachmentDAL deleteSession = new SessionDeleteAttachmentDAL();
                deleteSession.DeleteAttachment(v.sSESSION_ID, v.sType);
                switch (v.sType)
                {
                    case "SARS":
                        btnSARS.BackColor = System.Drawing.Color.Orange;
                        btnSARS.Enabled = true;
                        btnSARS.Text = "Upload SARS pdf";
                        FileUpload1.Visible = true;
                        break;
                    case "POA":
                        btnPOA.BackColor = System.Drawing.Color.Orange;
                        btnPOA.Enabled = true;
                        btnPOA.Text = "Upload POA pdf";
                        FileUpload2.Visible = true;
                        break;
                    case "ID":
                        btnID.BackColor = System.Drawing.Color.Orange;
                        btnID.Enabled = true;
                        btnID.Text = "Upload ID Copy pdf";
                        FileUpload3.Visible = true;
                        break;
                }
                loadSessionAttachment();
                v.sResult = "Row Deleted";
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        protected void gvAttachment_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }       
        protected void btnSARS_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {
                try
                {
                    string extension = Path.GetExtension(FileUpload1.FileName);
                    if (extension == ".pdf")
                    {
                        //if(FileUpload1.PostedFile.ContentLength <= 102400)
                        //{
                            uploadNewFile("SARS");
                        //}
                        //else
                        //{ v.sResult = "File hase to be less than 100 kb"; }
                    }
                    else
                    {
                        v.sResult = "only pdf accepted";
                    }
                }
                catch (Exception ex)
                {
                    v.sResult = "SARS pdf error: " + ex.Message; ;
                }
            }    
        }
        protected void btnPOA_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFiles)
            {
                try
                {
                    string extension = Path.GetExtension(FileUpload2.FileName);
                    if (extension == ".pdf")
                    {
                        //if(FileUpload1.PostedFile.ContentLength <= 102400)
                        //{
                        uploadNewFile("POA");
                        //}
                        //else
                        //{ v.sResult = "File hase to be less than 100 kb"; }

                    }
                    else
                    {
                        v.sResult = "only pdf accepted";
                    }
                }
                catch (Exception ex)
                {
                    v.sResult = "POA pdf error: " + ex.Message; ;
                }
            }
           
        }
        protected void btnID_Click(object sender, EventArgs e)
        {
            if (FileUpload3.HasFiles)
            {
                try
                {
                    string extension = Path.GetExtension(FileUpload3.FileName);
                    if (extension == ".pdf")
                    {
                        //if(FileUpload1.PostedFile.ContentLength <= 102400)
                        //{
                        uploadNewFile("ID");
                        //}
                        //else
                        //{ v.sResult = "File hase to be less than 100 kb"; }
                    }
                    else
                    {
                        v.sResult = "only pdf accepted";
                    }
                }
                catch (Exception ex)
                {
                    v.sResult = "POA pdf error: " + ex.Message; 
                }
            }
        }
        protected void Download_Attachment_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;

            SessionGetAttachmentDAL attachmentGetByID = new SessionGetAttachmentDAL();
            var oData = attachmentGetByID.LoadAll(v.sUsername,id).ToList();
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "utf - 8";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + oData.FirstOrDefault().ATTACHMENTNAME);
            Response.BinaryWrite(oData.FirstOrDefault().ATTACHMENT);
            Response.Flush();
            Response.End();
        }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            checkApplication();
            v.sResult = (string)Session["RefNo"];
            if (v.sResult != null && v.sResult.Length < 13)
            {
                Session["sApplcationResult"] = "Your application has been successfully submitted with reference number : " + v.iPEARefNo;
                Session["sApplcationAlert"] = "Green";
                Response.Redirect("/ApplicationStatus.aspx?id=2", false);
            }
            else if (v.sResult == null)
            {
                Session["sApplcationResult"] = "Business address: " + txtAddressLine1.Text.Trim() + " with registration number: " + v.sBusinessRegNo + " already exist!";
                Session["sApplcationAlert"] = "Red";
                Response.Redirect("/ApplicationStatus.aspx?id=2", false);
            }
            else
            {
                Session["sApplcationResult"] = "Application failed with system might be off-line";
                Session["sApplcationAlert"] = "Red";
                Response.Redirect("/ApplicationStatus.aspx?id=2", false);
            }
            
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                //clear controls
                clearControls();
                this.Dispose();
                foreach (Control item in Form.Controls)
                {
                    item.ValidateRequestMode.Equals(false);
                }
                Response.Redirect("/Application.aspx", false);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        #endregion

        #region Populate Form Controls
        /// <summary>
        /// Populate Form Controls
        /// Call DAL to Get Data
        /// </summary>  
        // Load Application
        private void loadNewApplication()
        {
            //call to load dropdownlists
            loadBusinessType();
            loadAgencyService();
            loadProvince();
            //call to load checkbox
            loadBusinessSector();
            
            //call load Operating Details DataGrid();
            loadSessionOperatingDetails();
            // loadAttachment();
            loadSessionAttachment();
            // call load Declaration
            loadDeclaration();
        }
        // Business Type Load dropdownlist
        public void loadBusinessType()
        {
            GetBusinessTypeDAL bizTypeGet = new GetBusinessTypeDAL();
            var oData = bizTypeGet.LoadAll();
            try
            {
                ddlBusinessType.DataSource = oData;
                ddlBusinessType.DataTextField = "businessname";
                ddlBusinessType.DataValueField = "pkibusinesstypeid";
                ddlBusinessType.DataBind();
                ddlBusinessType.Items.Insert(0, new ListItem("Please Select", "0"));
            }
            catch (Exception ex)
            {
                throw;
            }
        }       
        // Agency Service Load dropdownlist
        private void loadAgencyService()
        {
            GetAgencyServiceDAL agencyServiceGet = new GetAgencyServiceDAL();
            var oData = agencyServiceGet.LoadAll();
            try
            {
                ddlAgencyBusinessServices.DataSource = oData;
                ddlAgencyBusinessServices.DataTextField = "AGENCYSERVICENAME";
                ddlAgencyBusinessServices.DataValueField = "pkiagencyserviceid";
                ddlAgencyBusinessServices.DataBind();
                ddlAgencyBusinessServices.Items.Insert(0, new ListItem("Please Select", "0"));
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        // Province Load dropdownlist
        private void loadProvince()
        {
            GetProvinceDAL provinceGet = new GetProvinceDAL();
            var oData = provinceGet.LoadAll(v.stateid);
            try
            {
                ddlProvince.DataSource = oData;
                ddlProvince.DataTextField = "name";
                ddlProvince.DataValueField = "stateid";
                ddlProvince.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Choose City", "0"));
                ddlSuburb.Items.Insert(0, new ListItem("Choose Suburb", "0"));
                ddlPostalCode.Items.Insert(0, new ListItem("Choose Postal Code", "0"));
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message; 
            }
        }
        // City Load dropdownlist
        private void loadCity(decimal provinceSelected)
        {
            GetCityDAL cityGet = new GetCityDAL();
            var oData = cityGet.LoadAll(provinceSelected);
            try
            {
                if (oData.Count != 0)
                {
                    ddlCity.DataSource = oData;
                    ddlCity.DataTextField = "CITIES";
                    ddlCity.DataValueField = "CITYID";
                    ddlCity.DataBind();
                    ddlCity.Items.Insert(0, new ListItem("Please select", "0"));
                    ddlSuburb.Items.Insert(0, new ListItem("Choose Suburb", "0"));
                    ddlPostalCode.Items.Insert(0, new ListItem("Choose Postal Code", "0"));
                    // ddlCity.Items.Insert(0, new ListItem("Choose " + v.sProvince + " City", "0"));
                }
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        // Suburb Load dropdownlist
        private void loadSuburb(decimal citySelected)
        {
            GetSuburbDAL suburbGet = new GetSuburbDAL();
            var oData = suburbGet.LoadAll(citySelected);
            try
            {
                if (oData.Count != 0 )
                {
                    ddlSuburb.DataSource = oData;
                    ddlSuburb.DataTextField = "SUBURBS";
                    ddlSuburb.DataValueField = "SUBURBID";
                    ddlSuburb.DataBind();
                    if (oData.Count > 1)
                    {
                        ddlSuburb.Items.Insert(0, new ListItem("Please select", "0"));
                        //ddlSuburb.Items.Insert(0, new ListItem("Choose " + v.sCity + " Suburb", "0"));
                    }
                    else
                    {
                        loadPostalCode(Convert.ToInt32(oData.SingleOrDefault().SUBURBID));
                    }
                }
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        // PostalCode Load dropdownlist
        private void loadPostalCode(Decimal suburbSelected)
        {
            GetPostalCodeDAL postalCodeGet = new GetPostalCodeDAL();
            var oData = postalCodeGet.LoadAll(suburbSelected);
            try
            {
                if (oData.Count != 0)
                {
                    ddlPostalCode.DataSource = oData;
                    ddlPostalCode.DataTextField = "name";
                    ddlPostalCode.DataValueField = "POSTALCODEID";
                    ddlPostalCode.DataBind();
                }
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }       
        // Business Sector Load checkboxlist
        private void loadBusinessSector()
        {
            GetBusinessSectorDAL businessSectorGet = new GetBusinessSectorDAL();
            var oData = businessSectorGet.LoadAll();
            try
            {
                cblBusinessSector.DataSource = oData;
                cblBusinessSector.DataTextField = "sectorname";
                cblBusinessSector.DataValueField = "pkisectorid";
                cblBusinessSector.DataBind();
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        // Operating Details CRUD gridview 
        private void loadSessionOperatingDetails()
        {
            SessionGetOperatingDetailsDAL operatingDetailGet = new SessionGetOperatingDetailsDAL();
            var oData = operatingDetailGet.LoadAll(v.sUsername).ToList(); /*, v.sSurname,v.sFullName,v.sIDNo*/
            try
            {
                if (oData.Count != 0)
                {
                    gvOperatingDetails.DataSource = oData;
                    gvOperatingDetails.DataBind();
                }
                else
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("SESSION_ID");
                    dt.Columns.Add("SURNAME");
                    dt.Columns.Add("Fullname");
                    dt.Columns.Add("IDNumber");

                    for (int row = 0; row < gvOperatingDetails.Rows.Count; row++)
                    {
                        DataRow dr = dt.NewRow();
                        dr[0] = gvOperatingDetails.Rows[row].Cells[0].Text;
                        dr[1] = gvOperatingDetails.Rows[row].Cells[1].Text;
                        dr[2] = gvOperatingDetails.Rows[row].Cells[2].Text;
                        dr[3] = gvOperatingDetails.Rows[row].Cells[3].Text;
                        dt.Rows.Add(dr);
                    }
                    dt.Rows.Add(v.sUsername, "", "", "");
                    gvOperatingDetails.DataSource = dt;
                    gvOperatingDetails.DataBind();
                    gvOperatingDetails.Rows[0].Cells.Clear();
                    gvOperatingDetails.Rows[0].Cells.Add(new TableCell());
                    gvOperatingDetails.Rows[0].Cells[0].ColumnSpan = oData.Count;
                    gvOperatingDetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        // attachment Load gridview
        private void loadSessionAttachment()
        {
            SessionGetAttachmentsDAL attachmentGetByID = new SessionGetAttachmentsDAL();
            var oData = attachmentGetByID.LoadAll(v.sUsername).ToList();
            try
            {
                if (oData.Count != 0)
                {
                    gvAttachment.DataSource = oData;
                    gvAttachment.DataBind();
                }
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        //Declaration load controls
        private void loadDeclaration()
        {
            txtFullNames.Text = v.sFullName;
            txtIDNo.Text = v.sUsername;
        }
        #endregion

        #region Set Variables
        /// <summary>
        /// Set Variables
        /// Set test Application Variables
        /// Clear controls
        /// </summary>       
        private void setApplicationVariables()
        {
            //Application Type
            if (ddlBusinessType.SelectedItem.Selected != false || txtBusinessName.Text != "" || txtRegBisNum.Text != "" 
                || txtOperatAsName.Text != "" || txtNameOfHO.Text != "" ||
                ddlAgencyBusinessServices.SelectedItem.Selected != false || ddlAgencyHasEmployees.SelectedItem.Selected != false)
            {
                v.iBusinessTypeId = Convert.ToDecimal(ddlBusinessType.SelectedValue);
                v.sBusinessName = txtBusinessName.Text.Trim().ToString();
                v.sBusinessRegNo = txtRegBisNum.Text.Trim().ToString();
                v.sTradeName = txtOperatAsName.Text.Trim().ToString();
                v.sHOName = txtNameOfHO.Text.Trim().ToString();
                v.iAgencyServiceId = Convert.ToDecimal(ddlAgencyBusinessServices.SelectedValue);
                v.iAgencyHasEmpId = Convert.ToInt32(ddlAgencyHasEmployees.SelectedValue);
            }
            //Employment
            if (txtAddressLine1.Text != "" || txtAddressLine2.Text != "" || ddlProvince.SelectedItem.Selected != false 
                ||ddlCity.SelectedItem.Selected != false || ddlSuburb.SelectedItem.Selected != false ||
                ddlPostalCode.SelectedItem.Selected != false
                )
            {
                v.sPhyAddLine1 = txtAddressLine1.Text.Trim().ToString();
                v.sPhyAddLine2 = txtAddressLine2.Text.Trim().ToString();
                v.iProvinceId = Convert.ToDecimal(ddlProvince.SelectedValue);
                v.iCityId = Convert.ToDecimal(ddlCity.SelectedValue);
                v.iSuburbId = Convert.ToDecimal(ddlCity.SelectedValue);
                v.iPostalCodeId = Convert.ToDecimal(ddlPostalCode.SelectedValue);
            }
            //Employment-Contact Person
            if (txtSurname.Text != "" || txtFullName.Text != "" || txtEmail.Text != "" ||
                txtMobileNumber.Text != "" || txtOfficeTelephone.Text != "")
            {
                v.sSurname = txtSurname.Text.Trim().ToString();
                v.sFullNames = txtFullName.Text.Trim().ToString();
                v.sEmail = txtEmail.Text.Trim().ToString();
                v.sMobile = txtMobileNumber.Text.Trim().ToString();
                v.sTelephone = txtOfficeTelephone.Text.Trim().ToString();
            }
            //Business Operating Sector

            //Statutory Compliance
            if (txtCFNumber.Text != "" || txtUIFNumber.Text != "" || txtTaxNumber.Text != "" ||
                 txtTaxDate.Text != "")
            {
                v.sCFRefNo = txtCFNumber.Text.Trim();
                v.sUIFRefNo = txtUIFNumber.Text.Trim();
                v.dtTaxClearDate =DateTime.Parse(txtTaxDate.Text.Trim());
                v.sTaxNo = txtTaxNumber.Text.Trim();
            }
            else
            { }
            //Operating Details
            //-Ref gvOperatingDetails
            //Atachment ToDo
            //-Ref gvAttachment

            //Declaration ToDo
            {
                v.iDecId = rbOwner.SelectedIndex;
                v.sFullName = txtFullNames.Text.Trim();
                v.sIDNo = txtIDNo.Text.Trim();
            }
        }       
        private void uploadNewFile(string sType)
        {
            switch (sType)
            {
                case "SARS":
                    v.sFilename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    v.fs = FileUpload1.PostedFile.InputStream;
                    btnSARS.BackColor = System.Drawing.Color.Lime;
                    btnSARS.Enabled = false;
                    btnSARS.Text = "SARS pdf Uploaded";
                    FileUpload1.Visible = false;
                    break;
                case "POA":
                    v.sFilename = Path.GetFileName(FileUpload2.PostedFile.FileName);
                    v.fs = FileUpload2.PostedFile.InputStream;
                    btnPOA.BackColor = System.Drawing.Color.Lime;
                    btnPOA.Enabled = false;
                    btnPOA.Text = "POA pdf Uploaded";
                    FileUpload2.Visible = false;
                    break;
                case "ID":
                    v.sFilename = Path.GetFileName(FileUpload3.PostedFile.FileName);
                    v.fs = FileUpload3.PostedFile.InputStream;
                    btnID.BackColor = System.Drawing.Color.Lime;
                    btnID.Enabled = false;
                    btnID.Text = "ID pdf Uploaded";
                    FileUpload3.Visible = false;
                    break;
            }
            BinaryReader br = new BinaryReader(v.fs);
            v.pdfAttachment = br.ReadBytes((Int32)v.sFilename.Length);
            v.sType = sType;
          setSessionAttachment();
          loadSessionAttachment();
        }
        private void clearControls()
        {
            //Application Type:
            //ddlBusinessType.SelectedValue =;
            txtBusinessName.Text = ""; 
            txtRegBisNum.Text = "";
            txtOperatAsName.Text = "";
            txtNameOfHO.Text = "";
            //ddlAgencyBusinessServices.SelectedValue=;
            //ddlAgencyHasEmployees.SelectedValue=;

            //Employment:
            txtAddressLine1.Text = "";
            txtAddressLine2.Text = "";
            //ddlProvince.SelectedValue);
            //(ddlCity.Text).ToString();
            //ddlSuburb;
            //ddlPostalCode.SelectedValue;

            //Employment-Contact Person:
            txtSurname.Text = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtMobileNumber.Text = "";
            txtOfficeTelephone.Text = "";
            //Business Operating Sector:

            //Statutory Compliance:
            txtCFNumber.Text = "";
            txtUIFNumber.Text = "";
            txtTaxDate.Text.Equals("yyy/MM/dd").ToString();
            txtTaxNumber.Text.Equals("");
        }
        #endregion

        #region Call DAL to insert
        /// <summary>
        /// Insert Form Data into DB 
        /// Call DAL to insert
        /// Appliation
        /// Operating Details
        /// Attachments
        /// Feedback
        /// </summary>        
        //Application insert
        private void setNewApplication()
        {
            setApplicationVariables();        
            try
            {
                SetAplicationDAL applicationSet = new SetAplicationDAL();
                v.sResult = applicationSet.PEAAPPLICATIONSETS(
                            v.iBusinessTypeId, v.sBusinessName,
                            v.sBusinessRegNo, v.sTradeName, v.sHOName,
                            v.iAgencyHasEmpId, v.sEmpName, v.iAgencyServiceId,
                            v.sPhyAddLine1, v.sPhyAddLine2, v.iSuburbId,
                            v.iCityId, v.iProvinceId, v.iPostalCodeId,
                            v.sSurname, v.sFullName, v.sMobile,
                            v.sEmail, v.sTelephone, v.sEmail1,
                            v.sTelephone2, v.sWebsite, v.sEmail2,
                            v.sCFRefNo, v.sUIFRefNo,
                            v.sTaxNo, v.dtTaxClearDate, v.sUsername);

                v.iPEARefNo = v.sResult;

                SetOPERATINGDETAIL_ATTACHMENT opeDetailsSet = new SetOPERATINGDETAIL_ATTACHMENT();
                v.sResult = opeDetailsSet.InsertIntoOPERATINGDETAILATTACHMENT(v.iPEARefNo, v.sUsername);
                Session["RefNo"] = v.sResult;
                foreach (ListItem li in cblBusinessSector.Items)
                {
                    if (li.Selected)
                    {
                        SetSectorListDAL sectorSet = new SetSectorListDAL();
                        v.sResult = sectorSet.SetSectorList(v.iPEARefNo, Convert.ToDecimal(li.Value));
                    }
                }
                SetDeclarationDAL declarationSet = new SetDeclarationDAL();
                v.sResult = declarationSet.SetDeclaration(v.iPEARefNo, v.iDecId, v.sFullName,v.sIDNo, v.sUsername);

                SetStatusDAL statusSet = new SetStatusDAL();
                v.sResult = statusSet.SetStatus(v.iPEARefNo,1, v.sUsername);

               SetFeedbackDAL feedbackSet = new SetFeedbackDAL();
                v.sResult = feedbackSet.SetFeedback(Convert.ToDecimal(v.sResult), v.iPEARefNo , "System",
                    "Your application has been successfully submitted with reference number : " + v.iPEARefNo);

                ClearSession_OPE_ATT ope_att_Delete = new ClearSession_OPE_ATT();
                ope_att_Delete.clearSessionOPED_ATT(v.sUsername);
            }
            catch (Exception ex)
            {               
                v.sResult = ex.Message;
            }
        }
        //Operating Details insert
        private void setSessionOperatingDetails()
        {
            try
            {
                SessionSetOperatingDetailDAL opeDetailsSet = new SessionSetOperatingDetailDAL();
                v.sResult = opeDetailsSet.SessionSetOperatingDetails(v.sUsername, v.sSurname, v.sFullName, v.sIDNo, v._pdfAttachment);// sSessionID,  sSurname,  sFullName,  sId, byte[] sAttachment
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        private void setOperatingDetails()
        {

            for (int i = 0; i < gvOperatingDetails.Rows.Count - 1; i++)
            {
                v.sSurname = gvOperatingDetails.Rows[i].Cells[1].Text;
                v.sFullName = gvOperatingDetails.Rows[i].Cells[2].Text;
                v.sIDNo = gvOperatingDetails.Rows[i].Cells[3].Text;
                try
                {
                    SetOperatingDetailDAL opeDetailsSet = new SetOperatingDetailDAL();
                   // v.sResult = opeDetailsSet.SetOperatingDetails(v.iPEARefNo, v.sSurname, v.sFullName, v.sIDNo, v.sUsername);
                }
                catch (Exception ex)
                {
                    v.sResult = ex.Message;
                }
            }
        }
        //Attachment insert
        private void setSessionAttachment()
        {
            try
            {
                SessionSetAttachmentDAL attachmentSet = new SessionSetAttachmentDAL();
                v.sResult = attachmentSet.SessionSetAttachment(v.sUsername, v.sType, v.pdfAttachment, v.sFilename);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }      
        private void setAttachment()
        {           
            for (int i = 0; i < gvAttachment.Rows.Count - 1; i++)
            {
                v.sType = gvAttachment.Rows[i].Cells[1].Text;
                v.pdfAttachment = File.ReadAllBytes(gvAttachment.Rows[i].Cells[2].Text) ;
                try
                {
                    SetAttachmentDAL attachmentSet = new SetAttachmentDAL();
                    v.sResult = attachmentSet.SetAttachement(v.iPEARefNo, v.pdfAttachment, v.sType, v.sFilename, v.sUsername);
                }
                catch (Exception ex)
                {
                    v.sResult = ex.Message;
                }
            }
        }             
        //Feedback insert
        private void setFeedBack()
        {
            try
            {
                SetFeedbackDAL feedbackSet = new SetFeedbackDAL();
                v.sResult = feedbackSet.SetFeedback(1, v.iPEARefNo,v.sFeedback, v.sUsername);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        #endregion

        #region Call DAL to update
        /// <summary>
        /// update Form Data into DB 
        /// Call DAL to update
        /// Appliation
        /// Operating Details
        /// Attachments
        /// Feedback
        /// </summary>        
        //Application update
        private void updateNewApplication()
        {
            try
            {
                UpdateApplicationDAL applicationUpdate = new UpdateApplicationDAL();
                v.sResult = applicationUpdate.UpdateApplication(v.iPEARefNo,
                            v.iBusinessTypeId, v.sBusinessName,
                            v.sBusinessRegNo, v.sTradeName, v.sHOName,
                            v.iAgencyHasEmpId, v.sEmpName, v.iAgencyServiceId,
                            v.sPhyAddLine1, v.sPhyAddLine2, v.sSurbub,
                            v.sCity, v.iProvinceId, v.iPostalCodeId,
                            v.sSurname, v.sFullName, v.sMobile,
                            v.sEmail, v.sTelephone, v.sEmail1,
                            v.sTelephone2, v.sWebsite, v.sEmail2,
                            v.sSector_Code, v.sCFRefNo, v.sUIFRefNo,
                            v.sTaxNo, v.dtTaxClearDate, v.sUsername);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        //Operating Details update
        private void updateSessionOperatingDetails()
        {
            try
            {
              SessionUpdateOperatingDetailDAL opeDetailsUpdate = new SessionUpdateOperatingDetailDAL();
                v.sResult = opeDetailsUpdate.SessionUpdateOperatingDetail(v.sSESSION_ID,
                            v.sSurname, v.sFullName, v.sIDNo);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        //Attachment update
        private void updateAttachment()
        {
            try
            {
                UpdateAttachementDAL attachmentUpdate = new UpdateAttachementDAL();
                v.sResult = attachmentUpdate.UpdateAttachment(
                            v.iAttachmentId, v.iPEARefNo, v.sType, v.pdfAttachment, v.sFilename, v.sUsername);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        //Feedback update
        private void updateFeedBack()
        {
            try
            {
                UpdateFeedbackDAL feedbackUpdate = new UpdateFeedbackDAL();
                v.sResult = feedbackUpdate.UpdateFeedback(
                            v.iFeedbackId, v.iFKIVERIFICATIONID, v.iPEARefNo, v.sFeedback,
                            v.sUsername);
            }
            catch (Exception ex)
            {
                v.sResult = ex.Message;
            }
        }
        #endregion
                
        /// <summary>
        /// check Application 
        /// </summary>
        private void checkApplication()
        {
            GetApplicationByAddressDAL applicationByUser = new GetApplicationByAddressDAL();
            var oData = applicationByUser.LoadAll(txtAddressLine1.Text.Trim());
            if (oData.Count == 0)
            {
                //oData is empty 
                setNewApplication();
            }
            else
            {
                v.sBusinessRegNo = oData.FirstOrDefault().businessregno;
            }
        }
    }
}


using System;
using System.Collections.Generic;
using System.Data;
using PEAApplication.BAL;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PEAApplication.BAL.Model.Delete;
using PEAApplication.BAL.DAL.Set;

namespace PEAApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataVariable v = new DataVariable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                PaneName.Value = Request.Form[PaneName.UniqueID];
                loadNewApplication();
            }
        }
        private void loadNewApplication()
        {
            //call to load dropdownlists
            loadBusinessType();
            loadAgencyService();
            loadProvince();
            //call to load checkbox
            //loadBusinessSector();

            //call load Operating Details DataGrid();
            //loadSessionOperatingDetails();
            // loadAttachment();
            //loadSessionAttachment();
            // call load Declaration
            //loadDeclaration();
        }
        protected void ddlBusinessType_SelectedIndexChanged(Object sender, EventArgs e)
        {
            // string selectedValue = string.Format("Selected Value:{0} and Selected Text:{1}",
            //ddlBusinessType.SelectedValue, ddlBusinessType.SelectedItem.Text);
            // ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('" + selectedValue + "')", true);
            v.iBusinessTypeId = Convert.ToDecimal(ddlBusinessType.SelectedValue);
        }
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
                if (oData.Count != 0)
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
        //private void loadBusinessSector()
        //{
        //    GetBusinessSectorDAL businessSectorGet = new GetBusinessSectorDAL();
        //    var oData = businessSectorGet.LoadAll();
        //    try
        //    {
        //        cblBusinessSector.DataSource = oData;
        //        cblBusinessSector.DataTextField = "sectorname";
        //        cblBusinessSector.DataValueField = "pkisectorid";
        //        cblBusinessSector.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        v.sResult = ex.Message;
        //    }
        //}

    }
}
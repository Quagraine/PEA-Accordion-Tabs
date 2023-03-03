<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationNew.aspx.cs" Inherits="PEAApplication.ApplicationNew" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- Site Metas -->
    <title>PEA Application</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    
    <!-- Pogo Slider CSS -->
    <%--<link rel="stylesheet" href="css/pogo-slider.min.css" />--%>
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

    <!-- LOADER -->
    <form id="Form1" method="post" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
    <%--<div id="preloader">
        <div class="loader">
            <img src="images/loader.gif" alt="#" />
        </div>
    </div>--%>
    <!-- end loader -->
    <!-- END LOADER -->

    <!-- Start header -->
    <header class="top-header">
        <div class="header_top">
           <div class="col-sm-12">
            <div class="container">
                <div class="row">
                    <div class="logo_section">
                        <a class="navbar-brand" href="Login.aspx"><img src="images/banner.jpg" alt="image" /></a>
                      
                    </div>
                     <div class="site_information">
                        <ul>
                            <li>Department of Employment and labour</li>
                            <li><img src="images/design_header_02.gif" alt="image" height="100" width="60"/></li>
                        </ul>
                    </div>
                </div>
            </div>
         </div>
      </div>
    </header>
    <div class="section ">
       <div class="container" style="background:#49660e;width:100%">
           <div class="container-fluid">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col order-first">
                             <nav class="navbar header-nav navbar-expand-lg"> 
                                 <div class="menu_section">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                                        <span> </span>
                                    </button>
                                    <div class="collapse navbar-collapse justify-content-end" id="navbar-wd" >
                                        <ul class="navbar-nav form-row fs-3" >
                                            <li  class="px-1"><a  href="Application.aspx">Home</a></li>
                                            <li  class="px-3"><a  href="ApplicationNew.aspx">New Application</a></li>
                                        </ul>
                                    </div>
                                 </div>
                             </nav>
                        </div>
                        <div class="col"></div>
                        <div class="col order-last fs-3">
                              <div style="color:chartreuse;font:bold; align-content:space-around">
                                  <asp:Label ID="Logged_User" style="color:whitesmoke;font:bold; align-content:space-around" runat="server" Text="No Name"/>
                                  <a  href="Login.aspx" > Logout</a>
                              </div>
                        </div>
                    </div>
                </div>
          </div>
       </div>
    </div>
    <!-- End header -->
    
    <!-- section --Application -->
    <div class="section ">
        <div class="container-fluid">
                <div class="col-md-12">
                    <div class="">
                        <div class="heading_main ">
                         <h2 style="color:#49660e"><span class="theme_color">New    </span>Application</h2>    
                        </div>
                        <!-- Content-->
                        <asp:Panel ID="panApplication" Visible="true" runat="server">
                            <!-- Accordion -->
                            <div class="container" style="width: 80%; background-color:#d2e3af;color:dimgray; align-self:center"> 
                                <div class="lead fs" style="color:#d2e3af"> New Application</div>
                                <hr />
                                <div class="accordion" id="applicationAccordion" role="tablist" aria-multiselectable="true">
                                    <div>
                                        <%--<div asp-validation-summary="All" class="text-danger"></div>--%>
                                        <!-- APPLICATION TYPE -->
                                        <div class="accordion-item fs-5">
                                            <h2 class="accordion-header" id="headingOne" role="tab" >
                                                <%--<asp:HiddenField  ID="hidAccordionIndex" runat="server" value="0" ClientIDMode="Static"/> --%>
                                                <button  class="accordion-button collapsed fw-bold fs-4"  data-bs-toggle="collapse"  aria-expanded="false"
                                                    data-bs-target="#typeCollapse" aria-controls="typeCollapse" "
                                                    style="background-color:#83b51d; font:bold; color:whitesmoke; border-color:#49660e" type="button">
                                                    APPLICATION TYPE
                                                </button>
                                            </h2>
                                            <%--<asp:Panel ID="panAplType" Visible="true" runat="server">--%>
                                                <div id="typeCollapse" class="accordion-collapse collapse show" role="tabpanel" aria-labelledby="headingOne" data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-8">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please complete business type details:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-1.5  form-label" for="ddlBusinessType">Business Type:</label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm">
                                                                    <asp:DropDownList ID="ddlBusinessType"   Class="form-select" 
                                                                         style="font-size:small; font:5pt;background-color:#d2e3af !important"   runat="server"  
                                                                         OnSelectedIndexChanged="ddlBusinessType_SelectedIndexChanged" >                                                                   
                                                                         <asp:ListItem Text="Please select" Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>  
                                                                     <asp:RequiredFieldValidator ID="rfvBizType" runat="server" ControlToValidate="ddlBusinessType" ErrorMessage="Required" 
                                                                         ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>                                                        
                                                                <div class="form-row p-2">
                                                                    <label class="col-sm-2.5 form-label"  >Reg. Business Number:</label>
                                                                    <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                    <div class="col-sm">
                                                                        <asp:TextBox ID="txtRegBisNum" class="form-control" runat="server" />
                                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtRegBisNum" EnableClientScript="true"
			                                                    ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                              <%--  <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server"  ErrorMessage="Invalid Business Number" ControlToValidate="txtRegBisNum"
						                                        ValidationExpression="\d{10}" ValidationGroup="SearchId" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-2.5 form-label" for="txtBusinessName">Reg. Business Name:</label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm">
                                                                    <asp:TextBox ID="txtBusinessName" class="form-control" runat="server"  />
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtBusinessName" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label   class="col-sm-2.5 form-label">Operate as Name:</label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm">
                                                                    <asp:TextBox ID="txtOperatAsName" class="form-control" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtOperatAsName" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>                                 
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2.5 form-label">Name of HO (If Applicable): </label>
                                                                <div class="col-sm">
                                                                    <asp:TextBox ID="txtNameOfHO" class="form-control" runat="server"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2.5 form-label " for="ddlAgencyBusinessServices">Agency Business Services Offered: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm  ">
                                                                    <asp:DropDownList ID="ddlAgencyBusinessServices" class="form-select valid" style="font-size:small; font:5pt;background-color:#d2e3af !important;" runat="server" >                                                                   
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlAgencyBusinessServices" ErrorMessage="Required" 
                                                                         ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2.5 form-label row-cols-md-auto" for="ddlAgencyHasEmployees"> Agency has Employees: </label> 
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm">
                                                                    <asp:DropDownList ID="ddlAgencyHasEmployees" class="form-select valid" runat="server"  
                                                                        style="font-size:small; font:5pt;background-color:#d2e3af !important;">
                                                                        <asp:ListItem Text="Please select" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlAgencyHasEmployees" ErrorMessage="Required" 
                                                                         ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br /><br />
                                                    </div> 
                                                </div>
                                            </div>
                                           <%-- </asp:Panel>--%>
                                        </div>
                                        <!-- end section -->
                                        <!-- EMPLOYMENT -->
                                        <div class="accordion-item fs-5">
                                            <h2 class="accordion-header" role="tab" id="headingTwo">
                                                <%--<asp:HiddenField ID="hidAccordionIndex1" runat="server"  />--%>
                                                 <asp:HiddenField ID="PaneName" runat="server" />
                                                <button class="accordion-button collapsed   fw-bold fs-4" data-bs-toggle="collapse" aria-expanded="false"
                                                    data-bs-target="#employmentCollapse"  aria-controls="employmentCollapse"
                                                    style="background-color:#83b51d; color:whitesmoke" type="button" >
                                                    EMPLOYMENT
                                                </button>
                                            </h2>
                                            <!--<asp:Panel ID="panEmp" Visible="true" runat="server"> -->
                                                <div id="employmentCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-8">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please complete employment details:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2"> 
                                                                <label class="col-sm-2 col-form-label  fs-5 " style="background-color:silver; align-content:center" >Contact Address:</label>                                                            
                                                            </div>
                                                        </div>
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-2 col-form-label" for="txtAddressLine1">Address Line 1: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtAddressLine1" class="form-control" runat="server" ></asp:TextBox>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtAddressLine1" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2 col-form-label" for="txtAddressLine2">Address Line 2: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtAddressLine2" class="form-control" runat="server" ></asp:TextBox>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtAddressLine2" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <ContentTemplate>
                                                                    <div class="form-row p-2">
                                                                        <label class="col-sm-2 col-form-label align-content-end" for="ddlProvince">Province: </label>
                                                                        <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                        <div class="col-sm-6">
                                                                            <asp:DropDownList ID="ddlProvince"  class="form-select"   OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                                                                                    AutoPostBack="True"   style="font-size:small; font:5pt;background-color:#d2e3af !important"  runat="server"   > 
                                                                                <asp:ListItem Text="Please select"></asp:ListItem>                                                                  
                                                                            </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvProv" runat="server" ControlToValidate="ddlProvince" ErrorMessage="Required" 
                                                                                    ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row p-2">
                                                                        <label class="col-sm-2 col-form-label align-content-end" for="ddlCity">City: </label>
                                                                        <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                        <div class="col-sm-6">
                                                                            <asp:DropDownList ID="ddlCity" class="form-select"  runat="server"  OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" 
                                                                                AutoPostBack="True" style="font-size:small; font:5pt;background-color:#d2e3af !important;">                                                                   
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="ddlCity" ErrorMessage="Required" 
                                                                                    ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row p-2">
                                                                        <label class="col-sm-2 col-form-label align-content-end" for="ddlSuburb">Suburb: </label>
                                                                        <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                        <div class="col-sm-6">
                                                                            <asp:DropDownList ID="ddlSuburb" class="form-select"   runat="server"  OnSelectedIndexChanged="ddlSuburb_SelectedIndexChanged"
                                                                                AutoPostBack="True" style="font-size:small; font:5pt;background-color:#d2e3af !important;">                                                                   
                                                                            </asp:DropDownList> 
                                                                            <%-- <asp:RequiredFieldValidator ID="rfvSuburb" runat="server" ControlToValidate="ddlSuburb" ErrorMessage="Required" 
                                                                                    ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row p-2">
                                                                        <label class="col-sm-2 col-form-label " for="ddlPostalCode">Postal Code: </label>
                                                                        <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                        <div class="col-sm-6">
                                                                            <asp:DropDownList ID="ddlPostalCode" class="form-select valid"   runat="server"  OnSelectedIndexChanged="ddlPostalCode_SelectedIndexChanged"
                                                                                    style="font-size:small; font:5pt;background-color:#d2e3af !important;">                                                                   
                                                                            </asp:DropDownList>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvPC" runat="server" ControlToValidate="ddlPostalCode" ErrorMessage="Required" 
                                                                                    ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                        </div>
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2"> 
                                                                <label class="col-sm-2 col-form-label fs-5 " style="background-color:silver; align-content:center" >Contact Person:</label>                                                            
                                                            </div> 
                                                        </div>  
                                                        <div class="form-group-sm">                                                        
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-2 col-form-label" for="txtSurname">Surname: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtSurname" class="form-control" runat="server" ></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtSurname" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2 col-form-label">Full Names: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtFullName" class="form-control" runat="server" ></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtFullName" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-2 col-form-label">Email: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" ></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" 
                                                                     ValidationGroup="SubmitBTN" ForeColor="Red" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator id="revCEOEmail" runat="server" ForeColor="Red" ErrorMessage="Invalid address" ControlToValidate="txtEmail"
						                                             ValidationGroup="SubmitEmployer" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
						                                            </asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-2 col-form-label">Mobile Number: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                   <asp:TextBox ID="txtMobileNumber" class="form-control" runat="server" ></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegExpresV4" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Enter valid mobile number!" 
                                                                       ForeColor="Red" ValidationExpression="^([0]{1})([0-9]{9})$" Display="Dynamic"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="reqContact" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Required" ValidationGroup="SubmitBTN"
                                                                       ForeColor="Red" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-2 col-form-label">Office Telephone: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="txtOfficeTelephone" class="form-control" runat="server" ></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtOfficeTelephone" ErrorMessage="Enter valid telephone number!" 
                                                                       ForeColor="Red" ValidationExpression="^([0]{1})([0-9]{9})$" Display="Dynamic"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOfficeTelephone" ErrorMessage="Required" ValidationGroup="SubmitBTN"
                                                                       ForeColor="Red" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div> 
                                                        </div>                                                          
                                                    </div>
                                                </div>
                                            </div>
                                            <!--</asp:Panel>-->
                                        </div>
                                        <!-- end section -->
                                        <!-- BUSSINESS SECTOR OPERATING -->
                                        <div class="accordion-item fs-4">
                                            <h2 class="accordion-header" role="tab" id="headingThree">
                                                <asp:HiddenField ID="hidAccordionIndex2" runat="server" value="2" />
                                                <button class="accordion-button collapsed fw-bold fs-4" data-bs-toggle="collapse" aria-expanded="false"
                                                    data-bs-target="#businessSectorCollapse" aria-controls="businessSectorCollapse" value="2"
                                                    style="background-color:#83b51d; color:whitesmoke" type="button">
                                                    BUSSINESS SECTOR OPERATING
                                                </button>
                                            </h2>
                                            <%--<asp:Panel ID="panBizSector" Visible="true" runat="server">--%>
                                                <div id="businessSectorCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingThree" data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-8">
                                                        <div class="form-group row">
                                                            <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                <label >Please choose business sector:</label> <label style="color:red">*</label> 
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group row">
                                                            <div class="col-sm">
                                                                <asp:CheckBoxList ID="cblBusinessSector"  runat="server" Font-Size="8pt" Enabled="true" >                                                                   
                                                                </asp:CheckBoxList> 
                                                                <%--<asp:RequiredFieldValidator ID="rfvBS" runat="server" ControlToValidate="cblBusinessSector" ErrorMessage="Required" 
                                                                         ValidationGroup="SubmitBTN"  EnableClientScript="true" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </asp:Panel>
                                        </div>
                                        <!-- end section -->
                                        <!-- STATUTORY COMPLIANCE -->
                                        <div class="accordion-item fs-5">
                                            <h2 class="accordion-header" role="tab" id="headingfour">
                                                <button class="accordion-button collapsed  fw-bold fs-4" data-bs-toggle="collapse"aria-expanded="false"
                                                     data-bs-target="#statutoryComplianceCollapse" aria-controls="statutoryComplianceCollapse"  value="3"
                                                    style="background-color:#83b51d; color:whitesmoke" type="button">
                                                    STATUTORY COMPLIANCE
                                                </button>
                                            </h2>
                                            <asp:Panel ID="panCompliance" Visible="true" runat="server">
                                                <div id="statutoryComplianceCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingfour"  data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-8">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please complete business statutory compliance details:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-3 col-form-label">CF Number: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-5">
                                                                    <asp:Textbox ID="txtCFNumber" runat="server"  class="form-control" />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtUIFNumber" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-3 col-form-label">UIF Number: </label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-5">
                                                                    <asp:Textbox ID="txtUIFNumber" runat="server"  class="form-control" />
                                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtUIFNumber" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator> 
                                                                </div>
                                                            </div>
                                                            <div class="form-row p-2">
                                                                <label  class="col-sm-3 col-form-label">Income Tax Number:</label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-5">
                                                                    <asp:Textbox ID="txtTaxNumber" TextMode="SingleLine" runat="server"  class="form-control"/>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtTaxNumber" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>                                 
                                                            <div class="form-row p-2">
                                                                <label class="col-sm-3 col-form-label">SARS Tax Clearance Expiry Date:</label>
                                                                <div><asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label></div>
                                                                <div class="col-sm-5">
                                                                   <asp:Textbox ID="txtTaxDate" TextMode="Date" Text="" runat="server" />
                                                                   <asp:RequiredFieldValidator ID="rfvDate" ControlToValidate="txtTaxDate" EnableClientScript="true"
			                                                            ErrorMessage="Required"  ValidationGroup="SubmitBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </asp:Panel>
                                        </div>
                                        <!-- end section -->
                                        <!-- OPERATING DETAILS -->
                                        <div class="accordion-item fs-5">
                                            <h2 class="accordion-header"  role="tab" id="headingfive">
                                                <button class="accordion-button collapsed  fw-bold fs-4"  data-bs-toggle="collapse" aria-expanded="false"
                                                    data-bs-target="#operatingDetailsCollapse" aria-controls="operatingDetailsCollapse"  value="4"
                                                    style="background-color:#83b51d; color:whitesmoke" type="button" >
                                                    OPERATING DETAILS
                                                </button>
                                            </h2>
                                            <asp:Panel ID="panOPEDetails" Visible="true" runat="server">
                                                <div id="operatingDetailsCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingfive" data-bs-parent="#applicationAccordion">
                                                 <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-8">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please complete business operating details:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="">
                                                                <div><asp:GridView ID="gvOperatingDetails" runat="server" AutoGenerateColumns="False" CellPadding="4" ShowFooter="True" 
                                                                ShowHeaderWhenEmpty="true" DataKeyNames="SESSION_ID" BackColor="White" CssClass="Style"
                                                                    OnRowCommand="gvOperatingDetails_RowCommand" 
                                                                    OnRowEditing="gvOperatingDetails_OnRowEditing" 
                                                                    OnRowCancelingEdit="gvOperatingDetails_RowCancelingEdit"
                                                                    OnRowDeleting="gvOperatingDetails_RowDeleting"
                                                                    OnRowUpdating="gvOperatingDetails_RowUpdating"
                                                                BorderColor="#83b51d" BorderStyle="Outset" BorderWidth="3px" ForeColor="Black" GridLines="Horizontal" >
                                                                <FooterStyle BackColor="#d2e3af" ForeColor="Black" BorderColor="Black" BorderStyle="Solid" /> 
                                                                <HeaderStyle BackColor="#83b51d" Font-Bold="True" ForeColor="Whitesmoke" />
                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                                <SortedDescendingHeaderStyle BackColor="#242121" />
        	                                                    <Columns>  
	                                                                <asp:TemplateField HeaderText="SESSION ID" Visible="false">  
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_SessionId"  runat="server" Text='<%#Eval("SESSION_ID")%>' Visible="false"></asp:Label>
		                                                                </ItemTemplate>
	                                                                </asp:TemplateField> 
	                                                                  <asp:TemplateField HeaderText="Surname"> 
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_Surname"  runat="server" Text='<%#Eval("SURNAME")%>'></asp:Label>  
		                                                                </ItemTemplate>
                                                                        <EditItemTemplate>  
			                                                                <asp:TextBox ID="txt_Surname" style="border-color:orange; border-style:inset"  runat="server" Text='<%#Eval("SURNAME")%>'></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvSurname" ControlToValidate="txt_Surname" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="EditBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </EditItemTemplate>
                                                                        <FooterTemplate>  
                                                                            <asp:TextBox ID="txt_SurnameFooter"  style=" border-style:inset"  runat="server" />
                                                                             <asp:RequiredFieldValidator ID="rfvSurnameF" ControlToValidate="txt_SurnameFooter" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="AddBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </FooterTemplate> 
	                                                                </asp:TemplateField> 
	                                                                <asp:TemplateField HeaderText="Fullname"> 
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_Fullname"  runat="server" Text='<%#Eval("FULLNAME")%>'></asp:Label>
		                                                                </ItemTemplate>
                                                                        <EditItemTemplate>  
			                                                                <asp:TextBox ID="txt_Fullname" style="border-color:orange; border-style:inset" runat="server" Text='<%#Eval("FULLNAME")%>'></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvFullname" ControlToValidate="txt_Fullname" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="EditBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </EditItemTemplate>
                                                                        <FooterTemplate>  
                                                                            <asp:TextBox ID="txt_FullnameFooter" style=" border-style:inset" runat="server" />
                                                                            <asp:RequiredFieldValidator ID="rfvFullnameF" ControlToValidate="txt_FullnameFooter" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="AddBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </FooterTemplate> 
	                                                                </asp:TemplateField> 
	                                                                <asp:TemplateField HeaderText="ID Number"> 
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_IdNumber" runat="server" Text='<%#Eval("IDNUMBER")%>'></asp:Label>                                                                              
		                                                                </ItemTemplate>
                                                                        <EditItemTemplate>  
			                                                                <asp:TextBox ID="txt_IdNumber"  runat="server" Text='<%#Eval("IDNUMBER")%>'></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvID" ControlToValidate="txt_IdNumber" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="EditBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txt_IdNumberFooter" style=" border-style:inset"  runat="server" />
                                                                            <asp:RequiredFieldValidator ID="rfvIDF" ControlToValidate="txt_IdNumberFooter" EnableClientScript="true"
			                                                                 ErrorMessage="Required"  ValidationGroup="AddBTN" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
		                                                                </FooterTemplate>  
	                                                                </asp:TemplateField>
                                                                    <asp:TemplateField>  
		                                                                <ItemTemplate>  
			                                                                <asp:ImageButton ImageUrl="~/images/icon-edit.gif" runat="server" Text="Edit" CommandName="Edit"  ToolTip="Edit" Width="20px" Height="20px"/> 
                                                                            <asp:ImageButton ImageUrl="~/images/icon-delete.gif" runat="server" Text="Delete" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>   
		                                                                </ItemTemplate>  
		                                                                <EditItemTemplate>  
			                                                                  <asp:ImageButton ImageUrl="~/images/icon-save.gif" runat="server" Text="Update" CommandName="Update" ValidationGroup="EditBTN" ToolTip="Update" Width="20px" Height="20px"/> 
                                                                            <asp:ImageButton ImageUrl="~/images/CANCEL.bmp" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>    
		                                                                </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:ImageButton ImageUrl="~/images/plus.png" runat="server" Text="AddNew" CommandName="AddNew" ValidationGroup="AddBTN" ToolTip="AddNew" Width="30px" Height="30px" ValidateRequestMode="Disabled" />      
                            
		                                                                </FooterTemplate>   
	                                                                </asp:TemplateField>  
	                                                            </Columns> 
                                                            </asp:GridView> 
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </asp:Panel>
                                        </div>
                                        <!-- end section -->
                                        <!-- ATTACHMENTS -->
                                        <div class="accordion-item fs-4">
                                            <h2 class="accordion-header" role="tab" id="headingsix">
                                                <button class="accordion-button collapsed  fw-bold fs-4" data-bs-toggle="collapse" aria-expanded="false"
                                                    data-bs-target="#attachementCollapse"  aria-controls="attachementCollapse" value="5"
                                                    style="background-color:#83b51d; color:whitesmoke" type="button" >
                                                    ATTACHMENTS
                                                </button>
                                            </h2>
                                            <asp:Panel ID="panAttachment" Visible="true" runat="server">
                                                <div id="attachementCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingsix" data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-10">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please attach the 3 required business documents in PDF formart:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2">
                                                                <div class="container px-4 ">
                                                                    <div class="col-sm-3">
                                                                        <div class="p-2 border" style="background-color:#d2e3af" >
                                                                            <div class="input-group ">
                                                                              <asp:Button ID="btnSARS" class="input-group-text bg-warning " style="font-size:small; font:5pt; width:206px" runat="server" Text="Upload SARS Certificate" OnClick="btnSARS_Click"/>
                                                                              <asp:FileUpload ID="FileUpload1" class="form-control" accept=".pdf"  runat="server"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <div class="p-2 border" style="background-color:#d2e3af"> 
                                                                             <div class="input-group">
                                                                              <asp:Button ID="btnPOA" class="input-group-text bg-warning " style="font-size:small; font:5pt; width:206px" runat="server" Text="Upload POA Doc" OnClick="btnPOA_Click"/>
                                                                              <asp:FileUpload ID="FileUpload2" class="form-control" accept=".pdf" runat="server"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <div class="p-2 border" style="background-color:#d2e3af">
                                                                            <div class="input-group">
                                                                               <asp:Button ID="btnID" class="input-group-text bg-warning " style="font-size:small; font:5pt; width:206px" runat="server" Text="Upload ID Doc" OnClick="btnID_Click"/>
                                                                               <asp:FileUpload ID="FileUpload3" class="form-control" accept=".pdf" runat="server" />
                                                                            </div>
                                                                         </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                <%--<label class="input-group-text col-sm-3" style="background-color:orange; color:#d2e3af" for="inputGroupFile01,inputGroupFile02,inputGroupFile03">Upload</label>--%>
                                                                </div>
                                                            </div>
                                                        </div>                                                    
                                                         <hr />
                                                        <div class="form-group-sm">
                                                            <div class="">
                                                                <div><asp:GridView ID="gvAttachment" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                                                                ShowHeaderWhenEmpty="true" DataKeyNames="SESSION_ID" BackColor="White" CssClass="Style"
                                                                    OnRowCommand="gvAttachment_RowCommand" 
                                                                    OnRowEditing="gvAttachment_RowEditing" 
                                                                    OnRowCancelingEdit="gvAttachment_RowCancelingEdit"
                                                                    OnRowDeleting="gvAttachment_RowDeleting"
                                                                    OnRowUpdating="gvAttachment_RowUpdating"
                                                                BorderColor="Orange" BorderStyle="Outset" BorderWidth="3px" ForeColor="Black" GridLines="Horizontal" >
                                                                <HeaderStyle BackColor="#d2e3af" Font-Bold="True" ForeColor="Black" />
                                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                                <SortedDescendingHeaderStyle BackColor="#242121" />
        	                                                    <Columns>  
	                                                                <asp:TemplateField HeaderText="SESSION ID" Visible="false">  
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_SessionId"  runat="server" Text='<%#Eval("SESSION_ID")%>' Visible="false"></asp:Label>
		                                                                </ItemTemplate>
	                                                                </asp:TemplateField> 
	                                                                <asp:TemplateField HeaderText="Attachment Type">  
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_Type"  runat="server" Text='<%#Eval("AttachmentType")%>'></asp:Label>  
		                                                                </ItemTemplate>
	                                                                </asp:TemplateField> 
                                                                     <asp:TemplateField HeaderText="File Name">  
		                                                                <ItemTemplate>  
			                                                                <asp:Label ID="lbl_FileName"  runat="server" Text='<%#Eval("AttachmentName")%>'></asp:Label>  
		                                                                </ItemTemplate>
	                                                                </asp:TemplateField> 
	                                                                <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Attachment">  
		                                                                <ItemTemplate>  
			                                                                <asp:LinkButton ID="Download_Attachment" runat="server" Text="Download" OnClick="Download_Attachment_Click" CommandArgument='<%#Eval("AttachmentType")%>'></asp:LinkButton>
		                                                                </ItemTemplate>
	                                                                </asp:TemplateField> 
                                                                    <asp:TemplateField>  
		                                                                <ItemTemplate>  
			                                                                 <asp:ImageButton ImageUrl="~/images/icon-delete.gif" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>   
		                                                                </ItemTemplate>  
		                                                                <EditItemTemplate> 
                                                                            <asp:ImageButton ImageUrl="~/images/icon-save.gif" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/> 
                                                                            <asp:ImageButton ImageUrl="~/images/stop.png" runat="server"  CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>    
		                                                                </EditItemTemplate>
	                                                                </asp:TemplateField>  
	                                                            </Columns> 
                                                            </asp:GridView> 
                                                            <%--<asp:Label ID="lblSuccessMsg"  Text="" runat="server" ForeColor="#83b51d" />
                                                            <asp:TextBox ID="lblErrMsg" Text="" runat="server" ForeColor="Red" />   --%> 
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </asp:Panel>
                                        </div>
                                        <!-- end section -->
                                        <!-- DECLARATION BY APPLICANT -->
                                        <div class="accordion-item fs-5">
                                            <h2 class="accordion-header"  role="tab" id="headingseven">
                                                <button class="accordion-button collapsed  fw-bold fs-4"  data-bs-toggle="collapse" aria-expanded="false"
                                                    data-bs-target="#declaraionCollapse" aria-controls="declaraionCollapse" value="6" 
                                                    style="background-color:#83b51d; color:whitesmoke" type="button" >
                                                    DECLARATION BY APPLICANT
                                                </button>
                                            </h2>
                                            <asp:Panel ID="panDeclare" Visible="true" runat="server">
                                                <div id="declaraionCollapse" class="accordion-collapse collapse" role="tabpanel" aria-labelledby="headingseven" data-bs-parent="#applicationAccordion">
                                                <div class="accordion-body">
                                                    <div class="container-fluid list-group-item col-11">
                                                        <div class="form-group-sm">
                                                            <div class="form-group row">
                                                                <div class="col-sm col-form-label fs-4" style="color:#49660e ; background-color:#d2e3af"> 
                                                                    <label >Please complete declaration:</label> <label style="color:red">*</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class="form-check">
                                                            <fieldset class="row mb-3">
                                                                <legend class="col-form-label col-sm-2 pt-3 fs-4">I am declaring as:</legend>
                                                                <div class="col-sm-10 ">
                                                                  <div class="form-check p-3">
                                                                       <div class="col-sm-6  ">
                                                                            <asp:RadioButtonList ID="rbOwner" runat="server" class="form-check-input" RepeatDirection="Horizontal" style="width:210px" DataTextField="Mandated" DataValueField="Mandated">
                                                                                <asp:ListItem Selected="True"> Owner</asp:ListItem>
                                                                                <asp:ListItem> Mandated by Trustee</asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                            </fieldset>
                                                            <div class="input-group">
                                                                <div class="input-group-append">
                                                                    <span class="input-group-text fs-4" id="basic-addon1">I</span>
                                                                    <asp:Textbox id="txtFullNames" Enabled="false" style="width:300px" runat="server" aria-describedby="basic-addon1"/>
                                                               
                                                                    <span class="input-group-text fs-4" id="basic-addon2">with identity number</span>
                                                                    <asp:Textbox id="txtIDNo" Enabled="false"  runat="server" aria-describedby="basic-addon2"/>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-10 fs-5" id="" style="background-color:#d2e3af"> In my capacity as mandated by the owner/CEO to apply on behalf of the owner/CEO (proof to be given to labour inspector)</label>
                                                                </div> 
                                                            </div>
                                                        <hr />
                                                        <div class="form-group-sm">
                                                            <div class="form-row p-2">
                                                                <div class="container px-2 ">
                                                                    <div class="col-lg-2">
                                                                        <div class="p-0 border ">
                                                                            <div class="input-group ">
                                                                                <asp:Button ID="btnApply" Text="Submit" Width="140px" class="form btn btn-warning m-2"  runat="server" ValidationGroup="SubmitBTN" onclick="btnApply_Click" UseSubmitBehavior="False" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                         
                                                                    <div class="col-lg-2">
                                                                        <div class="p-0 border ">
                                                                             <div class="input-group-sm-3">                                                                            
                                                                                <asp:Button ID="btnCancel" Text="Cancel" Width="140px" class="form- btn btn-danger m-2"  runat="server" onclick="btnCancel_Click" ValidateRequestMode="Disabled" UseSubmitBehavior="False" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </asp:Panel>
                                        </div>
                                        <!-- end section -->
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion -->
                        </asp:Panel>
                        <!-- End Content-->
                        <br />
                    </div>
                </div>
        </div>
    </div>
    <div class="footer_bottom" style="width:99%; height:12%; background:none">
    </div>
        <div class="footer_bottom" style="width:99%; text-align:center; background:#d2e3af">
            <div class="row">
                <div class="col-12">
                    <p class="crp">© Copyrights 2022 developed by Department of Employment and labour. </p>
                </div>
            </div>
    </div>
</form>
    <%--<a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>--%>
    <!-- ALL JS FILES -->
    <script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- ALL PLUGINS -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.pogo-slider.min.js"></script>
    <script src="js/slider-index.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="scripts/jquery.validate.min.js"></script>
    <script src="scripts/jquery.validate.unobtrusive.min.js"></script>
    <script src="scripts/bootstrap-validaton.min.js"></script>
   <%-- <script src="js/custom.js"></script>--%>
    <script type="text/javascript">
        $(function () {
        var paneName = $("[id*=PaneName]").val() != "" ?
                       $("[id*=PaneName]").val() : "collapseOne";
                       $("#accordion .in").removeClass("in");
                       $("#" + paneName).collapse("show");
                       $(".accordion-header a").click(function () {
                       $("[id*=PaneName]").val($(this).attr("href").replace("#", ""));
            });
        });
    </script>

</body>
</html>
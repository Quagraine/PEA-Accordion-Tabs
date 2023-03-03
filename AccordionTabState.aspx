<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccordionTabState.aspx.cs" Inherits="PEAApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Content-->
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">

                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
                            style="width: 80%; background-color:#d2e3af;color:dimgray; align-self:center"
                            aria-controls="collapseOne" style="color:#d2e3af">APPLICATION TYPE </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        Content 1
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
                    </div>
                </div>
            </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                                style="width: 80%; background-color:#d2e3af;color:dimgray; align-self:center"
                                aria-expanded="false" aria-controls="collapseTwo" style="color:#d2e3af">EMPLOYMENT </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <!--<div class="accordion-body">-->
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
                                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>--%>
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
                                            <%--</ContentTemplate>
                                            </asp:UpdatePanel>--%>
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
                            <!-- </div>-->
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
                                style="width: 80%; background-color:#d2e3af;color:dimgray; align-self:center"
                                aria-expanded="false" aria-controls="collapseThree" style="color:#d2e3af">Header 3 </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            Content 3
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <asp:Button ID="Button1" Text="Review" runat="server" CssClass="btn btn-primary" />
                <asp:HiddenField ID="PaneName" runat="server" />
            </div> 
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    $(function () {
        var paneName = $("[id*=PaneName]").val() != "" ? $("[id*=PaneName]").val() : "collapseOne";
             
        //Remove the previous selected Pane.
        $("#accordion .in").removeClass("in");
             
        //Set the selected Pane.
        $("#" + paneName).collapse("show");
             
        //When Pane is clicked, save the ID to the Hidden Field.
        $(".panel-heading a").click(function () {
            $("[id*=PaneName]").val($(this).attr("href").replace("#", ""));
        });
    });
</script>
   

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_conductor.aspx.cs" Inherits="add_conductor" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="content-language" content="en" />
	<meta name="robots" content="noindex,nofollow" />
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" /> <!-- RESET -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" /> <!-- MAIN STYLE SHEET -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css" title="2col" /> <!-- DEFAULT: 2 COLUMNS -->
	<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css" title="1col" /> <!-- ALTERNATE: 1 COLUMN -->
	<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]--> <!-- MSIE6 -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" /> <!-- GRAPHIC THEME -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" /> <!-- WRITE YOUR CSS CODE HERE -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/switcher.js"></script>
	<script type="text/javascript" src="js/toggle.js"></script>
	<script type="text/javascript" src="js/ui.core.js"></script>
	<script type="text/javascript" src="js/ui.tabs.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $(".tabs > ul").tabs();
	    });
	</script>
	<title>Add Driver</title>
    <style type="text/css">
        .style19
        {
            height: 69px;
            text-align: left;
            width: 25%;
        }
        .style20
        {
            height: 69px;
            width: 283px;
        }
        .style21
        {
            height: 69px;
            width: 197px;
        }
        .style22
        {
            height: 63px;
            text-align: left;
            width: 25%;
        }
        .style23
        {
            height: 63px;
            width: 283px;
        }
        .style24
        {
            height: 63px;
            width: 197px;
        }
        .style25
        {
            height: 75px;
            text-align: left;
            width: 25%;
        }
        .style26
        {
            height: 75px;
            width: 283px;
        }
        .style27
        {
            height: 75px;
            width: 197px;
        }
        .style28
        {
            height: 81px;
            text-align: left;
            width: 25%;
        }
        .style29
        {
            height: 81px;
            width: 283px;
        }
        .style30
        {
            height: 81px;
            width: 197px;
        }
        .style31
        {
            font-size: x-large;
            color: #333333;
        }
        </style>
    </head>

<body>

    <form id="form1" runat="server">

<div id="main">

	<!-- Tray -->
	<div id="cols" class="box">

		<uc1:header ID="header" runat="server"></uc1:header>
		</div>
		
		<div>
			<h3 class="style31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add Conductor Details</h3>
			</div>
		<center>
		
		<table border="0" class="table "> 
						    
              <tr style="width: 100px">
                               <td class="style19"><asp:Label ID="lblfirst_namme" runat="server" 
                                       Text="First Name:"></asp:Label></td>
                                <td class="style20">
                                    <asp:TextBox ID="txt_firstname" runat="server" CssClass="input-text" Width="177px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style21">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 
                                            ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txt_firstname" Display="Dynamic" 
                                            ErrorMessage="First Name is Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <br />
                                        </td></tr>
                                 <tr style="width: 100px">
                               <td class="style22"><asp:Label ID="lblmiddle_name" runat="server" 
                                       Text="Middle Name:"></asp:Label></td>
                                <td class="style23">
                                    <asp:TextBox ID="txt_middlename" runat="server" CssClass="input-text" Width="173px" 
                                        Height="28px"></asp:TextBox>
                                     </td>
                                        <td class="style24">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txt_middlename" ErrorMessage="Middle Name is Requierd" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     </td></tr>
                          <tr style="width: 100px">
                               <td class="style25">
                                   <asp:Label ID="Label1" runat="server" 
                                       Text="Last Name:"></asp:Label></td>
                                <td class="style26">
                                    <asp:TextBox ID="txt_lastname" runat="server" CssClass="input-text" Width="170px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style27">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txt_lastname" ErrorMessage="Last Name is Requierd" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                               </td></tr>
                               <tr style="width: 100px">
                               <td class="style25">
                                   <asp:Label ID="Label4" runat="server" 
                                       Text="User Name:"></asp:Label></td>
                                <td class="style26">
                                    <asp:TextBox ID="txt_username" runat="server" CssClass="input-text" Width="170px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style27">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txt_username" ErrorMessage="User Name is Requierd" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                               </td></tr>
                               <tr style="width: 100px">
                               <td class="style25">
                                   <asp:Label ID="Label5" runat="server" 
                                       Text="Password:"></asp:Label></td>
                                <td class="style26">
                                    <asp:TextBox ID="txt_password" runat="server" CssClass="input-text" Width="170px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style27">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txt_password" ErrorMessage="Password Can Not Be Blank" 
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <br />
                               </td></tr>
                               <tr style="width: 100px">
                               <td class="style28">
                                   <asp:Label ID="Label2" runat="server" 
                                       Text="Address:"></asp:Label></td>
                                <td class="style29">
                                    <asp:TextBox ID="txt_address" runat="server" CssClass="input-text" Width="169px" 
                                        Height="28px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                    <td class="style30">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txt_address" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                               </td></tr>
                               <tr style="width: 100px">
                               <td class="style25">
                                   <asp:Label ID="Label6" runat="server" 
                                       Text="Contact No:"></asp:Label></td>
                                <td class="style26">
                                    <asp:TextBox ID="txt_contactno" runat="server" CssClass="input-text" Width="170px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style27">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txt_contactno" ErrorMessage="Contact No is Requierd" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                            ErrorMessage="Valid Contact No is Required" ValidationExpression="^[0-9]{10}" 
                                            ControlToValidate="txt_contactno"></asp:RegularExpressionValidator>
                               </td></tr>
                           
                        <tr style="width: 100px">
                               <td class="style28">
                                   <asp:Label ID="Label7" runat="server" 
                                       Text="Email Id:"></asp:Label></td>
                                <td class="style29">
                                    <asp:TextBox ID="txt_emailid" runat="server" CssClass="input-text" Width="169px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style30">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="txt_emailid" ErrorMessage="Email id is Required"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ErrorMessage="Invalid Email Id" ControlToValidate="txt_emailid" 
                                            SetFocusOnError="True" 
                                            
                                            
                                            ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                               </td></tr>
                               
                               
                      <tr style="height: 20px; width: 100px"><td colspan="3" valign="bottom" >
                                   <asp:Button ID="btnSave" runat="server" 
                                        Text="Save" Width="175px" Height="31px" CssClass="input-submit" 
                                       onclick="btnSave_Click" />&nbsp;&nbsp;<asp:Button 
                                        ID="btncancel" runat="server" 
                                        Text="Delete" Width="150px" Height="31px" OnClientClick="history.back()" 
                                        CssClass="input-submit" onclick="btncancel_Click" />&nbsp;&nbsp;<asp:Button 
                                       ID="btlreset" runat="server" 
                                        Text="Reset" Width="185px" Height="31px" CssClass="input-submit" 
                                       onclick="btlreset_Click" /></td></tr>
              
                                </table>
		</center>
		</div>
		
		</form  >
		</body>
</html>

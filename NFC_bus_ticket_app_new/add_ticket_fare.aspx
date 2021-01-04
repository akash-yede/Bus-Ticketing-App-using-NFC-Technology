<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_ticket_fare.aspx.cs" Inherits="add_ticket_fare" %>
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
			<h3 class="style31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Add Ticket Fare Details</h3>
			</div>
		<center>
		
		<table border="0" class="table "> 
						    
              <tr style="width: 100px">
                               <td class="style19"><asp:Label ID="lblfirst_namme" runat="server" 
                                       Text="Source:"></asp:Label></td>
                                <td class="style20">
                                    <asp:DropDownList ID="ddlSSource" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDataSource1" DataTextField="source" DataValueField="source" 
                                        Height="16px" Width="149px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:NFC_Bus_dbConnectionString %>" 
                                        SelectCommand="SELECT * FROM [auto_source]"></asp:SqlDataSource>
                                </td>
                                    <td class="style21">
                                        <asp:Label ID="lbl_show" runat="server" Font-Bold="True" Font-Italic="True" 
                                            ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="ddlSSource" Display="Dynamic" 
                                            ErrorMessage="Source is Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <br />
                                        </td></tr>
                                 <tr style="width: 100px">
                               <td class="style22"><asp:Label ID="lblmiddle_name" runat="server" 
                                       Text="Destination:"></asp:Label></td>
                                <td class="style23">
                                    <asp:DropDownList ID="ddlDestination" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDataSource2" DataTextField="destination" 
                                        DataValueField="destination" Height="19px" Width="148px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:NFC_Bus_dbConnectionString %>" 
                                        SelectCommand="SELECT * FROM [auto_destination]"></asp:SqlDataSource>
                                     </td>
                                        <td class="style24">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="ddlDestination" ErrorMessage="Destination is Required" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     </td></tr>
                          <tr style="width: 100px">
                               <td class="style25">
                                   <asp:Label ID="Label1" runat="server" 
                                       Text="Fare Amount:"></asp:Label></td>
                                <td class="style26">
                                    <asp:TextBox ID="txt_fare" runat="server" CssClass="input-text" Width="170px" 
                                        Height="28px"></asp:TextBox>
                                </td>
                                    <td class="style27">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txt_fare" ErrorMessage="Fare is Requierd" 
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
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

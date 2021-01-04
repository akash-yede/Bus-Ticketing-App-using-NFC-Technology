<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_login.aspx.cs" Inherits="Admin_login" %>

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
	<title>Admin Login</title>
    <style type="text/css">
        .style1
        {
            padding: 10px;
            background: #f5f5f5;
            width: 1329px;
            font-size: x-large;
        }
        .style2
        {
            height: 26px;
            width: 151px;
        }
        .style3
        {
            height: 26px;
            width: 125px;
        }
        .style4
        {
            width: 125px;
            height: 65px;
        }
        .style5
        {
            width: 125px;
            height: 55px;
        }
        .style6
        {
            height: 55px;
            width: 151px;
        }
        .style7
        {
            height: 26px;
            width: 212px;
        }
        .style8
        {
            height: 55px;
            width: 212px;
        }
        .style9
        {
            width: 212px;
            height: 65px;
        }
        .style11
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style12
        {
            color: #FFFFFF;
        }
        .style13
        {
            height: 65px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

<div id="main">

	<div id="tray" class="box">

		<p class="f-left box">

			<span class="style12">Project</span><span class="style11">: 
            NFC Based Bus ticket Booking System</span><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </strong>User: <strong><a href="#">Administrator</a></strong>&nbsp;&nbsp; </p>

	</div> <!--  /tray -->

	<hr class="noscreen" />

	<!-- Menu -->
    <!-- /header -->

	<hr class="noscreen" />

	<!-- Columns -->
    <!-- /main -->

    <br />
    </div><center>
    <h3 class="style1">NFC Based Bus Ticket Booking System</h3>
			<center><br />
			<center class="input-text">
			<table> 
			<tr>
			<td class="style3">Username</td> 
			<td class="style7">
                <asp:TextBox ID="txt_username" runat="server" Height="26px" Width="176px"></asp:TextBox>
                </td>
			<td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Enter username" ControlToValidate="txt_username"></asp:RequiredFieldValidator>
                </td>
			</tr>
			<tr>
			<td class="style5">Password</td> 
			<td class="style8">
                <asp:TextBox ID="txt_password" runat="server" Height="26px" Width="177px" 
                    TextMode="Password"></asp:TextBox>
                </td>
			<td class="style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Enter password" ControlToValidate="txt_password"></asp:RequiredFieldValidator>
                </td>
			</tr>
			<tr>
			<td class="style4"></td> 
			<td class="style9"> 
                <asp:Button ID="btnLogin" runat="server" Height="29px" Text="Login" 
                    Width="127px" CssClass="input-submit" onclick="btnLogin_Click" />
                <br />
                    <asp:Label ID="lblShow" runat="server" Font-Bold="True" Font-Italic="True" 
                        ForeColor="Red"></asp:Label>
                </td>
                <td class="style13"> 
                </td>
			</tr>
			
			</table>
            </center>
    </form>
</body>
</html>

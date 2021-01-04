<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/header.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

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
	<title>Android Based Taxi Booking System</title>
    <style type="text/css">
        .style1
        {
            color: #333333;
            font-size: xx-large;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

<div id="main">

	<!-- Tray -->
	

		<uc1:header ID="header" runat="server"></uc1:header>
		<!-- Aside (Left Column) -->
        <!-- /aside -->

		

		<!-- Content (Right Column) -->
	
            <center>    
			<h1 class="style1">Welcome To NFC Based Bus Ticket Booking System</h1>
            </center> 
            
			<!-- Headings -->
			<center>
			<h3> 
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    
                <asp:Image ID="Image1" runat="server" Height="318px" 
                    ImageUrl="~/images/ilstabletondeskvert0321.jpg" Width="762px" />
            
            </h3>
            </center>
		

	</div>
    
    </form>

</body>
</html>

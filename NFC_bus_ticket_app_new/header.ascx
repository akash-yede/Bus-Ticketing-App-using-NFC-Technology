<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="header" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="en" />
    <meta name="robots" content="noindex,nofollow" />
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/reset.css" />
    <!-- RESET -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/main.css" />
    <!-- MAIN STYLE SHEET -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/2col.css"
        title="2col" />
    <!-- DEFAULT: 2 COLUMNS -->
    <link rel="alternate stylesheet" media="screen,projection" type="text/css" href="css/1col.css"
        title="1col" />
    <!-- ALTERNATE: 1 COLUMN -->
    <!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
    <!-- MSIE6 -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/style.css" />
    <!-- GRAPHIC THEME -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="css/mystyle.css" />
    <!-- WRITE YOUR CSS CODE HERE -->
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
    <title>NFC Based Bus Ticket Boooking System</title>
</head>
<body>
    <div id="main">
        <div id="tray" class="box">
            <p class="f-left box" style="text-align: left">
                Project: <b>NFC Based Bus Ticket Boooking System</b></p>
            <p class="f-right">
                User: <a href="#">Administrator</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="admin_login.aspx?msg=logout"
                    id="logout">Log out</a></strong></p>
        </div>
        <!--  /tray -->
        <hr class="noscreen" />
        <!-- Menu -->
        <div id="menu" class="box">
            <ul class="box f-right">
                <li></li>
            </ul>
            <ul class="box">
                <li><a href="home.aspx"><span>Home</span></a></li>
                <li><a href="manage_passengers.aspx"><span>Manage Passengers</span></a></li>
                <li><a href="manage_conductors.aspx"><span>Manage Conductors</span></a></li>
                <%--<li><a href="manage_ticket_checkers.aspx"><span>Manage Ticket Checkers</span></a></li>--%>
                <li><a href="manage_ticket_fare.aspx"><span>Manage Ticket Fare</span></a></li>
                <li></li>
            </ul>
        </div>
        <!-- /header -->
        <hr class="noscreen" />
        <!-- Columns -->
        <!-- /cols -->
        <hr class="noscreen" />
        <!-- Footer -->
        <!-- /footer -->
    </div>
    <!-- /main -->
</body>
</html>

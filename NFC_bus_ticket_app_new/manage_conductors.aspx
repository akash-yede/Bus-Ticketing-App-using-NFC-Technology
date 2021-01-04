<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_conductors.aspx.cs" Inherits="manage_conductors" %>
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
	<title>Manage Passengers</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
            width: 1271px;
            font-size: x-large;
            padding: 10px;
            background: #f5f5f5;
            height: 25px;
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
			<h3 class="style1">Manage Conductors</h3>
			</div>
    <center>
    <table> <tr> <td>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/add_conductor.aspx">Add 
        New Conductor</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" Height="16px" Width="889px" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center" AllowPaging="True" 
            AllowSorting="True">
            <RowStyle ForeColor="#000066" HorizontalAlign="Center"/>
            <Columns>
                <asp:BoundField DataField="conductor_id" HeaderText="conductor_id" 
                    SortExpression="conductor_id" InsertVisible="False" ReadOnly="True" >
                </asp:BoundField>
                <asp:BoundField DataField="first_name" HeaderText="first_name" 
                    SortExpression="first_name" >
                </asp:BoundField>
                <asp:BoundField DataField="middle_name" HeaderText="middle_name" 
                    SortExpression="middle_name" >
                </asp:BoundField>
                <asp:BoundField DataField="last_name" HeaderText="last_name" 
                    SortExpression="last_name" >
                </asp:BoundField>
                <asp:BoundField DataField="username" HeaderText="username" 
                    SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="contact_no" HeaderText="contact_no" 
                    SortExpression="contact_no" />
                <asp:BoundField DataField="email_id" HeaderText="email_id" 
                    SortExpression="email_id" />
                <asp:HyperLinkField DataNavigateUrlFields="conductor_id" 
                    DataNavigateUrlFormatString="add_conductor.aspx?action=edit&amp;conductor_id={0}" 
                    HeaderText="Action" NavigateUrl="~/add_conductor.aspx" 
                    Text="Edit/Delete" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NFC_Bus_dbConnectionString %>" 
            SelectCommand="SELECT * FROM [Conductor_master]">
        </asp:SqlDataSource>
    </td></tr></table>
    </center>
  
		
		</form  >
</body>

</html>

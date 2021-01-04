using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_login : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand comm;
    public DataSet ds;
    public SqlDataAdapter da;
    public SqlDataReader dr;
    public int user_id;
    public string cs = ConfigurationManager.AppSettings["ConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msg"]=="logout")
        {
            Session["a_id"] = "";
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string u = txt_username.Text;
        string p = txt_password.Text;
        conn = new SqlConnection(cs);
        conn.Open();
        da = new SqlDataAdapter();
        da.SelectCommand = new SqlCommand();
        da.SelectCommand.Connection = conn;
        da.SelectCommand.CommandText = "select * from Admin_login where username=@username and password=@password";
        da.SelectCommand.CommandType = CommandType.Text;
        da.SelectCommand.Parameters.AddWithValue("@username", u);
        da.SelectCommand.Parameters.AddWithValue("@password", p);
        ds = new DataSet();
        da.Fill(ds, "Admin_login");
        if (ds.Tables["Admin_login"].Rows.Count == 0)
        {
            lblShow.Text = "";
            txt_username.Text = "";
            txt_password.Text = "";
            txt_username.Focus();
        }
        else if (ds.Tables["admin_login"].Rows.Count > 0)
        {
            user_id = Convert.ToInt32(ds.Tables["Admin_login"].Rows[0]["admin_id"]);
            Session["a_id"] = user_id;
            Response.Redirect("Home.aspx");

        }

    }
}
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;
using Microsoft.VisualBasic;

public partial class add_tc : System.Web.UI.Page
{
    SqlConnection conn;
    public SqlDataAdapter da;
    public DataSet ds;
    public SqlDataReader dr;
    public string tc_id;
    public string cs = ConfigurationManager.AppSettings["ConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["a_id"] == "")
        {
            Response.Redirect("Admin_login.aspx?msg=logout");
        }
        else
        {
            btncancel.Enabled = false;
            if (Request.QueryString["action"] == "edit" && this.IsPostBack == false)
            {
                btncancel.Enabled = true;
                tc_id = Request.QueryString["tc_id"];
                conn = new SqlConnection(cs);
                conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "tc_select";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@tc_id", tc_id);
                ds = new DataSet();
                da.Fill(ds, "tc_select");
                txt_firstname.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["first_name"]);
                txt_middlename.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["middle_name"]);
                txt_lastname.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["last_name"]);
                txt_username.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["username"]);
                txt_password.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["password"]);
                txt_address.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["address"]);
                txt_contactno.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["contact_no"]);
                txt_emailid.Text = Convert.ToString(ds.Tables["tc_select"].Rows[0]["email_id"]);

            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            conn = new SqlConnection(cs);
            conn.Open();
            tc_id = Request.QueryString["tc_id"];
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "tc_update";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@tc_id", tc_id);
            da.SelectCommand.Parameters.AddWithValue("@first_name", txt_firstname.Text);
            da.SelectCommand.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
            da.SelectCommand.Parameters.AddWithValue("@last_name", txt_lastname.Text);
            da.SelectCommand.Parameters.AddWithValue("@contact_no", txt_contactno.Text);
            da.SelectCommand.Parameters.AddWithValue("@address", txt_address.Text);
            da.SelectCommand.Parameters.AddWithValue("@email_id", txt_emailid.Text);

            da.SelectCommand.ExecuteNonQuery();
            Response.Redirect("manage_ticket_checkers.aspx?msg=update");
        }
        else
        {
            conn = new SqlConnection(cs);
            conn.Open();

            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "tc_insert";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            btncancel.Enabled = false;
            da.SelectCommand.Parameters.AddWithValue("@first_name", txt_firstname.Text);
            da.SelectCommand.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
            da.SelectCommand.Parameters.AddWithValue("@last_name", txt_lastname.Text);
            da.SelectCommand.Parameters.AddWithValue("@username", txt_username.Text);
            da.SelectCommand.Parameters.AddWithValue("@password", txt_password.Text);
            da.SelectCommand.Parameters.AddWithValue("@address", txt_address.Text);
            da.SelectCommand.Parameters.AddWithValue("@contact_no", txt_contactno.Text);
            da.SelectCommand.Parameters.AddWithValue("@email_id", txt_emailid.Text);

            da.SelectCommand.ExecuteNonQuery();

            Response.Redirect("manage_ticket_checkers.aspx");
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Action"] == "edit")
        {
            conn = new SqlConnection(cs);
            conn.Open();
            tc_id = Request.QueryString["tc_id"];
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "tc_delete";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@tc_id", tc_id);
            da.SelectCommand.ExecuteNonQuery();

            Response.Redirect("manage_ticket_checkers.aspx");
        }

    }
    protected void btlreset_Click(object sender, EventArgs e)
    {

    }
}
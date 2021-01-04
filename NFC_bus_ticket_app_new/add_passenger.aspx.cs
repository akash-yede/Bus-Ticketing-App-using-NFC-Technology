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
    

public partial class add_passenger : System.Web.UI.Page
{
    SqlConnection conn;
    public SqlDataAdapter da;
    public DataSet ds;
    public SqlDataReader dr;
    public string passenger_id;
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
                txt_middlename.Enabled = false;
                btncancel.Enabled = true;
                passenger_id = Request.QueryString["passenger_id"];
                conn = new SqlConnection(cs);
                conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "passenger_select";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@passenger_id", passenger_id);
                ds = new DataSet();
                da.Fill(ds, "passenger_select");
                txt_firstname.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["first_name"]);
                txt_middlename.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["middle_name"]);
                txt_lastname.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["last_name"]);
                txt_address.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["address"]);
                txt_contactno.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["contact_no"]);
                txt_emailid.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["email_id"]);
                //txt_source.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["source"]);
                //txt_destination.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["destination"]);
                txt_balance.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["balance"]);
                //txt_fare.Text = Convert.ToString(ds.Tables["passenger_select"].Rows[0]["fare"]);
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            conn = new SqlConnection(cs);
            conn.Open();
            passenger_id = Request.QueryString["passenger_id"];
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "passenger_update";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@passenger_id", passenger_id);
            da.SelectCommand.Parameters.AddWithValue("@first_name", txt_firstname.Text);
            da.SelectCommand.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
            da.SelectCommand.Parameters.AddWithValue("@last_name", txt_lastname.Text);
            da.SelectCommand.Parameters.AddWithValue("@address", txt_address.Text);
            da.SelectCommand.Parameters.AddWithValue("@contact_no", txt_contactno.Text);
            da.SelectCommand.Parameters.AddWithValue("@email_id", txt_emailid.Text);
            da.SelectCommand.Parameters.AddWithValue("@source", DBNull.Value);
            da.SelectCommand.Parameters.AddWithValue("@destination", DBNull.Value);
            da.SelectCommand.Parameters.AddWithValue("@balance", txt_balance.Text);
            da.SelectCommand.Parameters.AddWithValue("@fare", DBNull.Value);
            da.SelectCommand.ExecuteNonQuery();
            Response.Redirect("manage_passengers.aspx?msg=update");
        }
        else
        {

            conn = new SqlConnection(cs);

            da = new SqlDataAdapter("Select * from Passenger_master where middle_name=@midddlename",conn);
            da.SelectCommand.Parameters.AddWithValue("@midddlename",txt_middlename.Text);
            ds = new DataSet();
            da.Fill(ds,"check");
            if (ds.Tables["check"].Rows.Count > 0)
            {
                Label3.Text = "Pan Card No. Already Exist";
            }
            else
            {
                conn.Open();

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "passenger_insert";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                btncancel.Enabled = false;

                da.SelectCommand.Parameters.AddWithValue("@first_name", txt_firstname.Text);
                da.SelectCommand.Parameters.AddWithValue("@middle_name", txt_middlename.Text);
                da.SelectCommand.Parameters.AddWithValue("@last_name", txt_lastname.Text);
                da.SelectCommand.Parameters.AddWithValue("@address", txt_address.Text);
                da.SelectCommand.Parameters.AddWithValue("@contact_no", txt_contactno.Text);
                da.SelectCommand.Parameters.AddWithValue("@email_id", txt_emailid.Text);
                da.SelectCommand.Parameters.AddWithValue("@source", DBNull.Value);
                da.SelectCommand.Parameters.AddWithValue("@destination", DBNull.Value);
                da.SelectCommand.Parameters.AddWithValue("@balance", txt_balance.Text);
                da.SelectCommand.Parameters.AddWithValue("@fare", DBNull.Value);
                da.SelectCommand.ExecuteNonQuery();

                Response.Redirect("manage_passengers.aspx");
            }
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Action"] == "edit")
        {
            conn = new SqlConnection(cs);
            conn.Open();
            passenger_id = Request.QueryString["passenger_id"];
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "passenger_delete";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@passenger_id", passenger_id);
            da.SelectCommand.ExecuteNonQuery();

            Response.Redirect("manage_passengers.aspx");
        }
    }
    protected void btlreset_Click(object sender, EventArgs e)
    {
        txt_firstname.Text = "";
        txt_middlename.Text = "";
        txt_lastname.Text = "";
        txt_address.Text = "";
        txt_contactno.Text = "";
        txt_emailid.Text = "";
        //txt_source.Text = "";
        //txt_destination.Text = "";
        txt_balance.Text = "";
        //txt_fare.Text = "";
        txt_firstname.Focus();
    }
    protected void txt_lastname_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txt_lastname_TextChanged1(object sender, EventArgs e)
    {

    }
}
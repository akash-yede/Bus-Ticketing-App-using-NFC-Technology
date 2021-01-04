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

public partial class add_ticket_fare : System.Web.UI.Page
{
    SqlConnection conn;
    public SqlDataAdapter da;
    public DataSet ds;
    public SqlDataReader dr;
    public string ticket_fare_id;
    public string source, destination;
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
                ticket_fare_id = Request.QueryString["ticket_fare_id"];
                conn = new SqlConnection(cs);
                conn.Open();
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "ticket_fare_select";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@ticket_fare_id", ticket_fare_id);
                ds = new DataSet();
                da.Fill(ds, "ticket_fare_select");
                ddlSSource.SelectedValue = Convert.ToString(ds.Tables["ticket_fare_select"].Rows[0]["source"]);
                ddlDestination.SelectedValue = Convert.ToString(ds.Tables["ticket_fare_select"].Rows[0]["destination"]);
                txt_fare.Text = Convert.ToString(ds.Tables["ticket_fare_select"].Rows[0]["fare_amount"]);


            }

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == "edit")
        {
            string source = ddlSSource.SelectedItem.ToString();
            string destination = ddlDestination.SelectedItem.ToString();

            if (source == destination)
            {
                lbl_show.Text = "Wrong Selections";
            }
            else
            {

                conn = new SqlConnection(cs);
                conn.Open();
                ticket_fare_id = Request.QueryString["ticket_fare_id"];
                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "ticket_fare_update";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@ticket_fare_id", ticket_fare_id);
                da.SelectCommand.Parameters.AddWithValue("@source", ddlSSource.SelectedValue);
                da.SelectCommand.Parameters.AddWithValue("@destination", ddlDestination.SelectedValue);
                da.SelectCommand.Parameters.AddWithValue("@fare_amount", txt_fare.Text);


                da.SelectCommand.ExecuteNonQuery();
                Response.Redirect("manage_ticket_fare.aspx?msg=update");
            }
        }
        else
        {
            string source = ddlSSource.SelectedItem.ToString();
            string destination = ddlDestination.SelectedItem.ToString();

            if (source == destination)
            {
                lbl_show.Text = "Wrong Selections";
            }
            else
            {

                source = ddlSSource.SelectedValue;
                destination = ddlDestination.SelectedValue;
                conn = new SqlConnection(cs);
                conn.Open();

                da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = conn;
                da.SelectCommand.CommandText = "select * from Ticket_fare_master where source='" + source + "' and destination='" + destination + "'";
                da.SelectCommand.CommandType = CommandType.Text;
                ds = new DataSet();
                da.Fill(ds, "Information");
                if (ds.Tables["Information"].Rows.Count == 0)
                {
                    conn = new SqlConnection(cs);
                    conn.Open();

                    da = new SqlDataAdapter();
                    da.SelectCommand = new SqlCommand();
                    da.SelectCommand.Connection = conn;
                    da.SelectCommand.CommandText = "ticket_fare_insert";
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    btncancel.Enabled = false;
                    da.SelectCommand.Parameters.AddWithValue("@source", ddlSSource.SelectedValue);
                    da.SelectCommand.Parameters.AddWithValue("@destination", ddlDestination.SelectedValue);
                    da.SelectCommand.Parameters.AddWithValue("@fare_amount", txt_fare.Text);
                    da.SelectCommand.ExecuteNonQuery();
                    Response.Redirect("manage_ticket_fare.aspx");
                }
                else
                {
                    lbl_show.Text = "Source and Destination is already Exists";
                }
            }
                       
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Action"] == "edit")
        {
            conn = new SqlConnection(cs);
            conn.Open();
            ticket_fare_id = Request.QueryString["ticket_fare_id"];
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = conn;
            da.SelectCommand.CommandText = "ticket_fare_delete";
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@ticket_fare_id", ticket_fare_id);
            da.SelectCommand.ExecuteNonQuery();

            Response.Redirect("manage_ticket_fare.aspx");
        }
    }
    protected void btlreset_Click(object sender, EventArgs e)
    {
        
        txt_fare.Text = "";
        
    }
}
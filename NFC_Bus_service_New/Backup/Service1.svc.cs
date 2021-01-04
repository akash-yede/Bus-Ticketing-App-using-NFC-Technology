using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.ServiceModel.PeerResolvers;
using System.Xml;
using System.Xml.Linq;
using System.Net;
using System.IO;
using System.Text;

namespace NFCService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService1
    {
        SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        public XElement Login(string user, string pass)
        {
            XElement objResult = new XElement("login");
            string qry = String.Format("select * from Conductor_master where username='{0}' and password='{1}'", user,
                pass);
            SqlCommand cmd = new SqlCommand(qry, _con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                objResult.Add(new XElement("login_validation", true), new XElement("user_id", dt.Rows[0]["conductor_id"]));
                return objResult;
            }
            else
            {
                objResult.Add(new XElement("login_validation", false), new XElement("user_id", 0));
                return objResult;
            }
        }

        public XElement fetch_balance(string passengerId)
        {
            XElement objReslut = new XElement("fetch_balance");
            string qry = String.Format("select * from Passenger_master where passenger_id={0}", passengerId);
            SqlCommand cmd = new SqlCommand(qry, _con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                objReslut.Add(new XElement("passenger_id", passengerId), new XElement("balance", dt.Rows[0]["balance"]));
                return objReslut;
            }
            else
            {
                objReslut.Add(new XElement("passenger_id", passengerId), new XElement("balance", 0));
                return objReslut;
            }
        }

        public XElement travel(string check)
        {
            XElement objResult = new XElement("travel");
            SqlCommand cmd = new SqlCommand("select source  from auto_source; select destination  from auto_destination;", _con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                objResult.Add(new XElement("source", ds.Tables[0].Rows[i]["source"]), new XElement("destination", ds.Tables[0].Rows[i]["source"]));
                //return objResult;
            }
            return objResult;
        }

        public XElement transaction(string passengerId, string sFrom, string dTo, string amt, string qty)
        {
            XElement objResult = new XElement("transaction");
            string str = String.Format("select balance from Passenger_master where passenger_id={0}", passengerId);
            SqlCommand cmd = new SqlCommand(str, _con);
            _con.Open();
            var result = (int)cmd.ExecuteScalar();
            _con.Close();

            SqlDataAdapter da = new SqlDataAdapter("select contact_no from Passenger_master where passenger_id=@passengerid",_con);
            da.SelectCommand.Parameters.AddWithValue("passengerid",passengerId);
            DataSet ds = new DataSet();
            da.Fill(ds, "fetch");
            string phonenumber = ds.Tables["fetch"].Rows[0]["contact_no"].ToString();

            //string url = "http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=chintan&pwd=776308&to=" + phonenumber + "&sid=WEBSMS&msg=" + amt + "Rs. Was Deducted.&fl=0";

            //var result1 = fileGetContents(url);

            if (result > Convert.ToInt32(amt))
            {
                result -= Convert.ToInt32(amt);
                objResult.Add(new XElement("success", 1));
                SqlCommand objcmd = new SqlCommand("insert_transaction");
                objcmd.CommandType = CommandType.StoredProcedure;
                objcmd.Connection = _con;
                objcmd.Parameters.AddWithValue("@p_id", passengerId);
                objcmd.Parameters.AddWithValue("@date", DateTime.Now);
                objcmd.Parameters.AddWithValue("@source", sFrom);
                objcmd.Parameters.AddWithValue("@destination", dTo);
                objcmd.Parameters.AddWithValue("@fare", amt);
                objcmd.Parameters.AddWithValue("@qty", qty);
                _con.Open();
                objcmd.ExecuteNonQuery();
                _con.Close();

                string url = "http://login.smsgatewayhub.com/smsapi/pushsms.aspx?user=chintan&pwd=776308&to=" + phonenumber + "&sid=WEBSMS&msg=" + amt + "Rs. Was Deducted . Remaining Balance is "+result+" &fl=0";

                var result1 = fileGetContents(url);


                string strUpdate = String.Format("update passenger_master set balance={0} where passenger_id={1}",
                    result, passengerId);
                SqlCommand objCommand = new SqlCommand(strUpdate, _con);
                _con.Open();
                objCommand.ExecuteNonQuery();
                _con.Close();
            }
            else
            {
                objResult.Add(new XElement("success", 0));
            }
            return objResult;
        }

        protected static string fileGetContents(string fileName)
        {
            var sContents = string.Empty;
            var me = string.Empty;
            try
            {
                if (fileName.ToLower().IndexOf("http:") > -1)
                {
                    var wc = new WebClient();
                    var response = wc.DownloadData(fileName);
                    sContents = Encoding.ASCII.GetString(response);

                }
                else
                {
                    var sr = new StreamReader(fileName);
                    sContents = sr.ReadToEnd();
                    sr.Close();
                }
            }
            catch { sContents = "unable to connect to server "; }
            return sContents;
        }

        public XElement fare_check(string source, string destination)
        {
            XElement objResult = new XElement("fare_check");
            string str =
                String.Format("select fare_amount from Ticket_fare_master where source='{0}' and destination='{1}'",
                    source, destination);
            SqlCommand cmd = new SqlCommand(str, _con);
            _con.Open();
            int i = (int)cmd.ExecuteScalar();
            _con.Close();
            objResult.Add(new XElement("amount", i));
            return objResult;
        }

        public XElement passenger_log(string passengerId)
        {
            XElement objResult = new XElement("passenger_log");
            string str =
                String.Format("select top 5 * from Transaction_master where passenger_id={0} order by t_id desc",
                    passengerId);
            SqlCommand cmd = new SqlCommand(str, _con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    objResult.Add(new XElement("passenger_id", passengerId), new XElement("t_date", dt.Rows[i]["t_date"]), new XElement("source", dt.Rows[i]["source"]), new XElement("destination", dt.Rows[i]["destination"]), new XElement("fare", dt.Rows[i]["fare"]), new XElement("qty", dt.Rows[i]["qty"]));
                }
            }
                return objResult;
        }
    }
}

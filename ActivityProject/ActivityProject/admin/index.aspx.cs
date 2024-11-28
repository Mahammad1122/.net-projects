using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ActivityProject.admin
{
    public partial class index : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                int id = Int32.Parse(Session["id"].ToString());
                userDataBind(id);
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
        }
        private void userDataBind(int id)
        {
            SqlCommand cmd = new SqlCommand("spOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 5);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            dlUser.DataSource = sdr;
            dlUser.DataBind();
            con.Close();
        }
    }
}
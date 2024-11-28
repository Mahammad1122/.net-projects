using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ActivityProject.admin
{
    public partial class students : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                studentDataBind();
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            
        }
        private void studentDataBind()
        {
            SqlCommand cmd = new SqlCommand("spOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 0);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            dlStudents.DataSource = sdr;
            dlStudents.DataBind();
            con.Close();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("spOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtConfirmPassword.Text);
            string date = DateTime.Now.ToShortDateString();
            cmd.Parameters.AddWithValue("@created_at", date);
            con.Open();
            if (cmd.ExecuteNonQuery() > 0)
            {
                Response.Redirect("students.aspx");
            }
            else
            {
                Response.Write("User Not add");
            }
            con.Close();
        }
    }
}
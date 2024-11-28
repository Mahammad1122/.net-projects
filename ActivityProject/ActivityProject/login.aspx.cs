using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace ActivityProject
{
    public partial class login : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        private bool emailFlag = true;
        private bool passwordFlag = true;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("spOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 4);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            string email = null;
            string password = null;
            string name = null;
            int id = 0;
            int role = 0;
            while (sdr.Read())
            {
                id = Int32.Parse(sdr["id"].ToString());
                email = sdr["email"].ToString();
                password = sdr["password"].ToString();
                name = sdr["name"].ToString();
                role = Int32.Parse(sdr["role"].ToString());
            }
            con.Close();
            if (email == txtEmail.Text)
            {
                if (password == txtPassword.Text)
                {
                    if (role == 0)
                    {
                        Session["id"] = id;
                        Response.Redirect("user/index.aspx");
                    }
                    else if (role == 1)
                    {
                        Session["id"] = id;
                        Response.Redirect("admin/index.aspx");
                    }
                }
                else
                {
                    Response.Write("Password Not Match");
                }
            }
            else
            {
                Response.Write("Email not Match");
            }
        }
        protected void checkCredintial(object source, ServerValidateEventArgs args)
        {
            if (emailFlag == false)
            {
                EmailCustomValidator.IsValid = true;
            }
            if (passwordFlag == false)
            {
                PasswordCustomValidator.IsValid = true;
            }
        }

        
    }
}
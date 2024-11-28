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
    public partial class addBook : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {

            }
            else
            {
                Response.Redirect("../login.aspx");
            }
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string imgUrl = null;
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@author", txtAuthor.Text);
            cmd.Parameters.AddWithValue("@isbn", txtIsbn.Text);
            cmd.Parameters.AddWithValue("@genre", txtGenre.Text);
            if (fuBookImg.HasFile)
            { 
                imgUrl = "~/images/"+fuBookImg.FileName;
                fuBookImg.SaveAs(Server.MapPath(imgUrl));
            }
            cmd.Parameters.AddWithValue("@imgUrl", imgUrl);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                txtTitle.Text = txtQuantity.Text = txtGenre.Text = txtAuthor.Text = txtIsbn.Text = null;
                Response.Write("<script>alert('Book Added')</script>");
            }
            else
            {
                Response.Write("<script>alert('Book Not Added')</script>");            
            }
        }
        //private string genrate_ISBN()
        //{ 
            
        //}
    }
}
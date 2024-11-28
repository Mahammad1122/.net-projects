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
    public partial class editBooks : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                id = Int32.Parse(Request.QueryString["bookId"]);
                if (!IsPostBack)
                {
                    fetchBookData(id);
                }
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            
        }
        private void fetchBookData(int id)
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 4);
            cmd.Parameters.AddWithValue("@book_id", id);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtTitle.Text = sdr["title"].ToString();
                txtAuthor.Text = sdr["author"].ToString();
                txtIsbn.Text = sdr["isbn"].ToString();
                txtGenre.Text = sdr["genre"].ToString();
                txtQuantity.Text = sdr["total_books"].ToString();
                txtTitle.Text = sdr["title"].ToString();
                imgBook.ImageUrl = sdr["book_img_url"].ToString();
            }
            con.Close();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (fuBookImg.HasFile)
            {
                string imgUrl = "~/images/" + fuBookImg.FileName;
                fuBookImg.SaveAs(Server.MapPath(imgUrl));
                imgBook.ImageUrl = imgUrl;
            }
        }

        protected void btnEditBook_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 2);
            cmd.Parameters.AddWithValue("@book_id", id);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@author", txtAuthor.Text);
            cmd.Parameters.AddWithValue("@isbn", txtIsbn.Text);
            cmd.Parameters.AddWithValue("@genre", txtGenre.Text);
            cmd.Parameters.AddWithValue("@imgUrl", imgBook.ImageUrl);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Book Updated')</script>");
                Response.Redirect("~/admin/allBooks.aspx");
            }
            else
            {
                Response.Write("<script>alert('Book Not Updated')</script>");
            }
            con.Close();
        }
    }
}
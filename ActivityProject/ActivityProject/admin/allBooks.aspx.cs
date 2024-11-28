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
    public partial class allBooks : System.Web.UI.Page
    {
        private static string conStr = ConfigurationManager.ConnectionStrings["conLibrary"].ConnectionString;
        private SqlConnection con = new SqlConnection(conStr);
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["bookId"]))
                {
                    id = Int32.Parse(Request.QueryString["bookId"]);
                    deleteBook(id);
                }
                if (!IsPostBack)
                {
                    allBooksBind(null);
                    genreDataBind();
                }
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            
        }
        private void allBooksBind(string search) {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (String.IsNullOrEmpty(search))
            {
                cmd.Parameters.AddWithValue("@action", 0);
            }
            else
            {
                cmd.Parameters.AddWithValue("@action", 8);
                cmd.Parameters.AddWithValue("@search", search);
            }
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            dlBooks.DataSource = sdr;
            dlBooks.DataBind();
            con.Close();
        }
        private void deleteBook(int id)
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 6);
            cmd.Parameters.AddWithValue("@book_id", id);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/admin/allBooks.aspx");
            }
            else
            {
                Response.Write("<script>alert('Book Not Added')</script>");
            }
            con.Close();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bookBindDetailView();
            btnClear.Visible = true;
            txtSearch.Text = null;
        }
        private void bookBindDetailView()
        {
            if (txtSearch.Text.Trim() == "")
            {
                lblNotFound.Text = null;
                dlSearchBook.DataSource = null;
                dlSearchBook.DataBind();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("spBookOperation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", 5);
                cmd.Parameters.AddWithValue("@search", txtSearch.Text);
                con.Open();
                SqlDataReader sdr2 = cmd.ExecuteReader();
                if (sdr2.HasRows)
                {
                    dlSearchBook.DataSource = sdr2;
                    dlSearchBook.DataBind();
                }
                else
                {
                    lblNotFound.Text = "Book Not Found";
                }
                con.Close();
            }
        }
        private void genreDataBind()
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 7);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            radioListGenre.DataTextField = "genre";
            radioListGenre.DataValueField = "genre";
            radioListGenre.DataSource = sdr;
            radioListGenre.DataBind();
            con.Close();
        }
        protected void radioListGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            allBooksBind(radioListGenre.SelectedValue);
            btnClear.Visible = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("allBooks.aspx");
        }
        
    }
}
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
    public partial class issueBook : System.Web.UI.Page
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
                    returnBook(id);
                }
                if (!IsPostBack)
                {
                    ddlBooksDataBind();
                    issueBookDataBind();
                }
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            
        }
        private void ddlBooksDataBind()
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 0);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            ddlBooks.DataTextField = "title";
            ddlBooks.DataValueField = "id";
            ddlBooks.DataSource = sdr;
            ddlBooks.DataBind();
            con.Close();
        }

        protected void btnIssueBook_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("spBorrowBook", con);
            int book_id = Int32.Parse(ddlBooks.SelectedItem.Value);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            cmd.Parameters.AddWithValue("@book_id", book_id);
            cmd.Parameters.AddWithValue("@user_id", Int32.Parse(txtUserId.Text));
            cmd.Parameters.AddWithValue("@borrowed_date", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@due_date", txtDueDate.Text);
            if (getBookQuantity(book_id) > 0)
            {
                lblMessage.Text = null;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect("issueBook.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Book not issue')</script>");
                }
                con.Close();
            }
            else
            {
                lblMessage.Text = "Book Not Available";
            }
        }
        private void issueBookDataBind()
        {
            SqlCommand cmd = new SqlCommand("spBorrowBook", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 0);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            dlIssueBooks.DataSource = sdr;
            dlIssueBooks.DataBind();
            con.Close();
        }
        private void returnBook(int id)
        {
            SqlCommand cmd = new SqlCommand("spBorrowBook", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 3);
            cmd.Parameters.AddWithValue("@return_date", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@status", 0);
            cmd.Parameters.AddWithValue("@book_id", getBookId(id));
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/admin/issueBook.aspx");
            }
            else
            {
                Response.Write("<script>alert('Book Not returned')</script>");
            }
        }
        private int getBookId(int id)
        {
            SqlCommand cmd = new SqlCommand("spBorrowBook", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 4);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                id = Int32.Parse(sdr["book_id"].ToString());
            }
            con.Close();
            return id;
        }
        private int getBookQuantity(int id)
        {
            SqlCommand cmd = new SqlCommand("spBookOperation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 9);
            cmd.Parameters.AddWithValue("@book_id", id);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                id = Int32.Parse(sdr["total_books"].ToString());
            }
            con.Close();
            return id;
        }
    }
}
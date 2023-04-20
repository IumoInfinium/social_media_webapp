using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class post : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter ad;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["loggedIn"] == null) Response.Redirect("login.aspx");
        if (Request.QueryString["postid"] == null) Response.Redirect("feed.aspx");

        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();

        string query = "select p.postid, p.user_id, p.postURL, p.postContent, p.postOn, (select username from accounts where id = user_id) as postBy, (select COUNT(*) from likes where post_id= p.postid) likeCounts from posts p where p.postid = " + Request.QueryString["postid"].ToString();
            
        ad = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script> alert('No Post found!');</script>");
            Response.Redirect("feed.aspx");
        }
        else
        {
            
            string post_username = ds.Tables[0].Rows[0][5].ToString();
            Label1.Text = post_username;
            Image2.ImageUrl = ds.Tables[0].Rows[0][2].ToString();

            Label3.Text = "Liked by "+ds.Tables[0].Rows[0][6].ToString().Trim();
            Label4.Text = post_username;
                       
            PostContent_TextBox.Text = ds.Tables[0].Rows[0][3].ToString();

            Label7.Text = "Last Updated On " + DateTime.Parse(ds.Tables[0].Rows[0][4].ToString()).ToString("dd/MM/yyyy HH:mm");

            Label8.Text = Session["username"].ToString() ;
                
            if (post_username == Session["username"].ToString())
            {
                Panel1.Visible = true;
            }
                
        }
        
    }
    protected void DeletePost_Btn_Click(object sender, EventArgs e)
    {

        if (Session["username"] != null && Session["username"].ToString() == Label1.Text)
        {
            string query = "delete from posts where postid =" + Request.QueryString["postid"].ToString() +"; delete from likes  where post_id =" + Request.QueryString["postid"].ToString();
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Post Deleted!');</script>");
            Response.Redirect("feed.aspx");
        }
    }
}
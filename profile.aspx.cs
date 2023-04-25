using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class profile : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter ad;
    SqlCommand cmd;

    string curr_user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["username"] == null)
        {
            if (Session["username"] != null) curr_user = Session["username"].ToString();
            else Response.Redirect("login.aspx");
        }
        else curr_user = Request.QueryString["username"].ToString();

        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();

        if (!IsPostBack)
        {
            string query = "select * from accounts where username = '" + curr_user + "'";
            cmd = new SqlCommand(query, conn);

            SqlDataAdapter ad = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();

            ad.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script> alert('No user found with such username!') </script>");
                Response.Redirect("feed.aspx");
            }
            else
            {
                Label1.Text = curr_user;

                TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][3].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][4].ToString();

                Label3.Text = ds.Tables[0].Rows[0][7].ToString();
                Label4.Text = ds.Tables[0].Rows[0][8].ToString();

                string query2 = "select * from posts where user_id= (SELECT id from accounts where username='" + curr_user + "') order by postOn desc";

                SqlDataAdapter ad2 = new SqlDataAdapter(query2, conn);
                DataSet ds2 = new DataSet();
                ad2.Fill(ds2);

                Label2.Text = ds2.Tables[0].Rows.Count.ToString();
                r1.DataSource = ds2;
                r1.DataBind();
            }
        }
        //reader.Close();

        if (((Session["username"]!=null && Request.QueryString["username"] != null)  && Request.QueryString["username"] == Session["username"].ToString())
            ||
            (Session["username"] != null && Request.QueryString["username"]  == null)
            )
        {

            TextBox1.Attributes.Remove("disabled");
            TextBox2.Attributes.Remove("disabled");
            TextBox3.Attributes.Remove("disabled");
            TextBox4.Attributes.Remove("disabled");

            TextBox1.Style.Add("border-bottom", "1px solid gray");
            TextBox2.Style.Add("border-bottom", "1px solid gray");
            TextBox3.Style.Add("border-bottom", "1px solid gray");
            TextBox4.Style.Add("border-bottom", "1px solid gray");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((Session["username"] != null && Request.QueryString["username"]!= null &&  Session["username"].ToString() == Request.QueryString["username"].ToString())
            ||(Session["username"] !=null && Request.QueryString["username"] == null)
            )
        {
            string query = "update accounts set name='" + TextBox1.Text + "', number= '" + TextBox2.Text + "', email = '" + TextBox3.Text + "', bio = '" + TextBox4.Text + "' where username= '" + curr_user + "'";
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

        }
    }

    protected void GoToPost(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "gotopost") {
            Response.Redirect("post.aspx?postid=" + e.CommandArgument);
        }
    }
}
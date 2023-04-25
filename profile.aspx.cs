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

    // id of the user with opened profile page
    int profileUserID;

    // id of logged In user
    int loggedInUserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null) Response.Redirect("login.aspx");

        if (Request.QueryString["username"] == null)
        {
            if (Session["username"] != null) curr_user = Session["username"].ToString();
            else Response.Redirect("login.aspx");
        }
        else curr_user = Request.QueryString["username"].ToString();

        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();

        
        // logged in user query
        string user_query = "SELECT id from accounts where username = '" + Session["username"].ToString() + "'";
        ad = new SqlDataAdapter(user_query, conn);
        DataSet user_ds = new DataSet();
        ad.Fill(user_ds);

        loggedInUserID = Convert.ToInt16(user_ds.Tables[0].Rows[0][0]);


        if (!IsPostBack)
        {
            
            string query = "select * from accounts a , follows f where a.username = '" + curr_user + "'";
            
            cmd = new SqlCommand(query, conn);

            SqlDataAdapter ad2 = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();

            ad2.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script> alert('No user found with such username!') </script>");
                Response.Redirect("feed.aspx");
            }
            else
            {
                profileUserID = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                Label1.Text = curr_user;

                string follow_query = "select count(follower_id) from follows where followee_id= " + loggedInUserID.ToString();
                SqlDataAdapter follow_ad= new SqlDataAdapter(follow_query, conn);
                DataSet tmp_ds = new DataSet();
                follow_ad.Fill(tmp_ds);
                string following = tmp_ds.Tables[0].Rows[0][0].ToString();
                tmp_ds.Clear();

                follow_query = "select count(followee_id) from follows where follower_id= " + loggedInUserID.ToString();
                SqlDataAdapter followers_ad = new SqlDataAdapter(follow_query, conn);
                followers_ad.Fill(tmp_ds);
                string followers = tmp_ds.Tables[0].Rows[0][0].ToString();

                TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][3].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][4].ToString();

                Response.Write(followers);
                Label3.Text = following.ToString();
                Label4.Text = followers.ToString();

                string query2 = "select * from posts where user_id= (SELECT id from accounts where username='" + curr_user + "') order by postOn desc";

                SqlDataAdapter ad3 = new SqlDataAdapter(query2, conn);
                DataSet ds2 = new DataSet();
                ad3.Fill(ds2);

                Label2.Text = ds2.Tables[0].Rows.Count.ToString();
                r1.DataSource = ds2;
                r1.DataBind();

                
                // For follow-button show or not
                string query3 = "select Count(*) from follows where follower_id ="+loggedInUserID+ " and followee_id =" + profileUserID;
                SqlDataAdapter ad4 = new SqlDataAdapter(query3, conn);
                DataSet ds4 = new DataSet();
                ad4.Fill(ds4);

                if (loggedInUserID == profileUserID)
                {
                    FollowControl_LinkButton.Style.Add("display", "none");
                }
                else
                {
                    if (ds4.Tables[0].Rows.Count == 0)
                    {
                        ProfileFollow_Button.Text = "Follow";
                        FollowControl_LinkButton.CommandName = "follow";
                    }
                    else
                    {
                        ProfileFollow_Button.Text = "Unfollow";
                        FollowControl_LinkButton.CommandName = "unfollow";
                    }
                    Button1.Style.Add("display", "none");
                }
            }
        }
        //reader.Close();

        // Profile Features
        // Name, Number, City, Location
        if (((Session["username"] != null && Request.QueryString["username"] != null) && Request.QueryString["username"] == Session["username"].ToString())
            ||
            (Session["username"] != null && Request.QueryString["username"] == null)
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
    protected void FollowControlCmd_LinkButton(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "follow")
        {
            string query = @"insert into follows values
            (" + loggedInUserID.ToString() + "," + profileUserID + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "')";
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            ProfileFollow_Button.CommandName = "unfollow";
        }
        else if (e.CommandName == "unfollow")
        {
            string query = @"delete from follows where follower_id="+loggedInUserID.ToString() + ",followee_id=" + profileUserID ;
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            ProfileFollow_Button.CommandName = "follow";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

public partial class feed : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter ad;
    Image like_img;

    string user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["loggedIn"] == null) Response.Redirect("login.aspx");

        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();

        string user_query = "select * from accounts where username ='" + Session["username"] + "'";
        SqlDataAdapter user_ad = new SqlDataAdapter(user_query, conn);
        DataSet user_ds= new DataSet();
        int user_exist =  user_ad.Fill(user_ds);

        if (user_exist == 0) Response.Redirect("login.aspx");
        Label8.Text = Session["username"].ToString();

        user_id = user_ds.Tables[0].Rows[0][0].ToString();
        Label9.Text = user_ds.Tables[0].Rows[0][1].ToString();

        if (!IsPostBack){
            string query = @"
                select
                p.postid,
                (SELECT accounts.username from accounts where id=p.user_id) as postBy ,
                p.postURL, p.postContent, p.postOn, p.user_id ,
                (select COUNT(DISTINCT(user_id)) from likes where post_id= p.postid ) likeCounts,
                (select COUNT(*) from likes where user_id= "+ user_id + @" and post_id = p.postid )  likeState  
                from posts p order by p.postOn desc ";
            ad = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();

            int feed_count = ad.Fill(ds);

            if(feed_count> 0){
                feed_repeater.DataSource = ds;
                feed_repeater.DataBind();
            }
            else{
                noFeed_Label.Style.Remove("display");
                noFeed_Label.Text = "Seems like you don't have any following.."; 
            }
             
            string suggestion_query = "SELECT * from accounts a where a.id != "+ user_id;
            SqlDataAdapter suggestion_ad = new SqlDataAdapter(suggestion_query, conn);
            DataSet ds2 = new DataSet();

            int suggestion_count = suggestion_ad.Fill(ds2);

            if (suggestion_count == 0)
            {
                noSuggestion_Label.Style.Remove("display");
                noSuggestion_Label.Text = "You have no suggestions right now..";
            }
            else
            {
                feedSuggestion_Repeater.DataSource = ds2;
                feedSuggestion_Repeater.DataBind();
            }

            
        }
    }
    protected void LikePost_Btn(object sender, CommandEventArgs e)
    {
        LinkButton link_button = sender as LinkButton;
        Image img = (Image)link_button.FindControl("Image3");
        //Thread.Sleep(500);
        //Label likeCount = (Label)link_button.Parent.Parent.Controls[1].Controls[0].FindControl("Label3");
        //Int32 count = likeCount.Text != "" ? Convert.ToInt32(likeCount.Text.Split(' ')[0]): 0;
        if(e.CommandName =="like_post"){
        //if (img.ImageUrl == "./assets/imgs/heart.png"){
                if (link_button != null)
                {
                    //LinkButton userlink_Btn = (LinkButton)link_button.Parent.Parent.Controls[2].FindControl("LinkButton6");
                    //string post_username = userlink_Btn.CommandArgument.ToString();

                    string post_id = e.CommandArgument.ToString().Split(',')[0];
                    //string user_id = e.CommandArgument.ToString().Split(',')[1];

                    string query = "insert into likes values(" + user_id + "," + post_id + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "')";

                    //Response.Write(query);
                    cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    //Thread.Sleep(500);
                    img.ImageUrl = "./assets/imgs/like.png";
                    //likeCount.Text = (count + 1).ToString();
                    link_button.CommandName = "unlike_post";
                    Response.Redirect("feed.aspx");
                }
            
        }
        else if(e.CommandName == "unlike_post")
        //else if (img.ImageUrl == "./assets/imgs/like.png")
        {
                //LinkButton userlink_Btn = (LinkButton)link_button.Parent.Parent.Controls[2].FindControl("LinkButton6");
                if (link_button != null)
                {
                    string post_id = e.CommandArgument.ToString().Split(',')[0];
                    //string user_id = e.CommandArgument.ToString().Split(',')[1];
                    
                    string query = "delete from likes where user_id =" + user_id + " and post_id=" + post_id + "";

                    cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    //likeCount.Text = count - 1 < 0 ? (0).ToString() : (count - 1).ToString();
                    img.ImageUrl = "./assets/imgs/heart.png";
                    link_button.CommandName = "like_post";

                    Response.Redirect("feed.aspx");
                }
           
        }

    }
    protected void GoToProfile(object sender, CommandEventArgs e) {
        if (e.CommandName == "gotoprofile" ){
            Response.Redirect("profile.aspx?username=" + e.CommandArgument);
        }
    }

    protected void FollowUser(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "follow_user"){
            string query = "INSERT into follows values (" + e.CommandArgument + "," + user_id + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "')";
            cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            
        }
    }
}
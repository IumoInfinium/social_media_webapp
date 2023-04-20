using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class create : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter ad;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["loggedIn"] == null) Response.Redirect("login.aspx");
 
        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();

        if(Request.Cookies["file"] != null) Image1.ImageUrl = Request.Cookies["file"].Value.ToString();
        Label1.Text = Session["username"].ToString();
        Label2.Text = Session["username"].ToString();
        Label4.Text = Session["username"].ToString();
        Label5.Text = Session["username"].ToString();
    }

    protected void UploadFile_Btn_Click(object sender, EventArgs e)
    {
        string strFileName;
        string strFilePath;
        string strFolder;
        string opath="";
        string dir_struct = "~/assets/imgs/user_uploads/";
        strFolder = Server.MapPath(dir_struct);

        if (FileUpload1.HasFile)
        {
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            ext.ToLower();

            if (ext == ".png" || ext == ".gif" || ext == ".jpg" || ext == ".jpeg")
            {
                long file_size = FileUpload1.FileContent.Length;

                if (file_size <= 1024 * 1024 * 5)
                {
                   
                    String path = Server.MapPath(dir_struct + FileUpload1.FileName);

                    string append_name = "";
                    
                    if (File.Exists(Server.MapPath(dir_struct + FileUpload1.FileName))) {
                        append_name += DateTime.Now.ToString("yyyy-MM-dd-HH-mm");
                    }
                    
                    FileUpload1.SaveAs(Server.MapPath(dir_struct + append_name +FileUpload1.FileName));
                    opath = dir_struct + append_name + FileUpload1.FileName;
                    Response.Cookies["file"].Value = opath;

                    Image1.ImageUrl = opath;
                }
                else Response.Write("<script> alert('Cannot upload a large file!');</script>");
            }
            else Response.Write("<script> alert('File format not supported!');</script>");
        }
        else  Response.Write("<script>alert('Select a file!');</script>");

    }

    
    protected void Post_Btn_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["loggedIn"] == null) Response.Redirect("login.aspx");
        if (Request.Cookies["file"] == null) Response.Write("<script>alert('Upload a file to post something');</script>");

        string query = "select * from accounts where username = '" + Session["username"].ToString() + "'";
        ad = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        

        query = "insert into posts values('"+ ds.Tables[0].Rows[0][0].ToString() + "','" + Request.Cookies["file"].Value.ToString()+"', '"+ TextBox1.Text +"', '"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm")+"');";
        cmd = new SqlCommand(query, conn);
        cmd.ExecuteNonQuery();

        Response.Redirect("profile.aspx?username=" + Session["username"].ToString());
    }
}
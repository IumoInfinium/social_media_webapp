using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class login : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter ad;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        conn = new SqlConnection(path);
        conn.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "") Response.Write("<script>alert('Fill all the details!')</script>");
        else
        {
            string query = "Select * from accounts where username='" + TextBox1.Text.Trim() + "'";

            cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                ReadSingleRow(TextBox2.Text.Trim(), (IDataRecord)reader);
                reader.Close();
            }
            else
            {
                reader.Close();
                Response.Write("<script>alert('Account does not exist!')</script>");
            }
        }
    }
    protected void ReadSingleRow(string s, IDataRecord dataRecord)
    {
        if (s == dataRecord[5].ToString())
        {
            Session["loggedIn"] = true;
            Session["username"] = TextBox1.Text;
            Response.Redirect("feed.aspx");
        }
        else Response.Write("<script> alert('Incorrect username/password! Please try again !!');</script>");

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
}
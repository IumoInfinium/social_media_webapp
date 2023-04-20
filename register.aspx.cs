using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class register : System.Web.UI.Page
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
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "")
            Response.Write("<script>alert('Fill all the details!')</script>");
        else
        {
            string query = "Select * from accounts where email ='" + TextBox4.Text.Trim() + "'";

            cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                Response.Write("<scrpit>alert('Account with this username already exists!')</script>");
                reader.Close();
            }
            else
            {
                reader.Close();
                query = "insert into accounts values ('" + TextBox1.Text +"', '" +TextBox2.Text+"' , '"+TextBox4.Text+"', '"+TextBox3.Text+"', '"+TextBox5.Text+"','" +"your bio"+"'," +0+","+0 +")";
                cmd =new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                
                Response.Write("<script> alert('Account Created Successfully!') </script>");
                Response.Redirect("login.aspx");

            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}
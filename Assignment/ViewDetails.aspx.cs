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
using System.Drawing;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Text;
using System.ComponentModel;

namespace Assignment
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                
            }
        }
        protected String loginUser()
        {
            string User_name = string.Empty;
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {
                User_name = reqCookies["UserName"].ToString();
                return User_name;
            }
            else
            {
                return User_name;
            }
        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void btnP_Click(object sender, EventArgs e)
        {
          
        }

        protected void btnM_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                System.Web.UI.WebControls.Label l1 = item.FindControl("Label3") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l2 = item.FindControl("Label4") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l3 = item.FindControl("Label2") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l4 = item.FindControl("Label9") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l5 = item.FindControl("Label10") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l6 = item.FindControl("Label11") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.TextBox l7 = item.FindControl("txtQuantity") as System.Web.UI.WebControls.TextBox;
                System.Web.UI.WebControls.Image l8 = item.FindControl("pictureBox1") as System.Web.UI.WebControls.Image;
                string s1 = l1.Text;
                string s2 = l2.Text;
                string s3 = l3.Text;
                string s4 = l4.Text;
                string s5 = l5.Text;
                string s6 = l6.Text;
               
                int s7 = Int32.Parse(l7.Text);
                string s8 = l8.ImageUrl;

                string mainconn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                string sql = "INSERT INTO cart" +
                            "(Cuser,Pname,Size,Price,Description,Category,Date,CoverPhoto,Quantity)" +
                            "VALUES (@username,@s1,@s3,@s2,@s6,@s5,@s4,@sp,@i7)";

                SqlCommand cmd = new SqlCommand(sql, con);
                String username = loginUser();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@s1", s1);
                cmd.Parameters.AddWithValue("@s2", s2);
                cmd.Parameters.AddWithValue("@s3", s3);
                cmd.Parameters.AddWithValue("@s4", s4);
                cmd.Parameters.AddWithValue("@s5", s5);
                cmd.Parameters.AddWithValue("@s6", s6);
                cmd.Parameters.AddWithValue("@sp", s8);
                cmd.Parameters.AddWithValue("@i7", s7);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("ShoppingCart.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                System.Web.UI.WebControls.Label l1 = item.FindControl("Label3") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l2 = item.FindControl("Label4") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l3 = item.FindControl("Label2") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l4 = item.FindControl("Label9") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l5 = item.FindControl("Label10") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.Label l6 = item.FindControl("Label11") as System.Web.UI.WebControls.Label;
                System.Web.UI.WebControls.TextBox l7 = item.FindControl("txtQuantity") as System.Web.UI.WebControls.TextBox;
                System.Web.UI.WebControls.Image l8 = item.FindControl("pictureBox1") as System.Web.UI.WebControls.Image;
                string s1 = l1.Text;
                string s2 = l2.Text;
                string s3 = l3.Text;
                string s4 = l4.Text;
                string s5 = l5.Text;
                string s6 = l6.Text;
                string ss = l7.Text;
                int s7 = 5;
                string s8 = l8.ImageUrl;


                string mainconn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                string sql = "INSERT INTO wish" +
                            "(Wuser,Pname,Size,Price,Description,Category,Date,CoverPhoto,Quantity)" +
                            "VALUES (@username,@s1,@s3,@s2,@s6,@s5,@s4,@sp,@i7)";

                SqlCommand cmd = new SqlCommand(sql, con);
                String username = loginUser();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@s1", s1);
                cmd.Parameters.AddWithValue("@s2", s2);
                cmd.Parameters.AddWithValue("@s3", s3);
                cmd.Parameters.AddWithValue("@s4", s4);
                cmd.Parameters.AddWithValue("@s5", s5);
                cmd.Parameters.AddWithValue("@s6", s6);
                cmd.Parameters.AddWithValue("@sp", s8);
                cmd.Parameters.AddWithValue("@i7", s7);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("wish.aspx");

            }
        }
    }
}


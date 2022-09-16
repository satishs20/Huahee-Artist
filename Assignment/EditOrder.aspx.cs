using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

namespace Assignment
{
    public partial class EditOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["newOrderId"] != null)
            {
                Label9.Text = "This is " + Session["newOrderId"].ToString();
            }
            else
            {
                Label9.Text = "Please try again";
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String newquantity = TextBox2.Text;
            String sessionpass = (string)Session["newOrderId"];
            int quantity = Convert.ToInt32(newquantity);
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string s = "update cart set  Quantity= " + quantity + " where  CartId= " + sessionpass;
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ShoppingCart.aspx");

        }
    }
}
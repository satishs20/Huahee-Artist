using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class payWithBank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showAmount.Text = Session["total"].ToString();
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

        protected void paybutton_Click(object sender, EventArgs e)
        {

            String cardNumber = getcardNumber.Text.ToString();
            String email = getEmail.Text.ToString();
            String cvc = getCVC.Text.ToString();
            if (getMonth.SelectedValue != "")
            {
                String month = getMonth.SelectedValue.ToString();
            }
            if (getYear.SelectedValue != "")
            {
                String year = getYear.SelectedValue.ToString();
            }

            foreach (ListItem item in paymentChoose.Items)
            {
                if (item.Selected)
                {
                    String paymentMethod = item.ToString();
                }
            }

            Session["cardNumber"] = cardNumber;
            Session["email"] = email;

            Response.Redirect("sendToEmail.aspx");
        }

        protected void getcardNumber_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
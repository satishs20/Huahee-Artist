using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace HuaheeArtist_v3
{
    public partial class HeaderAndFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = loginUser();
            HttpCookie myCookie = new HttpCookie("username");
            myCookie.Value = username;
            myCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(myCookie);

            if (Request.Cookies["userInfo"] == null)
            {
                signup.Visible = true;
                login.Visible = true;
                user.Visible = false;
            }
            else
            {
                signup.Visible = false;
                login.Visible = false;
                user.Visible = true;
            }

            String getType = UserType();
            if(getType == "Artists")
            {
                searchbox.Visible = false;
                search.Visible = false;
            }
            else
            {
                searchbox.Visible = true;
                search.Visible = true;
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

        protected void Upload(object sender, EventArgs e)
        {
            string cookie = loginUser();
            Response.Cookies["cookie"].Value = string.Empty;
            Response.Cookies["cookie"].Expires = DateTime.Now.AddMonths(-20);
            Response.Cookies.Add(new HttpCookie("cookie", ""));
            HttpCookie reqCookies = Request.Cookies["userInfo"];


            reqCookies.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(reqCookies);

            Response.Redirect("Gallery.aspx");
        }

        protected String UserType()
        {
            string User_type = string.Empty;
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {
                User_type = reqCookies["UserType"].ToString();
                return User_type;
            }
            else
            {
                return User_type;
            }
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sign Up.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {
            String getUser = UserType();
            if (Request.Cookies["userInfo"] == null)
            {
                Response.Redirect("Gallery.aspx");
            }
            else
            {
                if(getUser == "Artists")
                {
                    Response.Redirect("Gallery.aspx");
                }
                else
                {
                    Response.Redirect("Wish.aspx");
                }
                
            }
                
        }

        protected void announcement_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "mykey", "announcement();", true);
        }

        protected void intoProfile(object sender, EventArgs e)
        {
            Response.Redirect("User Profile.aspx");
        }

        protected void logo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Gallery.aspx");
        }

        protected void search_Click(object sender, ImageClickEventArgs e)
        {
            Session["Search"] = searchbox.Text;
            Response.Redirect("search.aspx");
            String getuser = UserType();
            if(getuser == "Artists")
            {
                Response.Redirect("Gallery.aspx");
            }
            else
            {
                Response.Redirect("search.aspx");
            }
        }

        protected void shoppingcart_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.Cookies["userInfo"] == null)
            {
                Response.Redirect("Gallery.aspx");
            }
            else
            {
                String getuser = UserType();
                if(getuser == "Artists")
                {
                    Response.Redirect("Gallery.aspx");
                }
                else
                {
                    Response.Redirect("ShoppingCart.aspx");
                }
            }
            
        }
    }
}
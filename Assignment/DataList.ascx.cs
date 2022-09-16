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
    public partial class DataList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {


                DataList1.Visible = true;
                string type = UserType();


                if (type == "Customer")
                {
                    DataList1.DataSourceID = null;
                    DataList1.DataSource = SqlDataSource1;
                    DataList1.DataBind();
                }
                else if (type == "Artists")
                {
                    DataList1.DataSourceID = null;
                    DataList1.DataSource = SqlDataSource4;
                    DataList1.DataBind();
                }

            }

        }
        protected string Limit(object desc, int maxLength)
        {
            var description = (string)desc;
            if (string.IsNullOrEmpty(description)) { return description; }
            return description.Length <= maxLength ?
                description : description.Substring(0, maxLength) + "...";
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
            string username = loginUser();
            HttpCookie myCookie = new HttpCookie("username");
            myCookie.Value = username;
            myCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(myCookie);

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string type = UserType();

            if (type == "Artists")
            {
                if (e.CommandName == "ViewDetails")
                {
                    Response.Redirect("ViewStockDetails.aspx?id= " + e.CommandArgument.ToString());

                }
            }
            else
            {
                if (e.CommandName == "ViewDetails")
                {
                    Response.Redirect("ViewDetails.aspx?id= " + e.CommandArgument.ToString());

                }
            }
        }


        protected void btnItemDetail_Click(object sender, EventArgs e)
        {

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
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataList1.Visible = true;
            string type = UserType();
            if (type == "Customer")
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource1;
                DataList1.DataBind();
            }
            else if (type == "Artists")
            {
                DataList1.DataSourceID = null;
                DataList1.DataSource = SqlDataSource4;
                DataList1.DataBind();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}
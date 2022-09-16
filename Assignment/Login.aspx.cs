using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace Web_app_practical_1
{
    public partial class Practical_1_testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected String userType()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string checkUser = "SELECT * FROM [user] WHERE User_Username = @userName AND User_Password = @userPassword AND User_Type = @usertype";

            SqlCommand sql = new SqlCommand(checkUser, con);
            sql.Parameters.AddWithValue("@userName", login_name.Text);
            sql.Parameters.AddWithValue("@userPassword", login_password.Text);
            sql.Parameters.AddWithValue("@usertype", "Customer");

            SqlDataReader reader = sql.ExecuteReader();

            if (reader.HasRows)
            {
                con.Close();
                return "Customer";
            }

            con.Close();
            return "Artists";
        }

        protected Boolean check_User()
        {
            string name = login_name.Text;
            string password = login_password.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string checkUser = "SELECT * FROM [user] WHERE User_Username = @userName AND User_Password = @userPassword";

            SqlCommand signup = new SqlCommand(checkUser, con);
            signup.Parameters.AddWithValue("@userName", name);
            signup.Parameters.AddWithValue("@userPassword", password);

            SqlDataReader reader = signup.ExecuteReader();

            if (reader.HasRows)
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }

        public static Boolean validation(TextBox textBox, Literal literal, string type)
        {
            string tString = textBox.Text.Trim();

            if (textBox.Text.Contains(" ") == true)
            {
                literal.Text = "Data cannot have space";
                return false;
            }
            else if (textBox.Text.Length == 0)
            {
                literal.Text = "Data cannot be blank";
                return false;
            }
            else
            {
                literal.Text = "";
            }

            if (type == "phone")
            {
                if (tString.Length < 13 && tString.Length > 9)
                {
                    for (int i = 0; i < tString.Length; i++)
                    {
                        if (!char.IsNumber(tString[i]))
                        {
                            literal.Text = "This is a number only field";
                            return false;
                        }
                        else
                        {
                            literal.Text = "";
                        }
                    }
                }
                else
                {
                    literal.Text = "Can only have 10~12 digits";
                    return false;
                }
            }
            return true;
        }



        protected void login_button_Click(object sender, EventArgs e)
        {
            Boolean name = validation(login_name, login_name_errormessage, "name");
            Boolean password = validation(login_password, login_password_errormessage, "password");

            if (name == true && password == true)
            {
                if (check_User() == true)
                {
                    HttpCookie userInfo = new HttpCookie("userInfo");

                    string usertype = userType();
                    if (usertype == "Customer")
                    {
                        userInfo["UserType"] = "Customer";
                    }
                    else
                    {
                        userInfo["UserType"] = "Artists";
                    }
                    userInfo["UserName"] = login_name.Text;
                    userInfo.Expires.Add(new TimeSpan(0, 1, 0));
                    Response.Cookies.Add(userInfo);

                    if (usertype == "Customer")
                    {
                        Response.Redirect("~/Gallery.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/personalStock.aspx");
                    }
                }
                else
                {
                    login_errormessage.Text = "Incorrect Username and Password";
                }
            }
            else
            {
                login_errormessage.Text = "";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_app_practical_1
{
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                changePassword_errormessage.Text = "null";
                return User_name;
            }
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
                changePassword_errormessage.Text = "null";
                return User_type;
            }
        }

        protected Boolean check()
        {
            string User_name = loginUser();

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();

            string checkPassword = "SELECT * FROM [user] WHERE User_Username = @username AND User_Password = @oldPassword";
            SqlCommand passwordValidate = new SqlCommand(checkPassword, con);
            passwordValidate.Parameters.AddWithValue("@oldPassword", changePassword_oldPassword.Text);
            passwordValidate.Parameters.AddWithValue("@username", User_name);

            SqlDataReader reader = passwordValidate.ExecuteReader();
            if (reader.HasRows)
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }

        protected void updatePassword()
        {
            string User_name = loginUser();

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();

            string updatePassword = "UPDATE [user] SET User_Password=@password WHERE User_Username = @username";

            SqlCommand changePassword = new SqlCommand(updatePassword, con);

            changePassword.Parameters.AddWithValue("@username", User_name);
            changePassword.Parameters.AddWithValue("@password", changePassword_newPassword.Text);

            changePassword.ExecuteNonQuery();
            con.Close();
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

        protected void changePassword_confirmButton_Click(object sender, EventArgs e)
        {
            Boolean oldPassword = validation(changePassword_oldPassword, changePassword_oldPassword_errormessage, "oldPassword");
            Boolean newPassword = validation(changePassword_newPassword, changePassword_newPassword_errormessage, "newPassword");
            Boolean confirmNewPassword = validation(changePassword_confirmNewPassword, changePassword_confirmNewPassword_errormessage, "password");

            if (oldPassword == true && newPassword == true & confirmNewPassword == true)
            {
                if (check() == true)
                {
                    if (changePassword_newPassword.Text != changePassword_confirmNewPassword.Text)
                    {
                        changePassword_errormessage.Text = "New password must same with confirm new password";
                    }
                    else
                    {
                        updatePassword();
                        Response.Redirect("~/User Profile.aspx");
                    }
                }
                else
                {
                    changePassword_errormessage.Text = "Please keyin the correct old password";
                }
            }
            else
            {
                changePassword_errormessage.Text = "";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Web_app_practical_1
{
    public partial class Sign_Up : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void AddData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "INSERT INTO [user] " +
                         "(User_Username, User_Password, User_Name, User_Email, User_PhoneNumber, User_Gender, User_Date, User_Address, User_Postcode, User_State, User_Image, User_Type) " +
                         "VALUES (@userName,@password,@name,@email,@phoneNumber,@gender,@date,@address,@postcode,@state,@image,@type)";

            SqlCommand signup = new SqlCommand(sql, con);
            signup.Parameters.AddWithValue("@userName", signup_name.Text);
            signup.Parameters.AddWithValue("@password", signup_password.Text);
            signup.Parameters.AddWithValue("@phoneNumber", signup_phone.Text);
            signup.Parameters.AddWithValue("@type", signup_type.SelectedValue);
            signup.Parameters.AddWithValue("@email", signup_email.Text);

            signup.Parameters.AddWithValue("@name", "");
            signup.Parameters.AddWithValue("@gender", "");
            signup.Parameters.AddWithValue("@date", "");
            signup.Parameters.AddWithValue("@address", "");
            signup.Parameters.AddWithValue("@postcode", "");
            signup.Parameters.AddWithValue("@state", "");
            signup.Parameters.AddWithValue("@image", "~/Images/" + @"default.jpg");

            signup.ExecuteNonQuery();
            con.Close();
        }

        private Boolean validation(TextBox textBox, Literal literal)
        {
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
                return true;
            }
        }

        protected void signup_button_Click(object sender, EventArgs e)
        {
            Boolean name = validation(signup_name, signup_name_errormessage);
            Boolean phone = validation(signup_phone, signup_phone_errormessage);
            Boolean password = validation(signup_password, signup_passowrd_errormessage);
            Boolean confirmPassword = validation(signup_confirmPassword, signup_confirmPassword_errormessage);
            Boolean email = validation(signup_email, signup_email_errormessage);
            Boolean type = true;
            Boolean foundName = false;
            Boolean foundPhone = false;
            Boolean foundEmail = false;

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            //check same name
            con.Open();
            string checkUserName = "SELECT * FROM [user] WHERE User_Username = @userName";
            SqlCommand sqlname = new SqlCommand(checkUserName, con);
            sqlname.Parameters.AddWithValue("@userName", signup_name.Text);

            SqlDataReader readerName = sqlname.ExecuteReader();
            if (readerName.HasRows)
            {
                foundName = true;
            }
            con.Close();

            //check same phone
            con.Open();
            string checkUserPhone = "SELECT * FROM [user] WHERE User_PhoneNumber = @userPhone";
            SqlCommand sqlphone = new SqlCommand(checkUserPhone, con);
            sqlphone.Parameters.AddWithValue("@userPhone", signup_phone.Text);
            SqlDataReader readerPhone = sqlphone.ExecuteReader();
            if (readerPhone.HasRows)
            {
                foundPhone = true;
            }
            con.Close();

            //check same email
            con.Open();
            string checkUserEmail = "SELECT * FROM [user] WHERE User_Email = @userEmail";
            SqlCommand sqlemail = new SqlCommand(checkUserEmail, con);
            sqlemail.Parameters.AddWithValue("@userEmail", signup_email.Text);
            SqlDataReader readerEmail = sqlemail.ExecuteReader();
            if (readerEmail.HasRows)
            {
                foundEmail = true;
            }
            con.Close();

            if (signup_type.SelectedIndex != 0 && signup_type.SelectedIndex != 1)
            {
                signup_type_errormessage.Text = "Choose you want sign up as what type of user";
                type = false;
            }
            else
            {
                signup_type_errormessage.Text = "";
            }

            if (foundName == true)
            {
                signup_name_errormessage.Text = "Username has been used, please change the Username";
            }
            else if (foundPhone == true)
            {
                signup_phone_errormessage.Text = "Phone Number has been used, please change the Phone Number";
            }
            else if (foundEmail == true)
            {
                signup_email_errormessage.Text = "Email has been used, please change the Email";
            }
            else
            {
                if (name == true && phone == true && password == true && confirmPassword == true && type == true)
                {
                    if (email == true)
                    {
                        if (signup_password.Text == signup_confirmPassword.Text)
                        {
                            AddData();
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            signup_errormessage.Text = "Password must same with confirm password";
                        }
                    }
                }
                else
                {
                    signup_errormessage.Text = "";
                }
            }
        }
    }
}
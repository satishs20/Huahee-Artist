using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_app_practical_1
{
    public partial class User_Profile : System.Web.UI.Page
    {
        string url1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            img01.Attributes["onchange"] = "UploadFile(this)";

            if (!this.IsPostBack)
            {
                string name = loginUser();
                string type = UserType();

                string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                string userprofile = "SELECT * FROM [user] WHERE User_Username = @username";

                SqlCommand userdata = new SqlCommand(userprofile, con);
                userdata.Parameters.AddWithValue("@username", name);

                using (SqlDataReader sdr = userdata.ExecuteReader())
                {
                    sdr.Read();
                    userProfile_username.Text = sdr["User_Username"].ToString();
                    userProfile_name.Text = sdr["User_Name"].ToString();
                    userProfile_email.Text = sdr["User_Email"].ToString();
                    userProfile_phoneNumber.Text = sdr["User_PhoneNumber"].ToString();
                    userProfile_date.Text = sdr["User_Date"].ToString();
                    userProfile_address.Text = sdr["User_Address"].ToString();
                    userProfile_postcode.Text = sdr["User_Postcode"].ToString();
                    userProfile_state.Text = sdr["User_State"].ToString();
                    userProfile_image.ImageUrl = sdr["User_Image"].ToString();
                    userProfile_gender.SelectedValue = sdr["User_Gender"].ToString();
                    userProfile_type.Text = sdr["User_Type"].ToString();
                }
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            if (img01.HasFile)
            {
                img01.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img01.FileName)));
                FileInfo fileInfo = new FileInfo(img01.PostedFile.FileName);

                userProfile_image.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name1"] = userProfile_image.ImageUrl;
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

        private Boolean validation(TextBox textBox, Literal literal, string type)
        {
            string tString = textBox.Text.Trim();

            if (textBox.Text.Contains(" ") == true)
            {
                literal.Text = "Data cannot have space";
                return false;
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
            literal.Text = "";
            return true;
        }

        protected void updateData()
        {
            string User_name = loginUser();

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();

            string updatePassword = "UPDATE [user] SET User_Name=@name, User_Email=@email, User_PhoneNumber=@phone, User_Gender=@gender, User_Date=@date, User_Address=@address, User_Postcode=@postcode, User_State=@state WHERE User_Username = @username";

            SqlCommand changePassword = new SqlCommand(updatePassword, con);

            changePassword.Parameters.AddWithValue("@username", User_name);
            changePassword.Parameters.AddWithValue("@name", userProfile_name.Text);
            changePassword.Parameters.AddWithValue("@email", userProfile_email.Text);
            changePassword.Parameters.AddWithValue("@phone", userProfile_phoneNumber.Text);
            changePassword.Parameters.AddWithValue("@gender", userProfile_gender.SelectedValue);
            changePassword.Parameters.AddWithValue("@date", userProfile_date.Text);
            changePassword.Parameters.AddWithValue("@address", userProfile_address.Text);
            changePassword.Parameters.AddWithValue("@postcode", userProfile_postcode.Text);
            changePassword.Parameters.AddWithValue("@state", userProfile_state.Text);

            changePassword.ExecuteNonQuery();
            con.Close();
        }

        protected void updateImage()
        {
            string User_name = loginUser();
            url1 = (string)ViewState["Name1"];

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);

            con.Open();

            string updatePhoto = "UPDATE [user] SET User_Image = @image WHERE User_Username = @username";

            SqlCommand changePhoto = new SqlCommand(updatePhoto, con);

            changePhoto.Parameters.AddWithValue("@username", User_name);
            changePhoto.Parameters.AddWithValue("@image", url1);


            changePhoto.ExecuteNonQuery();
            con.Close();
        }

        protected void artistProfile_saveButton_Click(object sender, EventArgs e)
        {
            Boolean email = validation(userProfile_email, userProfile_email_errormessage, "email");
            Boolean phone = validation(userProfile_phoneNumber, userProfile_phonenumber_errormessage, "phone");

            if(email == true && phone == true)
            {
                updateData();
                updateImage();
            }
        }
    }
}
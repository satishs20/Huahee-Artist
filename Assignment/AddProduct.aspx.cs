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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string url1 = null;
        string url2 = null;
        string url3 = null;
        string url4 = null;
        string url5 = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            string JQueryVer = "1.7.1";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-" + JQueryVer + ".min.js",
                DebugPath = "~/Scripts/jquery-" + JQueryVer + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });

            img01.Attributes["onchange"] = "UploadFile(this)";
            img02.Attributes["onchange"] = "UploadFile(this)";
            img03.Attributes["onchange"] = "UploadFile(this)";
            img04.Attributes["onchange"] = "UploadFile(this)";
            img05.Attributes["onchange"] = "UploadFile(this)";

            url1 = (string)ViewState["Name1"];
            if (url1 != null || img01.HasFile == true)
            {
                upload.Visible = false;
            }
            if (!Page.IsPostBack)
            {
                ddlCategory.Items.Add(new ListItem("3D", "3D"));
                ddlCategory.Items.Add(new ListItem("Anime/Manga", "Anime/Manga"));
                ddlCategory.Items.Add(new ListItem("Anthro", "Anthro"));
                ddlCategory.Items.Add(new ListItem("Pixel Art", "PixelArt"));
                ddlCategory.Items.Add(new ListItem("Fantasy", "Fantasy"));
                ddlCategory.Items.Add(new ListItem("Fractal", "Fractal"));
                ddlCategory.Items.Add(new ListItem("Game Art", "GameArt"));
                ddlCategory.Items.Add(new ListItem("Horror", "Horror"));
                ddlCategory.Items.Add(new ListItem("Photography", "Photography"));
                ddlCategory.Items.Add(new ListItem("Street Art", "Street Art"));



                pictureBox1.ImageUrl = "~/Images/" + @"default.jpg";
                pictureBox2.ImageUrl = "~/Images/" + @"default.jpg";
                pictureBox3.ImageUrl = "~/Images/" + @"default.jpg";
                pictureBox4.ImageUrl = "~/Images/" + @"default.jpg";
                pictureBox5.ImageUrl = "~/Images/" + @"default.jpg";

                


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



            if (img01.HasFile)
            {

                img01.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img01.FileName)));
                FileInfo fileInfo = new FileInfo(img01.PostedFile.FileName);


                pictureBox1.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name1"] = pictureBox1.ImageUrl;
            }




            if (img02.HasFile)
            {


                img02.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img02.PostedFile.FileName)));
                FileInfo fileInfo = new FileInfo(img02.PostedFile.FileName);


                pictureBox2.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name2"] = pictureBox2.ImageUrl;

            }

            if (img03.HasFile)
            {
                img03.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img03.FileName)));
                FileInfo fileInfo = new FileInfo(img03.PostedFile.FileName);


                pictureBox3.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name3"] = pictureBox3.ImageUrl;
            }

            if (img04.HasFile)
            {
                img04.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img04.FileName)));
                FileInfo fileInfo = new FileInfo(img04.PostedFile.FileName);


                pictureBox4.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name4"] = pictureBox4.ImageUrl;
            }

            if (img05.HasFile)
            {
                img05.SaveAs(Server.MapPath("~/Images/" + Path.GetFileName(img05.FileName)));
                FileInfo fileInfo = new FileInfo(img05.PostedFile.FileName);


                pictureBox5.ImageUrl = "~/Images/" + fileInfo.Name;
                ViewState["Name5"] = pictureBox5.ImageUrl;
            }




        }

        private void addData()
        {

            string username = loginUser();
            url1 = (string)ViewState["Name1"];
            url2 = (string)ViewState["Name2"];
            url3 = (string)ViewState["Name3"];
            url4 = (string)ViewState["Name4"];
            url5 = (string)ViewState["Name5"];



            if (url2 == null)
                url2 = pictureBox2.ImageUrl = "~/Images/" + @"default.jpg";

            if (url3 == null)
                url3 = pictureBox2.ImageUrl = "~/Images/" + @"default.jpg";

            if (url4 == null)
                url4 = pictureBox2.ImageUrl = "~/Images/" + @"default.jpg";

            if (url5 == null)
                url5 = pictureBox2.ImageUrl = "~/Images/" + @"default.jpg";
            if (url1 != null || img01.HasFile == true)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string SavePath = Server.MapPath("~/Images/");

                // Getting image name.
                string fileName = Path.GetFileNameWithoutExtension(img05.PostedFile.FileName);

                // Getting image extension
                string extension = Path.GetExtension(img05.PostedFile.FileName);



                string sql = "INSERT INTO product" +
                             "(User_Username,Name, Size, Price, Description, Category, Date, CoverPhoto, Image1, Image2, Image3, Image4,Quantity  ) " +
                             "VALUES (@user_name,@name,@size,@price,@description,@category,@date,@coverphoto,@image1,@image2,@image3,@image4,@quantity)";


                int quantity = Int32.Parse(txtQuantity.Text);
                SqlCommand cmd1 = new SqlCommand(sql, con);
                cmd1.Parameters.AddWithValue("@name", txtName.Text);
                cmd1.Parameters.AddWithValue("@user_name", username);
                cmd1.Parameters.AddWithValue("@size", txtSize.Text);
                cmd1.Parameters.AddWithValue("@price", txtPrice.Text);
                cmd1.Parameters.AddWithValue("@description", txtDesc.Text);
                cmd1.Parameters.AddWithValue("@category", ddlCategory.SelectedItem.Text);
                cmd1.Parameters.AddWithValue("@date", txtDate.Text);
                cmd1.Parameters.AddWithValue("@coverphoto", url1);
                cmd1.Parameters.AddWithValue("@image1", url2);
                cmd1.Parameters.AddWithValue("@image2", url3);
                cmd1.Parameters.AddWithValue("@image3", url4);
                cmd1.Parameters.AddWithValue("@image4", url4);
                cmd1.Parameters.AddWithValue("@quantity", quantity);
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("personalStock.aspx");
                upload.Visible = false;
            }

            else
            {
                upload.Visible = true;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            addData();
          
                


        }








        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnM_Click(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            url1 = (string)ViewState["Name1"];
            if (url1 == null)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;

        }
    }
}
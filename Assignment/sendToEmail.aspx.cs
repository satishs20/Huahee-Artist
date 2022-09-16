using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class sendToEmail : System.Web.UI.Page
    {
        string mainconn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(mainconn))
            {
                String username = loginUser();
                con.Open();
                string sql = "SELECT Pname,Size,Price,Category,Date,Quantity FROM cart WHERE Cuser = '" + username + "'";
                SqlDataAdapter sqlDa = new SqlDataAdapter(sql, con);
                DataTable dtb1 = new DataTable();
                sqlDa.Fill(dtb1);
                sendPDFEmail(dtb1);
            }
        }

        private String getemail(String email)
        {
            return email;
        }

        private String getCardNumber(String cardNumber)
        {
            return cardNumber;
        }

        private void populateGrid()
        {

        }

        private void sendPDFEmail(DataTable dtb1)
        {
            using (StringWriter sw = new StringWriter())
            {
                String email = Session["email"].ToString();
                String cardNumber = Session["cardNumber"].ToString();
                String name = loginUser();
                String total = Session["total"].ToString();

                string companyName = "HuaheeArtist";
                Random rnd = new Random();
                int finalNumber = rnd.Next();
                String orderid = "C" + finalNumber;
                StringBuilder sb = new StringBuilder();
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                sb.Append("<tr><td align='center' style='background-color: #17B1F0' colspan = '2'><b>Order Receipt</b></td></tr>");
                sb.Append("<tr><td colspan = '2'></td></tr>");
                sb.Append("<tr><td><b>Name: </b>");
                sb.Append(name);
                sb.Append("<tr><td><b>Order No: </b>");
                sb.Append(orderid);
                sb.Append("<tr><td><b>Total Amount: </b>");
                sb.Append(total);
                sb.Append("<tr><td><b>Card No: </b>");
                sb.Append(cardNumber);
                sb.Append("</td><td><b>Date: </b>");
                sb.Append(DateTime.Now);
                sb.Append(" </td></tr>");
                sb.Append("<tr><td colspan = '2'><b>Company Name :</b> ");
                sb.Append(companyName);
                sb.Append("</td></tr>");
                sb.Append("</table>");
                sb.Append("<br />");
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dtb1.Columns)
                {
                    sb.Append("<th style = 'background-color: #D24B2C;color:#ffffff'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dtb1.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dtb1.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
                sb.Append("</table>");
                StringReader sr = new StringReader(sb.ToString());

                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();

                    MailMessage mm = new MailMessage("huaheeOffice@gmail.com", email);
                    mm.Subject = "Your Payment Receipt from HuaheeArtist !!";
                    mm.Body = "Thank For support!";
                    mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "ReceiptPDF.pdf"));
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential("huaheeOffice@gmail.com", "tyweswpnfmvvorrk");
                    smtp.EnableSsl = true;
                    smtp.Send(mm);

                    string mainconn = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                    SqlConnection con = new SqlConnection(mainconn);
                    con.Open();
                    string sql = "INSERT INTO history" + "(PayId,Cuser,Pname,Size,Price,Description,Category,Date,CoverPhoto,Quantity)" +
                                "SELECT CartId,Cuser,Pname,Size,Price,Description,Category,Date,CoverPhoto,Quantity FROM cart WHERE Cuser = '" + name + "'";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    string maincon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(maincon);
                    conn.Open();
                    string sql2 = "DELETE FROM cart WHERE Cuser = '" + name + "'";

                    SqlCommand cmd2 = new SqlCommand(sql2, conn);

                    cmd2.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("finishPayment.aspx");
                }
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

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}
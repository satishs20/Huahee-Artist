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
    public partial class ViewStockDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


            }


        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void btnP_Click(object sender, EventArgs e)
        {

        }

        protected void btnM_Click(object sender, EventArgs e)
        {

        }

        protected void delete(object source, DataListCommandEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string id = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("Label15")).Text;

            string s = "delete from product where ProductId=" + id;
            SqlCommand cmd = new SqlCommand(s, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("personalStock.aspx");
        }

        protected void edit(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;

        }

        protected void update(object source, DataListCommandEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string id = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("Label15")).Text;

            string price = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtPrice")).Text;
            string quant = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtQuantity")).Text;

            System.Web.UI.WebControls.Label lblPrice = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblPrice"));
            System.Web.UI.WebControls.Label lblQty = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblQty"));
            System.Web.UI.WebControls.Label lblDesc = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblDesc"));
            System.Web.UI.WebControls.Label lblCategory = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblCategory"));
            System.Web.UI.WebControls.Label lblDate = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblDate"));
            System.Web.UI.WebControls.Label lblSize = ((System.Web.UI.WebControls.Label)DataList1.Items[e.Item.ItemIndex].FindControl("lblSize"));

            string size = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtSize")).Text;
            string date = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtDate")).Text;
            string category = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtCategory")).Text;
            string description = ((System.Web.UI.WebControls.TextBox)DataList1.Items[e.Item.ItemIndex].FindControl("txtDesc")).Text;

            /*string url1 = ((System.Web.UI.WebControls.FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("img01")).FileName; 
            string url2 = ((System.Web.UI.WebControls.FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("img02")).FileName;
            string url3 = ((System.Web.UI.WebControls.FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("img03")).FileName; 
            string url4 = ((System.Web.UI.WebControls.FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("img04")).FileName;
            string url5 = ((System.Web.UI.WebControls.FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("img05")).FileName; */

            if (price != "" && quant != "" && size != "" && date != "" && category != "" && description != "")
            {

                string s = "update product set  Size= '" + size + "', Price= '" + price + "', Description= '" + description + "'," +
                           "Category= '" + category + "', Date= '" + date + "'," +
                           "Quantity= '" + quant + "' where  ProductId=" + id;
                SqlCommand cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("personalStock.aspx");
            }
            else
            {
                if (price == "")
                    lblPrice.Visible = true;

                if (date == "")
                    lblDate.Visible = true;
                if (quant == "")
                    lblQty.Visible = true;
                if (size == "")
                    lblSize.Visible = true;
                if (category == "")
                    lblCategory.Visible = true;
                if (description == "")
                    lblDesc.Visible = true;
            }



        }

        protected void cancel(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.UserControl
{
    public partial class Time : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showtime.Text = DateTime.Now.ToLongDateString();
        }
    }
}
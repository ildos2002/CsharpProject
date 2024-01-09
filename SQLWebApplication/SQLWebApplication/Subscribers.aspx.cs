using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQLWebApplication
{
    public partial class Subscribers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            SqlDataSourceSubscribers.Insert();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fil = TextBox5.Text;
            SqlDataSourceSubscribers.SelectCommand = "SELECT * FROM dbtables.subscribers WHERE (phone_number LIKE '%" + fil + "%')";
            GridView1.Visible = true;
            GridView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSourceSubscribers.SelectCommand = "SELECT * FROM dbtables.subscribers";

        }

    }
}
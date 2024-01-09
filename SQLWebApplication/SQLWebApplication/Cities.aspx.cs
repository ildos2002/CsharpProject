using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQLWebApplication
{
    public partial class Cities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            SqlDataSourceCities.Insert();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fil = TextBox5.Text;
            SqlDataSourceCities.SelectCommand = "SELECT * FROM dbtables.city WHERE (name LIKE '%" + fil + "%')";
            GridView1.Visible = true;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSourceCities.SelectCommand = "SELECT kod_city, name, tarifd, tarifn FROM dbtables.city";
        }
    }
}
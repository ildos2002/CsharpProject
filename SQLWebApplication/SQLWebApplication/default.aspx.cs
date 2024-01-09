using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using Npgsql;

namespace SQLWebApplication
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Создать объект подключения
            string connectionString = ConfigurationManager.ConnectionStrings["PhoneConversationConnectionString"].ConnectionString;
            NpgsqlConnection connection = new NpgsqlConnection(connectionString);
            using (connection)
            {
                // Открыть подключение
                connection.Open();
                Label1.Text = "<b>Версия сервера: </b>" + connection.ServerVersion;
                Label1.Text += "<br /><b>Состояние подключения: </b> " + connection.State.ToString();
            }

            Label1.Text += "<br /><b>Состояние подключения после using: </b> " + connection.State.ToString();
            Label1.Visible = true;
        }
    }
}
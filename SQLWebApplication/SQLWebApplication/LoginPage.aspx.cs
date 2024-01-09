using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Configuration;


namespace SQLWebApplication
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Unload(object sender, EventArgs e)
        {
            connection.cn.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            connection.cn.Open();
        }

        protected void ButtonConnection_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM dbtables.users WHERE user_name = @username AND user_pass = @password", connection.cn);

            // Здесь следует прикрепить параметры к команде
            cmd.Parameters.AddWithValue("username", TextBoxUsername.Text);
            cmd.Parameters.AddWithValue("password", TextBoxPassword.Text);

            // Теперь установим эту команду в статическое поле cmd класса connection, чтобы она могла быть использована в других частях приложения
            connection.cmd = cmd;

            // Мы убираем использование connection.dr
            NpgsqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                // Если есть строки в результирующем наборе, явно задаем значение "login" для переменной сеанса
                Session["login"] = TextBoxUsername.Text;
                dr.Close();
                Response.Redirect("Conversations.aspx");
            }
            else
            {
                dr.Close();
                Response.Write("Вход не корректен");
            }
        }
    }
}
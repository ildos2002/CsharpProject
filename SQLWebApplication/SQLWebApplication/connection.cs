using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;

namespace SQLWebApplication
{
    public class connection
    {
        //Driver={Devart ODBC Driver for PostgreSQL }; server=127.0.0.1;port=5433;database=PhoneConversations;uid=postgres;pwd=Qwerty2002!
        //Host=127.0.0.1;Username=postgres;Password=Qwerty2002;Database=PhoneConversations
        public static NpgsqlConnection cn = new NpgsqlConnection("server=127.0.0.1;port=5433;database=PhoneConversations;uid=postgres;pwd=Qwerty2002!");
        public static NpgsqlCommand cmd = new NpgsqlCommand();
        public static NpgsqlDataReader dr;
    }
}
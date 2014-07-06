using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//aşağıdaki kütüphaneler sql bağlantısı ve veri çekme işlemleri için kullanılır
using System.Data.SqlClient;
using System.Data;


namespace ProjectTemplateSln.DAL
{
    public class DBConnection
    {
        public SqlConnection BaglantiAl()
        {
            SqlConnection baglanti = new SqlConnection();
            baglanti.ConnectionString = "Data Source = localhost\\SQLEXPRESS; Initial Catalog = GorevTakipSistemi;User ID=sa; Password=123; Trusted_Connection = false";
            //baglanti.ConnectionString = "Data Source = localhost; Initial Catalog = TaskManagementSystemDB; Trusted_Connection = true;User ID=ceng292; Password=ceng292";
            baglanti.Open();

            return baglanti;
        }
    }
}
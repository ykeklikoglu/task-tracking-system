using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace Görev_Takip_sistemim.Fonksiyonlar
{
    public class Baglantıİsleri
    {
        public SqlConnection BaglantiAl()
        {
            SqlConnection baglanti = new SqlConnection();
            baglanti.ConnectionString = "Data Source = Keklikoğlu-PC; Initial Catalog = Görev Takip Sistemi;User ID=sa; Password=123; Trusted_Connection = false";
            baglanti.Open();

            return baglanti;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class PersonelAlımı : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Tamam_Click(object sender, EventArgs e)
        {
            if (TextBox_AdGir.Text.Length == 0 || TextBox_SoyadGir.Text.Length == 0)
            {
                Label3.Visible = true;
                return;
            }
            Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri bag = new Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri();
            SqlConnection baglanti = bag.BaglantiAl();
            if(Convert.ToInt16( DropDownList_personeltipi.SelectedValue)==0)
                baglanti = Personel(bag, baglanti);
            else if (Convert.ToInt16(DropDownList_personeltipi.SelectedValue) == -1)
            {
                Label_Personeltipi.Visible = true;
                return;
            }
            else 
            {

                baglanti = Admin(bag, baglanti);

            }
            baglanti.Close();
            Label2.Visible = true;
            Button_Tamam.Visible = false;
            Label_islemtamam.Visible = true;
        }

        private SqlConnection Admin(Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri bag, SqlConnection baglanti)
        {
            #region
            string query = @"INSERT INTO Personeller(Ad,Soyad,AdminMi) VALUES (@Adım,@Soyadım,1)";
            SqlParameter Adımparm = new SqlParameter("@Adım", SqlDbType.VarChar);
            //SqlParameter sifreParm = new SqlParameter("@Sifre", SqlDbType.VarChar);
            Adımparm.Value = TextBox_AdGir.Text;
            SqlParameter Soyadparm = new SqlParameter("@Soyadım", SqlDbType.VarChar);
            Soyadparm.Value = TextBox_SoyadGir.Text;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(Adımparm);
            komut.Parameters.Add(Soyadparm);
            komut.ExecuteReader();
            baglanti.Close();
            baglanti = bag.BaglantiAl();
            query = "SELECT ID FROM Personeller where Ad = @Adım and Soyad = @Soyadım and AdminMi=1";
            Adımparm = new SqlParameter("@Adım", SqlDbType.VarChar);
            Adımparm.Value = TextBox_AdGir.Text;
            Soyadparm = new SqlParameter("@Soyadım", SqlDbType.VarChar);
            Soyadparm.Value = TextBox_SoyadGir.Text;
            SqlCommand komut2 = baglanti.CreateCommand();
            komut2.CommandText = query;
            komut2.Parameters.Add(Adımparm);
            komut2.Parameters.Add(Soyadparm);
            SqlDataReader reader = komut2.ExecuteReader();
            if (reader.Read())//unutma beni
                Label_ShowID.Text = reader["ID"].ToString();
            Label_ShowID.Visible = true;
            return baglanti;
            #endregion
        }

        private SqlConnection Personel(Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri bag, SqlConnection baglanti)
        {
            #region SQL komut hazırlama bölümü query=@"INSERT INTO Personeller(Ad,Soyad) VALUES (@Adım,@Soyadım)"  +  "SELECT ID FROM Personeller where Ad = @Adım and Soyad = @Soyadım  "
            string query = @"INSERT INTO Personeller(Ad,Soyad) VALUES (@Adım,@Soyadım)";
            SqlParameter Adımparm = new SqlParameter("@Adım", SqlDbType.VarChar);
            //SqlParameter sifreParm = new SqlParameter("@Sifre", SqlDbType.VarChar);
            Adımparm.Value = TextBox_AdGir.Text;
            SqlParameter Soyadparm = new SqlParameter("@Soyadım", SqlDbType.VarChar);
            Soyadparm.Value = TextBox_SoyadGir.Text;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(Adımparm);
            komut.Parameters.Add(Soyadparm);
            komut.ExecuteReader();
            baglanti.Close();
            baglanti = bag.BaglantiAl();
            query = "SELECT ID FROM Personeller where Ad = @Adım and Soyad = @Soyadım ";
            Adımparm = new SqlParameter("@Adım", SqlDbType.VarChar);
            Adımparm.Value = TextBox_AdGir.Text;
            Soyadparm = new SqlParameter("@Soyadım", SqlDbType.VarChar);
            Soyadparm.Value = TextBox_SoyadGir.Text;
            SqlCommand komut2 = baglanti.CreateCommand();
            komut2.CommandText = query;
            komut2.Parameters.Add(Adımparm);
            komut2.Parameters.Add(Soyadparm);
            SqlDataReader reader = komut2.ExecuteReader();
            if (reader.Read())
                Label_ShowID.Text = reader["ID"].ToString();
            Label_ShowID.Visible = true;

            #endregion
            return baglanti;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
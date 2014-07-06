using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class GörevDetayı : System.Web.UI.Page
    {
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        static public Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri bag = new Görev_Takip_sistemim.Fonksiyonlar.Baglantıİsleri();
        List<Model.Personel> elemanlar = new List<Model.Personel>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            if (!IsPostBack)
            {
                elemanlar = pServisi.TumPersoneliGetir();
                for (int i = 0; i < elemanlar.Count; i++)
                {
                    DropDownList_KisiListelemeDevret.Items.Add(elemanlar.ElementAt(i).Ad + " " + elemanlar.ElementAt(i).Soyad);
                }
                Label_GörevNo.Text = Session["GörevID"].ToString();
            }
        }

        private void YeniGörevdoldur(Model.Personel Myinf, SqlConnection baglanti, Model.ErtelenenGörevler yenigörev)
        {
            string query = "SELECT * FROM Görevler WHERE GörevId=@str";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter GörevID = new SqlParameter("@str", SqlDbType.Int);
            GörevID.Value = Convert.ToInt16(Label_GörevNo.Text);
            komut.Parameters.Add(GörevID);
            komut.ExecuteScalar();
            SqlDataReader reader = komut.ExecuteReader();

            while (reader.Read())
            {
                yenigörev.GörevId = Convert.ToInt16(reader["GörevId"]);
                yenigörev.Baslık = reader["Baslık"].ToString();
                yenigörev.BeklenenBitisTarihi = reader["BeklenenBitisTarihi"].ToString(); ;
                yenigörev.GörevlendirilenPersonel = Myinf.ID;
                yenigörev.GörevlendirilenPersonelİsim = Myinf.Ad.ToString() + " " + Myinf.Soyad.ToString();
                yenigörev.Oncelik = reader["Oncelik"].ToString();
                yenigörev.TarafındanAcıldıID = Convert.ToInt16(reader["TarafındanAcıldıID"]);
                yenigörev.TarafındanAcıldıİsim = reader["TarafındanAcıldıİsim"].ToString();
                yenigörev.Verilistarihi = reader["VerilisTarihi"].ToString();
                yenigörev.Yorum = reader["Yorum"].ToString();
            }
            baglanti.Close();

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Panel_İnceAyar.Visible = true;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {

            Model.Personel Myinf = (Model.Personel)Session["LoginOlanKisi"];
            Model.ErtelenenGörevler egörev = new Model.ErtelenenGörevler();
            pServisi.KabulEdilenGörevlereEkle(Convert.ToInt16( Label_GörevNo.Text));
            pServisi.GörevDurumuGüncelle("Görevler", "Kabul Edildi", Convert.ToInt32(Label_GörevNo.Text), 0);
            Label_ertelemeNotu.Text = "Görev Kabul Edildi!";
         
            Label_ertelemeNotu.Visible = true;
            Panel_işlemYapmaBilgileri.Visible = false;
            Button1.Visible = false;
            Button8.Visible = false;
            Button12.Visible = false;
            Button9.Visible = false;
            Button11.Visible = false;
               
        }

        protected void Button_Erteleme_onayla0_Click(object sender, EventArgs e)
        {
            Panel_ErtelemeBilgileri.Visible = true;
            if (TextBox_erteleme.Text.Length == 0) { Label_ertelemeNotu.Text = "Lütfen Erteleme Sebebinizi Giriniz."; Label_ertelemeNotu.Visible = true; return; }
            Model.Personel Myinf = (Model.Personel)Session["LoginOlanKisi"];
            SqlConnection baglanti = bag.BaglantiAl();
            Model.ErtelenenGörevler egörev = new Model.ErtelenenGörevler();
            YeniGörevdoldur(Myinf, baglanti, egörev);
            baglanti.Open();
            string query = @"INSERT INTO ErtelenenGörevler
(
ErtelemeTarihi,
ErtelenenTarih,
ErtelemeNedeni,
GörevId,
Yorum,
BeklenenBitisTarihi,
Verilistarihi,
TarafındanAcıldıID,
TarafındanAcıldıİsim,
Oncelik,
Baslık,
GörevlendirilenPersonel
) VALUES (
@ErtelemeTarihi,
@ErtelenenTarih,
@ErtelemeNedeni,
@GörevId,
@Yorum,
@BeklenenBitisTarihi,
@Verilistarihi,
@TarafındanAcıldıID,
@TarafındanAcıldıİsim,
@Oncelik,
@Baslık,
@GörevlendirilenPersonel
)";
            #region IVIRZIVIRI
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@TarafındanAcıldıİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = egörev.TarafındanAcıldıİsim.ToString();
            SqlParameter ErtelemeTarihi = new SqlParameter("@ErtelemeTarihi", SqlDbType.SmallDateTime);
            ErtelemeTarihi.Value = Calendar2.SelectedDate.ToShortDateString();
            SqlParameter ErtelenenTarih = new SqlParameter("@ErtelenenTarih", SqlDbType.SmallDateTime);
            ErtelenenTarih.Value = Calendar3.SelectedDate.ToShortDateString();
            SqlParameter ErtelemeNedeni = new SqlParameter("@ErtelemeNedeni", SqlDbType.Text);
            ErtelemeNedeni.Value = TextBox_erteleme.Text.ToString();
            SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = Convert.ToInt16(egörev.GörevId);
            SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = egörev.Yorum.ToString();
            SqlParameter TarafındanAcıldıID = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafındanAcıldıID.Value = egörev.TarafındanAcıldıID.ToString();
            SqlParameter Verilistarihi = new SqlParameter("@Verilistarihi", SqlDbType.SmallDateTime);
            Verilistarihi.Value = egörev.Verilistarihi.ToString();
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = egörev.BeklenenBitisTarihi.ToString();
            SqlParameter Oncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            Oncelik.Value = egörev.Oncelik;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = egörev.Baslık;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = Convert.ToInt16(egörev.GörevlendirilenPersonel);
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(ErtelemeTarihi);
            komut.Parameters.Add(ErtelenenTarih);
            komut.Parameters.Add(ErtelemeNedeni);
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(BeklenenBitisTarihi);
            komut.Parameters.Add(Verilistarihi);
            komut.Parameters.Add(Oncelik);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(GörevlendirilenPersonel);
            #endregion

            komut.ExecuteReader();
            baglanti.Close();
            pServisi.GörevDurumuGüncelle("Görevler", "Erteleme İsteginde", egörev.GörevId, 0);
            Label_ertelemeNotu.Text = "Görev Ertelenme İsteği İle Yöneticiye İletilmiştir";
            Label_ertelemeNotu.Visible = true;
            Button1.Visible = false;
            Button8.Visible = false;
            Panel_İnceAyar.Visible = false;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Panel_ErtelemeBilgileri.Visible = true;
            Panel_DevretBilgisi.Visible = false;
            Panel_ReddetBilgisi.Visible = false;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            
            pServisi.ReddedilenGörevlereEkle(Convert.ToInt16(Session["GörevID"]), TextBox_reddet.Text);
            pServisi.GörevDurumuGüncelle("Görevler", "Reddedildi", Convert.ToInt16(Session["GörevID"]), 0);
            Panel_ErtelemeBilgileri.Visible = false;
            Panel_DevretBilgisi.Visible = false;
            Panel_ReddetBilgisi.Visible = true;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Panel_DevretBilgisi.Visible = false;//true olmalı görünmesi için
            Panel_ErtelemeBilgileri.Visible = false;
            Panel_ReddetBilgisi.Visible = false;
        }

        protected void Button_reddetin_onayla_Click(object sender, EventArgs e)
        {
            Panel_İnceAyar.Visible = false;
            if (TextBox_reddet.Text.Length < 1) 
            {
                Label_ertelemeNotu.Text = "Lütfen Reddetme Sebebini Giriniz.";
                Label_ertelemeNotu.Visible = true;
                return;
            }
            int ID = Convert.ToInt32(Session["GörevID"]);
            pServisi.GörevDurumuGüncelle("Görevler", "Reddedildi", ID, 0);
            Label_ertelemeNotu.Text = pServisi.ReddedilenGörevlereEkle(ID,TextBox_reddet.ToString());
            Label_ertelemeNotu.Visible = true;
            Button1.Visible = false;
            Button8.Visible = false;
            Panel_İnceAyar.Visible = false;
            Label_ertelemeNotu.Visible = false;
        }

        /*Button Parçala Onayla*/protected void Button_devret_onayla0_Click(object sender, EventArgs e)
        {
            elemanlar = pServisi.TumPersoneliGetir();
            pServisi.ParçalananGörevlereEkle(Convert.ToInt16(Session["ID"]), elemanlar.ElementAt(DropDownList_KisiListelemeDevret.SelectedIndex - 1).ID, "Baslık Yok", TextBox_devret.Text, "03.03.12",Convert.ToInt32(Session["GörevID"]));

            Button1.Visible = false;
            Button8.Visible = false;
            Panel_İnceAyar.Visible = false;
        }


    }
}
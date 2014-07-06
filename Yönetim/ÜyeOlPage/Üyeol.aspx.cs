using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim
{
    public partial class Üyeol : System.Web.UI.Page
    {//global ögeler.
        public static Model.Personel YeniKullanici = new Model.Personel();
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label_eksikbilgi.Visible = false;
            Label1_kayıtbilgisi.Text = "Sistemde Verilen bilgide kimse yok, iş vereninizle görüşün.";
            Label1_kayıtbilgisi.Visible = false;
            Label_eksikbilgi.Text = "Lütfen bilgileri eksiksiz giriniz.";
        }

        protected void Button_Onayla_Click(object sender, EventArgs e)
        {
            if (Textbox_ad0.Text.Length == 0 ||Textbox_mail0.Text.Length == 0
                ||Textbox_Id.Text.Length == 0 || 
                Textbox_soyad0.Text.Length == 0 || Textbox_Tcno0.Text.Length <11
               )//bos bırakılmasına izin vermiyorum
            {
                Label_eksikbilgi.Visible = true;
                return;
            }
            //Yeni kullanici bilgilerini toplama bölümü
            try
            {
                YeniKullanici.ID = Convert.ToInt16(Textbox_Id.Text);
                YeniKullanici.Ad = Textbox_ad0.Text;
                YeniKullanici.Soyad = Textbox_soyad0.Text;
                YeniKullanici.TcNo = Textbox_Tcno0.Text;
                YeniKullanici.Mail = Textbox_mail0.Text;
                YeniKullanici.Cinsiyet = RadioButton_cinsiyet.SelectedItem.Value;
                YeniKullanici.Evlilik = RadioButton_evlilik.SelectedItem.Value;
                YeniKullanici.DogumGunu = DropDownList_gün.SelectedValue + "." + DropDownList_ay.SelectedValue + "." + DropDownList_yıl.SelectedValue;
            }
            catch (Exception) { Label1_kayıtbilgisi.Text = "Bilgileri Doğru Giriniz"; Label1_kayıtbilgisi.Visible = true; return; }
            if (pServisi.LoginUygunMu(YeniKullanici))// işe yeni giren bir Calisan mi?(Yeni Kullanici'nin ID,Ad,Soyad,HesapAktifliğine Uygun mu(SQL)? uygunsa :1 degilse 0).
            {
                Panel1.Visible = true;
                Label1_kayıtbilgisi.Text="Sistemde Kaydınız Bulundu Kullanıcı Adı Ve Şifre giriniz.";
                Label1_kayıtbilgisi.Visible = true;
                Panel1.Visible = true;
                Button_Onayla.Visible = false;
            }
            else//Calisanimizmi fonksiyonu ikitürlü false return eder 1.sistemde o bilgide kimse yok 2.zatan bir üyedir yani hesapaktif: 1 dir.
                if(YeniKullanici.HesapAktif==1)
                    Label1_kayıtbilgisi.Text ="Sistemde zaten kayıtlısınız.";
            Label1_kayıtbilgisi.Visible = true;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButton_cinsiyet.AccessKey = RadioButton_cinsiyet.SelectedValue;
            RadioButton_evlilik.AccessKey = RadioButton_evlilik.SelectedValue;
        }

        protected void Button_Tamamla_Click(object sender, EventArgs e)
        {
            if(TextBoxSifre.Text!=TextBoxSifretekrar.Text || TextBoxSifre.Text.Length<4)
            {//Girilen iki sifre esit mi?esit degilse return eder.
                Label_sifrelemeHatası.Visible = true;
                return;
            }
            YeniKullanici.KullaniciAdi = TextBoxKullaniciAdi.Text;
            YeniKullanici.Sifre = TextBoxSifre.Text;
            Label_sifrelemeHatası.Text= pServisi.yeniKullaniciEkle(YeniKullanici);
            Label_sifrelemeHatası.Visible = true;
            Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx");
        }
        #region\\DropDownLists fonksiyonları
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        #endregion
    }
}
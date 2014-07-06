using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim
{
    public partial class LoginPage : System.Web.UI.Page
    {
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            Application["visit"] = Convert.ToInt16(Application["visit"]) + 1;
            Application.UnLock();
            Label_visits.Text = Convert.ToString(Application["visit"]);
            // Web service URL: http://www.webservicex.net/geoipservice.asmx

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBoxKullaniciAdi.Text.Length == 0 || TextBoxSifre.Text.Length < 4)
            {
                LabelSonuc.Text = "Kayıtlı Olamazsınız.";
                return;
            }
            Fonksiyonlar.BizPersonel pServisi = new Fonksiyonlar.BizPersonel();
            Model.Personel loginOlanPersonel = pServisi.Login(TextBoxKullaniciAdi.Text, TextBoxSifre.Text);
            if (loginOlanPersonel == null)
            {
                LabelSonuc.Text = "Kullanıcı adı veya Sifre yanlıs.\rTekrar Deneyin.";
                return;
            }
            else if (loginOlanPersonel.HesapAktif == 0) //!!!!!!!1eski kullanıcılar için veya işi donduran işçiler için bunu silebiliriz!!!!!!!.
            {
                LabelSonuc.Text = "Üye ol Linkini takip ederek Hesabınızı aktif ediniz.";
            }
            else if (pServisi.AdminMi(loginOlanPersonel))
            {
                Session["LoginOlanKisi"] = loginOlanPersonel;
                Session["ID"] = loginOlanPersonel.ID;
                //LabelSonuc.Text = "Merhabalar Sayın " + loginOlanPersonel.Ad + " " + loginOlanPersonel.Soyad;
                Response.Redirect("/Yönetim/AdminPage/AdminMasaüstüPage.aspx");
            }
            else
            {
                Session["LoginOlanKisi"] = loginOlanPersonel;
                Session["ID"] = loginOlanPersonel.ID;
                //LabelSonuc.Text = "Merhabalar " + loginOlanPersonel.Ad + " " + loginOlanPersonel.Soyad;
                Response.Redirect("/Yönetim/PersonalPage/Anasayfa.aspx");
            }
        }
    }
}
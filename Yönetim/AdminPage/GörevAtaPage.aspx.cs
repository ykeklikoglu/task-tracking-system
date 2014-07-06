using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class GörevAtaPage : System.Web.UI.Page
    {
        //public static Model.Personel YeniKullanici = new Model.Personel();
        public static Model.Görev YeniGörev = new Model.Görev();
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        List<Model.Personel> elemanlar = new List<Model.Personel>();
        protected void Page_Load(object sender, EventArgs e)
        {
            elemanlar = pServisi.TumPersoneliGetir();
            if(!IsPostBack)
             for (int i = 0; i < elemanlar.Count; i++)
             {
                    DropDownList1.Items.Add(elemanlar.ElementAt(i).Ad + " " + elemanlar.ElementAt(i).Soyad);
             }
            if (Session["Bilgi"] != null) {
                Model.Görev yeni = (Model.Görev)Session["Bilgi"];
                TextBox_Baslık.Text = yeni.Baslık;
                TextBox_yorum.Text = yeni.Yorum;
                Calendar_baslangıctarihi0.SelectedDate.Equals(yeni.VerilisTarihi.ToString());
                Calendar_bitistarihi.SelectedDate.Equals(yeni.BeklenenBitisTarihi.ToString());
                pServisi.GöreviSil(yeni.GörevId);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox_Baslık.Text.Length == 0)
            {
                Label_GörevYüklendimi.Text = "Lütfen Baslık Giriniz.";
                Label_GörevYüklendimi.Visible = true;
                return;
            }
            if (DropDownList1.SelectedValue==Convert.ToString(-1))
            {
                Label_GörevYüklendimi.Text = "Lütfen Bir Çalışan Seçiniz.";
                Label_GörevYüklendimi.Visible = true;
                return;
            }
            Model.Personel online = (Model.Personel)Session["LoginOlanKisi"];
            YeniGörev.Baslık = TextBox_Baslık.Text;
            YeniGörev.Yorum = TextBox_yorum.Text;
            YeniGörev.GörevlendirilenPersonelİsim = elemanlar.ElementAt(DropDownList1.SelectedIndex - 1).Ad + " " + elemanlar.ElementAt(DropDownList1.SelectedIndex - 1).Soyad;
            YeniGörev.VerilisTarihi = Calendar_baslangıctarihi0.SelectedDate.ToShortDateString();
            YeniGörev.BeklenenBitisTarihi = Calendar_bitistarihi.SelectedDate.ToShortDateString();
            YeniGörev.GörevlendirilenPersonel = elemanlar.ElementAt(DropDownList1.SelectedIndex-1).ID;
            YeniGörev.TarafındanAcıldı = online.ID;
            YeniGörev.TarafındanAcıldıİsim = Convert.ToString(online.Ad + " " + online.Soyad);
            YeniGörev.Oncelik = DropDownList_Oncelik.SelectedValue.ToString();
            YeniGörev.GörevlendirilenPersonelİsim = DropDownList1.SelectedItem.Text.ToString();
            Label_GörevYüklendimi.Text = pServisi.GörevAta(YeniGörev);
            Label_GörevYüklendimi.Visible = true;
            Button_Tamamla.Visible = false;
            System.Threading.Thread.Sleep(4000);
         }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class GörevParçala: System.Web.UI.Page
    {
        public static Model.Görev YeniGörev = new Model.Görev();
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        List<Model.Personel> elemanlar = new List<Model.Personel>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            elemanlar = pServisi.TumPersoneliGetir();
            if (!IsPostBack)
                for (int i = 0; i < elemanlar.Count; i++)
                {
                    DropDownListKisiler.Items.Add(elemanlar.ElementAt(i).Ad + " " + elemanlar.ElementAt(i).Soyad);
                }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox_Baslık.Text.Length < 1 || TextBox_yorum.Text.Length < 2)
            {
                Label_GörevParçalandı.Text = "Lütfen Başlık Ve Yorum Giriniz.";
                Label_GörevParçalandı.Visible = true;
                return;
            }
            Label_GörevParçalandı.Text = pServisi.ParçalananGörevlereEkle(Convert.ToInt16(Session["ID"]), elemanlar.ElementAt(DropDownListKisiler.SelectedIndex - 1).ID, TextBox_Baslık.Text, TextBox_yorum.Text, Calendar_BitisTarihi.SelectedDate.ToShortDateString(), Convert.ToInt16(Session["GörevID"]));
            pServisi.GörevDurumuGüncelle("Görevler", "Parçalanma İsteğinde", Convert.ToInt16(Session["GörevID"]), 0);
            System.Threading.Thread.Sleep(2000);
            Button_Tamamla.Visible = false;
        }

    }
}

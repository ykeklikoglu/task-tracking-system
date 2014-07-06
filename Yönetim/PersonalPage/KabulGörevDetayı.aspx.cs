using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class KabulGörevDetayı : System.Web.UI.Page
    {
        Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();
        Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            
            Label_TamamlanmaDurumu.Text ="Parçalanma Durumu: "+ pservis.ParçalananGörevlerinTamamlanmaDurumu(Convert.ToInt16(Session["GörevID"]));
            Label_TamamlanmaDurumu.Visible = true;
            if (Label_TamamlanmaDurumu.Text == "Parçalanma Durumu: Tamamlandı" || Label_TamamlanmaDurumu.Text == "Parçalanma Durumu: ")
            {
                Label_TamamlanmaDurumu.Visible = false;
                Button_Tamamla.Visible = true;
            }
        }
        protected void Button_Tamamla_Click(object sender, EventArgs e)
        {
            pservis.TamamlananGörevlereEkle(Convert.ToInt16(Session["GörevID"]));
            pservis.GörevDurumuGüncelle("KabulEdilenGörevler", "Tamamlandı", Convert.ToInt16(Session["GörevID"]), 0);
            Label1.Text = "Görev Tamamlandı.";
            Label1.Visible = true;
            Button_Parçala.Visible = false;
            Button_SorunBildir.Visible = false;
            Button_Tamamla.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
        }

        protected void Button_Parçala_Click(object sender, EventArgs e)
        {
            Session["GörevID"] = Session["GörevId"];
            Response.Redirect("/Yönetim/PersonalPage/GörevParçala.aspx", true);
        }

        protected void Button_SorunBildir_Click(object sender, EventArgs e)
        {

        }
    }
}
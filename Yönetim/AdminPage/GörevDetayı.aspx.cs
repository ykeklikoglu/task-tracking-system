using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class GörevDetayı : System.Web.UI.Page
    {
         static public Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        static public Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
        }

        protected void Button_GöreviSil_Click(object sender, EventArgs e)
        {
          pservis.GörevDurumuGüncelle("KabulEdilenGörevler", "Silindi", Convert.ToInt16(Session["GörevID"]), 0);
          pservis.ParçalıGöreviSilindiAyarla(Convert.ToInt16(Session["GörevID"]));
          pservis.SilinenGörevlereEkle(Convert.ToInt16(Session["GörevID"]), "KabulEdilenGörevler");
        }
    }
}
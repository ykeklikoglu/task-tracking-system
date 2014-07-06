using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class ReddedilenGörevler : System.Web.UI.Page
    {
        static public Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        static public Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();
        protected void PageLoad(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Secim"] = GridView1.SelectedValue;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Secim"] == null) { Label_Uyarı.Visible = true; return; }
            Label_Uyarı.Visible = false;
            if (e.CommandName == "Sil")
            {
                pservis.SilinenGörevlereEkle(Convert.ToInt16(Session["Secim"]), "ReddedilenGörevler");
                pservis.GörevDurumuGüncelle("Görevler", "Silindi", Convert.ToInt16(Session["Secim"]), 0);
                System.Threading.Thread.Sleep(2000);
                GridView1.DataBind();
            }
            else if (e.CommandName == "Yeniden Oluştur")
            {
                Session["Bilgi"] = pservis.GörevNo(Convert.ToInt16(Session["Secim"]));
                Response.Redirect("/Yönetim/AdminPage/GörevAtaPage.aspx", true);
            }

        }
    }
}
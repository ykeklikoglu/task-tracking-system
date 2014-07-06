using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class ReddedilenGörevler : System.Web.UI.Page
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
        }

        protected void Sil(object sender, ImageClickEventArgs e)
        {
            if(Session["Secilen"]==null)
            {
                Label_Uyarı.Text="Lütfen Silinecek Görevi Seçiniz.";
                Label_Uyarı.Visible=true;
                return;
            }
            pservis.SilinenGörevlereEkle(Convert.ToInt16(GridView1.SelectedDataKey.Value),"ReddedilenGörevler");
            pservis.GörevDurumuGüncelle("ReddedilenGörevler", "Silindi", Convert.ToInt16(GridView1.SelectedDataKey.Value), 0);
            GridView1.DataBind();
            DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Secilen"] = GridView1.SelectedDataKey;
        }

 


    }
}
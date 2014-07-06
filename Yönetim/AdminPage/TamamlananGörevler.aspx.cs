using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class TamamlananGörevler : System.Web.UI.Page
    {
        Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        static public Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_uyarı.Visible = false;
            Session["Sec"] = GridView1.SelectedValue;
            Session["GörevID"] = GridView1.SelectedValue;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Sec"] == null) 
            {
                Label_uyarı.Visible = true;
            }
            else if (e.CommandName == "İncele") 
            {
                Response.Redirect("/Yönetim/AdminPage/SadeceGörevDetayı.aspx");
            }
            else if (e.CommandName == "Sil") 
            {
                pservis.SilinenGörevlereEkle(Convert.ToInt16(Session["GörevID"]), "TamamlananGörevler");
                pservis.GörevDurumuGüncelle("TamamlananGörevler", "Silindi", Convert.ToInt16(Session["GörevID"]), 0);
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
        }
    }
}
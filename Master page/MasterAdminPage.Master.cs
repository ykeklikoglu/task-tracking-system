using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Master_page
{
    public partial class MasterAdminPage : System.Web.UI.MasterPage
    {
        static public Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
            if (!IsPostBack)
            {
                Model.Personel myInfo = (Model.Personel)Session["LoginOlanKisi"];
                Label_onlineOlanAdmin.Text = "Hoşgeldin " + myInfo.Ad + " " + myInfo.Soyad;
                Label_ertelenengörevlersayısı0.Text = pservis.TabloElemanSayısı("ErtelenenGörevler", 1, myInfo.ID);// 1 lar görünür halde
                Label_SilinenGörevler.Text = pservis.TabloElemanSayısı("SilinenGörevler", 1, myInfo.ID);// 1 ler görünür halde
                Label_Kabuledilengörevlersayısı.Text = pservis.TabloElemanSayısı("KabulEdilenGörevler", 1, myInfo.ID);
                Label_BitenGörevler.Text = pservis.TabloElemanSayısı("TamamlananGörevler", 1, myInfo.ID);
                Label_Parçalanangörevlersayı.Text = pservis.TabloElemanSayısı("ParçalananGörevler", 0, myInfo.ID);//0 lar görünür halde
                Label_ReddedilenGörevler0.Text = pservis.TabloElemanSayısı("ReddedilenGörevler", 1, myInfo.ID);
                Label_TumGörevlersayısı.Text = pservis.TabloElemanSayısı("Görevler", 1, myInfo.ID);
            }
        }

        protected void LinkButton_Gorevata_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/GörevAtaPage.aspx");
        }

        protected void LinkButton_HaberOlustur_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/HaberOlustur.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)//kabul edilenler.
        {
            Response.Redirect("/Yönetim/AdminPage/KabulEdilenlerGörevler.aspx");
        }

        /*protected void linkButton_ertelenengörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/ErtelenenGörevlerPage.aspx");
        }*/

        protected void LinkButton_DevredilenGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/ParçalananGörevler.aspx");
        }

        protected void LinkButton_ReddedilenGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/ReddedilenGörevler.aspx");
        }

        protected void LinkButton_BeklemedeGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/BeklemedeGörevler.aspx");
        }

        protected void _SilinenGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/SilinenGörevler.aspx");
        }

        protected void LinkButton_Mesajlar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/Mesajlar.aspx");
        }

        protected void ş_Click(object sender, EventArgs e)//çıkıs
        {
            Session.Clear();
            Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx");
        }

        protected void _BitenGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/TamamlananGörevler.aspx");
        }

        protected void linkbutton_TümGörevler_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Yönetim/AdminPage/TümGörevler.aspx");
        }
       
       
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Master_page
{
    public partial class PersonPage_AnaTablo : System.Web.UI.MasterPage
    {
        Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            if (!IsPostBack)
            {
                Model.Personel myInfo = (Model.Personel)Session["LoginOlanKisi"];
                Label_onlineOlanKullanici.Text = "Hoşgeldin " + myInfo.Ad + " " + myInfo.Soyad;
            
            }
        }

        protected void LinkButton_cıkısyap_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class KabulEtigimGörevler : System.Web.UI.Page
    {
        Fonksiyonlar.BizPersonel servis = new Fonksiyonlar.BizPersonel();
        Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
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
            Session["GörevID"] = GridView1.SelectedValue.ToString();
            Response.Redirect("/Yönetim/PersonalPage/KabulGörevDetayı.aspx");

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Görev_Takip_sistemim.localhost;
namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class AdminMasaüstüPage : System.Web.UI.Page
    {
        localhost.Currency doviz = new localhost.Currency();
        protected void Page_Load(object sender, EventArgs e)
        {
            localhost.Currency doviz = new localhost.Currency();
            if (Session["LoginOlanKisi"] == null)
            {
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            MessageBox.Text=doviz.TlKarsiligi(KurKodu.EUR,Tur.BanknoteSelling);
            MessageBox2.Text = doviz.TlKarsiligi(KurKodu.USD, Tur.BanknoteSelling);
        }
    }
}
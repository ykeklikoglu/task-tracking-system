using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class BitirdigimGörevler : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["GörevID"] = GridView1.SelectedValue.ToString();
            Session["Sec"] = GridView1.SelectedValue.ToString();
            Label_SeçimYap.Visible = false;

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Sec"] == null)
            {
                Label_SeçimYap.Text = "Lütfen Bir Seçim Yapınız.";
                Label_SeçimYap.Visible = true;
                return;
            }
            else if (e.CommandName == "Detay")
            {
                Response.Redirect("/Yönetim/PersonalPage/DetayTamamlananGörevler.aspx", true);
            }
            else if (e.CommandName == "Sil")
            {
                pservis.SilinenGörevlereEkle(Convert.ToInt16(Session["Sec"]), "TamamlananGörevler");
                pservis.GörevDurumuGüncelle("TamamlananGörevler", "Silindi", Convert.ToInt16(Session["Sec"]), 0);
                GridView1.EditIndex = -1;
                GridView1.DataBind();
                GridView1.DataBind();
            }
        }

    }
}
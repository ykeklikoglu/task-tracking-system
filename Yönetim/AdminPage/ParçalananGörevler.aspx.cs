using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class ParçalananGörevler : System.Web.UI.Page
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Secim"] == null) 
            {
                Label_Uyarı.Visible = true;
                return;
            }
            Label_Uyarı.Visible = false;
            if (e.CommandName == "Kabul")
            {
                int ID = Convert.ToInt32(GridView1.SelectedValue);
                pservis.ParcalıGörevDurumuGüncelle( "Parçalandı", ID,1,Convert.ToInt16(Session["Sıra"] ));
            }
            if (e.CommandName == "Reddet")
            {
                int ID = Convert.ToInt32(GridView1.SelectedValue);
                pservis.ParcalıGörevDurumuGüncelle("parçalama Reddedildi", ID, -1, Convert.ToInt16(Session["Sıra"]));
            }
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Secim"] = GridView1.SelectedDataKey.Values[0].ToString();
            Session["Sıra"] = GridView1.SelectedDataKey.Values[1].ToString();


        }


    }
}
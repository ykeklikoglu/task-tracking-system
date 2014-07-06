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
    public partial class YeniGörevlerim : System.Web.UI.Page
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
            if(!IsPostBack)
                LIST();
        }

        private void LIST()
        {
            Model.Personel Myinf = (Model.Personel)Session["LoginOlanKisi"];
            SqlConnection baglanti = bag.BaglantiAl(); 
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand komut = new SqlCommand(@"SELECT GörevId, Yorum, BeklenenBitisTarihi, Verilistarihi,GörevlendirilenPersonel,TarafındanAcıldıİsim
                                                 AS TarafındanAcıldı, 
                                                Baslık, GörevinDurumu FROM Görevler 
                                                WHERE GörevlendirilenPersonel = @Bana AND GörevGöster=1 ", baglanti);
            komut.Parameters.AddWithValue("@Bana", Myinf.ID);
            DataSet ds = new DataSet();
            sda.SelectCommand = komut;
            sda.Fill(ds);
            
            Gridview_YeniGörev.DataSource = ds;
            Gridview_YeniGörev.DataBind();
            baglanti.Close();
        }

        protected void Gridview_YeniGörev_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["GörevID"] = Gridview_YeniGörev.SelectedValue.ToString();
            servis.GörevDurumuGüncelle("Görevler", "Okundu", Convert.ToInt32(Session["GörevID"].ToString()), 1);
            Response.Redirect("/Yönetim/PersonalPage/GörevDetayı.aspx");
        }

        protected void Gridview_YeniGörev_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview_YeniGörev.PageIndex = e.NewPageIndex;
            LIST();

        }

        protected void GridView_Parçalama_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Secim"] == null) { Label_Secim.Visible = true; return; }
            Label_Secim.Visible = false;
            if (e.CommandName == "Tamamla") 
            {
                servis.ParcalıGörevDurumuGüncelle("Tamamlandı",Convert.ToInt16(Session["Secim"]),2,Convert.ToInt16(Session["Sıra"]));
                Label_Secim.Text="Parça Tamamlandı!";
                Label_Secim.Visible = true;
            }
            else if (e.CommandName == "Reddet") 
            {
                servis.ParcalıGörevDurumuGüncelle("Personel Reddetti", Convert.ToInt16(Session["Secim"]), -2, Convert.ToInt16(Session["Sıra"]));
                Label_Secim.Text = "Parça Reddedildi!";
                Label_Secim.Visible = true;
            }
            GridView_Parçalama.EditIndex = -1;
            GridView_Parçalama.DataBind();
            
        }

        protected void GridView_Parçalama_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Secim"] = GridView_Parçalama.SelectedDataKey.Values[0];
            Session["Sıra"] = GridView_Parçalama.SelectedDataKey.Values[1];
        }

    }
}
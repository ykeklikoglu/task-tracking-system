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
    public partial class ErtelenenGörevlerPage : System.Web.UI.Page
    {

        static public Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        static public Fonksiyonlar.BizPersonel pservis = new Fonksiyonlar.BizPersonel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null){
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
                return;
            }
            if (!IsPostBack)
                GridDoldur();
        }

        private void GridDoldur()
        {
            Model.Personel Myinf = (Model.Personel)Session["LoginOlanKisi"];
            SqlConnection baglanti = bag.BaglantiAl();
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand komut = new SqlCommand(@"SELECT [GörevId],[Baslık], [Verilistarihi], [BeklenenBitisTarihi], [GörevlendirilenPersonel],
                        [Yorum], [Oncelik], [GörevlendirilenPersonelİsim], 
                        [ErtelemeNedeni], [ErtelemeTarihi], [ErtelenenTarih]
                        FROM [Görev Takip Sistemi].dbo.ErtelenenGörevler
                        WHERE  [TarafındanAcıldıID] = @TarafındanAcıldıID AND GörevGöster=1", baglanti);
            komut.Parameters.AddWithValue("@TarafındanAcıldıID", Myinf.ID);
            DataSet ds = new DataSet();
            sda.SelectCommand = komut;
            sda.Fill(ds);
            GridView_Ertelenen.DataSource = ds;
            GridView_Ertelenen.DataBind();
            baglanti.Close();
        }

        protected void GridView_Ertelenen_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Fonksiyonlar.BizPersonel fonk = new Fonksiyonlar.BizPersonel();
            Model.Görev görevim = new Model.Görev();
            Label No = (Label)GridView_Ertelenen.Rows[e.RowIndex].FindControl("Label_GörevId");
            int ID = Convert.ToInt16(No.Text);
            pservis.SilinenGörevlereEkle(ID, "ErtelenenGörevler");
            pservis.GörevDurumuGüncelle("Görevler", "Silindi", ID, 0);
            pservis.GörevDurumuGüncelle("ErtelenenGörevler", "Silindi", ID, 0);
            pservis.GörevDurumuGüncelle("SilinenGörevler", "Silindi", ID, 1);
            GridView_Ertelenen.EditIndex = -1;
            GridView_Ertelenen.DataBind();
            GridDoldur();

        }

        protected void GridView_Ertelenen_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SatırBilgisi(e);
        }

        protected void GridView_Ertelenen_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView_Ertelenen.EditIndex = e.NewEditIndex;
            GridView_Ertelenen.DataBind();
            GridDoldur();
        }

        protected void GridView_Ertelenen_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Ertelenen.EditIndex = -1;
            GridView_Ertelenen.DataBind();
            GridDoldur();
        }

        protected void GridView_Ertelenen_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "kabulet")
            {

                int ID = Convert.ToInt32(GridView_Ertelenen.SelectedValue);
                Model.ErtelenenGörevler Ergörev = pservis.ErtelenenGörevNo(ID);
                //ID = Convert.ToInt32(lblId.Text);
                SqlConnection baglanti = bag.BaglantiAl();
                string query = @"UPDATE Görevler
                    SET VerilisTarihi=@vertar,BeklenenBitisTarihi=@Bektar,GörevinDurumu='Kabul Edildi'
                    WHERE GörevId=@IDM ";
                #region Sql Güncelleme kısmı
                SqlCommand komut = baglanti.CreateCommand();
                komut.CommandText = query;
                SqlParameter vertari = new SqlParameter("@vertar", SqlDbType.SmallDateTime);
                vertari.Value = Ergörev.ErtelemeTarihi;
                SqlParameter Bektari = new SqlParameter("@Bektar", SqlDbType.SmallDateTime);
                Bektari.Value = Ergörev.ErtelenenTarih;
                SqlParameter ıdm = new SqlParameter("@IDM", SqlDbType.Int);
                ıdm.Value = ID;
                komut.Parameters.Add(vertari);
                komut.Parameters.Add(Bektari);
                komut.Parameters.Add(ıdm);
                SqlDataReader reader = komut.ExecuteReader();
                baglanti.Close();
                #endregion
                pservis.GörevDurumuGüncelle("Görevler","Kabul Edildi", ID,1);
                pservis.GörevDurumuGüncelle("ErtelenenGörevler", "Kabul Edildi", ID,0);
                
            }
            if (e.CommandName == "reddet")
            {
                int ID = Convert.ToInt32(GridView_Ertelenen.SelectedValue);
                Model.ErtelenenGörevler Ergörev = pservis.ErtelenenGörevNo(ID);
                pservis.GörevDurumuGüncelle("Görevler","Reddedildi", ID,1);
                pservis.GörevDurumuGüncelle("ErtelenenGörevler", "Reddedildi", ID, 0);
            }
            GridView_Ertelenen.EditIndex = -1;
            GridView_Ertelenen.DataBind();
            GridDoldur();
        }

        private void SatırBilgisi(GridViewUpdateEventArgs e)
       {
            /*Label lblId = (Label)GridView_Ertelenen.Rows[e.RowIndex].FindControl("Label_GörevId");
           int ID = Convert.ToInt32(lblId.Text);
           TextBox txtBaslık = (TextBox)GridView_Ertelenen.Rows[e.RowIndex].FindControl("TextBox_Baslık");
           string a = txtBaslık.Text;
             *CALISAN KOD*/
           Label lblId = (Label)GridView_Ertelenen.Rows[e.RowIndex].FindControl("Label_GörevId");
           int ID = Convert.ToInt32(lblId.Text);
           TextBox txtBaslık = (TextBox)GridView_Ertelenen.Rows[e.RowIndex].FindControl("TextBox_Baslik");
           string a = txtBaslık.Text;
           Calendar calVertar = (Calendar)GridView_Ertelenen.Rows[e.RowIndex].FindControl("Calendar_verilis");
           Calendar calBittar = (Calendar)GridView_Ertelenen.Rows[e.RowIndex].FindControl("Calendar_bitis");
           TextBox txtYorum = (TextBox)GridView_Ertelenen.Rows[e.RowIndex].FindControl("TextBox_Yorum");
           SqlConnection baglanti = bag.BaglantiAl();
           string query = @"UPDATE Görevler
                    SET Baslık=@ba,VerilisTarihi=@vertar,
                    BeklenenBitisTarihi=@Bektar,Yorum=@yor,GörevinDurumu='Güncellendi'
                    WHERE GörevId=@IDM";
           #region Sql Güncelleme kısmı
           SqlCommand komut = baglanti.CreateCommand();
           komut.CommandText = query;
           SqlParameter baslık = new SqlParameter("@ba", SqlDbType.VarChar);
           baslık.Value = txtBaslık.Text.ToString();
           SqlParameter vertari = new SqlParameter("@vertar", SqlDbType.SmallDateTime);
           vertari.Value = calVertar.SelectedDate.ToShortDateString();
           SqlParameter Bektari = new SqlParameter("@Bektar", SqlDbType.SmallDateTime);
           Bektari.Value = calBittar.SelectedDate.ToShortDateString();
           SqlParameter yorum = new SqlParameter("@yor", SqlDbType.Text);
           yorum.Value = txtYorum.Text.ToString();
           SqlParameter ıdm = new SqlParameter("@IDM", SqlDbType.Int);
           ıdm.Value = ID;
           komut.Parameters.Add(baslık);
           komut.Parameters.Add(vertari);
           komut.Parameters.Add(Bektari);
           komut.Parameters.Add(yorum);
           komut.Parameters.Add(ıdm);
           SqlDataReader reader = komut.ExecuteReader();
           baglanti.Close();
           #endregion

           pservis.GörevDurumuGüncelle("ErtelenenGörevler", "Güncellendi", ID, 0);
           GridView_Ertelenen.EditIndex = -1;
           GridView_Ertelenen.DataBind();
           GridDoldur();
           pservis.GörevDurumuGüncelle("Görevler", "Güncellendi", ID, 1);
           
       }

        protected void GridView_Ertelenen_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
  }
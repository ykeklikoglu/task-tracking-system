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
    public partial class SilinenGörevler : System.Web.UI.Page
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

        protected void GridView_SilinenGörevler_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int ID = Convert.ToInt32(GridView_SilinenGörevler.SelectedValue);
            if (ID == 0)
            {
                Label_Sonuc.Text = "Lütfen Bir Seçim Yapınız.";
                Label_Sonuc.Visible = true;
                return;
            }
            SqlConnection baglanti = bag.BaglantiAl();
            string tablom = " ";
            SqlCommand komut = baglanti.CreateCommand();
            if (e.CommandName == "GeriAl")
            {
                string query = (@"SELECT GörevId,SilinenYer FROM SilinenGörevler WHERE GörevId=@IDM ");
                komut.CommandText = query;
                SqlParameter ıdm = new SqlParameter("@IDM", SqlDbType.Int);
                ıdm.Value = ID;
                komut.Parameters.Add(ıdm);
                SqlDataReader reader = komut.ExecuteReader();

                while (reader.Read())
                {
                    tablom = reader["SilinenYer"].ToString();
                }
                pservis.SilineniGeriAl(tablom, ID);
                pservis.GörevDurumuGüncelle("SilinenGörevler", "Geri Alındı", ID, 0);
                pservis.GörevDurumuGüncelle(tablom, "Geri Alındı", ID, 1);
                Label_Sonuc.Text = "Görev Geri Alındı";
            }
           /* else if (e.CommandName == "Sil")
            {
                Label_Sonuc.Text = pservis.GöreviSil(ID);
            }*/
            
            Label_Sonuc.Visible = true;
            GridView_SilinenGörevler.EditIndex = -1;
            GridView_SilinenGörevler.DataBind();
            DataBind();
        }

        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_Sonuc.Visible = false;
        }
    }
}
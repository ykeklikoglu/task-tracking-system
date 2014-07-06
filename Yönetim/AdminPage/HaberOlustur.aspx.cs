using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class HaberOlustur : System.Web.UI.Page
    {
        public Görev_Takip_sistemim.Fonksiyonlar.BizPersonel pServisi = new Görev_Takip_sistemim.Fonksiyonlar.BizPersonel();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length < 3)
            {
                Label1.Visible = true;
                return;
            }
            Label1.Visible = false;
          Label1.Text=  pServisi.HaberOlustur(TextBox1.Text.ToString(), Calendar2.SelectedDate.ToString());
          Label1.Visible = true;
          Button1.Visible = false;
        }
    }
}
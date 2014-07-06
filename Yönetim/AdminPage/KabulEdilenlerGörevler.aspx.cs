using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.AdminPage
{
    public partial class KabulEdilenlerGörevler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["GörevID"] = GridView1.SelectedValue.ToString();
            Response.Redirect("/Yönetim/AdminPage/GörevDetayı.aspx");
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Görev_Takip_sistemim.Yönetim.PersonalPage
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginOlanKisi"] == null)
                Response.Redirect("/Yönetim/LoginPageFile/LoginPage.aspx", true);
            if (!IsPostBack)
            {
                Label1.Text = DateTime.Today.ToString();
            }

        }
    }
}
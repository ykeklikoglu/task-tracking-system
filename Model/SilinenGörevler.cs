using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Görev_Takip_sistemim.Model
{
    public class SilinenGörevler
    {
        public int GörevId;
        public string Yorum;
        public string Beklenenbitistarihi;
        public string verilistarihi;
        public int TarafındanacıldıID;
        public string Tarafındanacıldıİsim;
        public string Oncelik;
        public int GörevinGöster;
        public string Baslık;
        public int GörevlendirilenPersonelID;
        public string GörevlendirilenPersonelİsim;
        public string SilinmeTarihi = DateTime.Today.ToShortDateString();
    }
}
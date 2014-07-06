using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Görev_Takip_sistemim.Model
{
    public class ReddedilenGörevler
    {
        public int GörevId	;
        public string Yorum;
        public string BeklenenBitisTarihi;
        public string Verilistarihi;
        public int TarafındanAcıldıID;
        public string TarafındanAcıldıİsim;
        public string Oncelik;
        public int GörevGöster;
        public string Baslık;
        public int GörevlendirilenPersonel;
        public string GörevlendirilenPersonelİsim;
        public string GörevDurum;
        public string ReddetmeNedeni;
        public string ReddedilmeTarihi = DateTime.Today.ToShortDateString();
    }
}
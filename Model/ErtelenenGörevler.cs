using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Görev_Takip_sistemim.Model
{
    public class ErtelenenGörevler
    { 
public string ErtelemeTarihi;
public string ErtelenenTarih;
public string ErtelemeNedeni;
public int GörevId;
public string Yorum;
public string BeklenenBitisTarihi;
public string Verilistarihi;
public int TarafındanAcıldıID;
public string TarafındanAcıldıİsim;
public string Oncelik;
public string GörevinDurumu;
public string Baslık;
public int GörevlendirilenPersonel;
public string GörevlendirilenPersonelİsim;
public string Tarih = DateTime.Today.ToShortDateString();

    }
}
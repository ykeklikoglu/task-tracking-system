using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;
namespace Görev_Takip_sistemim.Yönetim
{
    /// <summary>
    /// Summary description for Currency
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Currency : System.Web.Services.WebService
    {
        public enum KurKodu : byte
{
USD,
CAD,
DKK,
SEK,
NOK,
CHF,
JPY,
SAR,
KWD,
AUD,
EUR,
GBP,
IRR,
SYP,
JOG,
BGL,
ROL,
ILS,
}
public enum Tur: byte
{
ForexBuying, //Döviz alış
ForexSelling, //Döviz satış
BanknoteBuying, //Efektif alış
BanknoteSelling, //Efektif satış
}
// enumarationlar içerisinde Tlkarsiligi isimli fonksiyona gönderebileceğimiz değişkenleri tanımlıyoruz. 
 public void DovizIslemleri()
{
 
}
[WebMethod]
/* TlKarsiligi fonksiyonumuz Kukodu ve Tur enumaration değişkenlerini alır.
böylece alabileceği değişkenler sabitlenmiş olur. Bunun faydasını web servisini windows
uygulamamıza dahil ettiğimizde daha iyi anlayacaksınız
*/
public string TlKarsiligi(KurKodu kodu, Tur turu)
{
string kod = kodu.ToString();
string tur = turu.ToString();
//Değişkenlerimizi stringe çeviriyoruz.
XmlTextReader rdr = new XmlTextReader("http://www.tcmb.gov.tr/kurlar/today.xml");
XmlDocument MyXml = new XmlDocument();
MyXml.Load(rdr);
// internetteki xml belgesini uygulamamıza yüklüyoruz.
XmlNodeList MyNode = MyXml.SelectNodes("/Tarih_Date/Currency[@Kod ='"+kod+"']/"+tur);

// MyNode isimli XmlNodeList türünden değişkenimizi tanımlıyoruz. SelectNodes metodu kendisine
// parametre olarak gönderilen xpath e karşılık bu path deki nodeları bize döndürür. Yani fonksiyonu
// TlKarsiligi(KurKodu.NOK,Tur.BanknoteSelling) şeklinde çağırdığımızda SelectNodes metodu
// Kodu NOK (norveç kronu) olan node un BanknoteSelling nodelarını seçer.
return MyNode.Item(0).InnerXml.ToString();
//seçilen node un verisi stringe çevrilip geri döndürülür.
}
}
}

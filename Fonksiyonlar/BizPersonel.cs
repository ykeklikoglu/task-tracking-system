using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace Görev_Takip_sistemim.Fonksiyonlar
{
    public class BizPersonel
    {
        Fonksiyonlar.Baglantıİsleri bag = new Fonksiyonlar.Baglantıİsleri();
        public Model.Personel Login(string kullaniciAdi, string sifre)//Login girisimi basarilimi?-Basarili ise kisi bilgileri return edilir.
        {
            Model.Personel loginOlanPersonel = null;
            SqlConnection baglanti = bag.BaglantiAl();
            #region SQL komut hazırlama bölümü query="SELECT Ad , Soyad , KullaniciAdi , Sifre,HesapAktif,Evlilik,TcNo,ID,Cinsiyet,DogumGunu FROM Personeller where Kullaniciadi = @KullaniciAdi and Sifre = @Sifre "
            string query = "SELECT Ad , Soyad , KullaniciAdi , Sifre,HesapAktif,Evlilik,TcNo,ID,Cinsiyet,DogumGunu FROM Personeller where Kullaniciadi = @KullaniciAdi and Sifre = @Sifre ";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter kullaniciAdiParm = new SqlParameter("@KullaniciAdi", SqlDbType.VarChar);
            kullaniciAdiParm.Value = kullaniciAdi;

            SqlParameter sifreParm = new SqlParameter("@Sifre", SqlDbType.VarChar);
            sifreParm.Value = sifre;

            komut.Parameters.Add(kullaniciAdiParm);
            komut.Parameters.Add(sifreParm);
            #endregion
            SqlDataReader reader = komut.ExecuteReader();//SQL sorgulama islemi
            if (!reader.HasRows)//Hic Satir Gelmezse.
            {
                baglanti.Close();
                return null;//
            }
            //En az bir satir geldiyse.
            loginOlanPersonel = new Model.Personel();//yeni personel modelinde yapi olusturma
            while (reader.Read())
            {
                #region okunan bilgileri LoginOlanPersonel yapisina tek tek kaydetme bolumu
                loginOlanPersonel.Ad = reader["Ad"].ToString();
                loginOlanPersonel.Soyad = reader["Soyad"].ToString();
                loginOlanPersonel.KullaniciAdi = reader["KullaniciAdi"].ToString();
                loginOlanPersonel.Sifre = reader["Sifre"].ToString();
                loginOlanPersonel.HesapAktif = Convert.ToInt16(reader["HesapAktif"]);
                loginOlanPersonel.Evlilik = reader["Sifre"].ToString();
                loginOlanPersonel.TcNo = reader["TcNo"].ToString();
                loginOlanPersonel.ID = Convert.ToInt16(reader["ID"]);
                loginOlanPersonel.Cinsiyet = reader["Cinsiyet"].ToString();
                loginOlanPersonel.DogumGunu = reader["DogumGunu"].ToString();
                #endregion
            }
            baglanti.Close();
            return loginOlanPersonel;//login olan kisinin bilgilerinin saklandigi yapi return edilir.
        }
        public bool AdminMi(Model.Personel adminmisin)
        {
            #region SQL komutu hazırlama bolumu query= "SELECT * FROM Personeller where ID = @Id and AdminMi=1 "
            SqlConnection baglanti = bag.BaglantiAl();
            string query = "SELECT * FROM Personeller where ID = @Id and AdminMi=1 ";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter IdParm = new SqlParameter("@Id", SqlDbType.Int);
            IdParm.Value = adminmisin.ID;
            komut.Parameters.Add(IdParm);
            #endregion
            SqlDataReader reader = komut.ExecuteReader();
            if (!reader.HasRows)
            {
                baglanti.Close();
                return false;
            }
            baglanti.Close();
            return true;
        }//METHOD'A GELEN KISI ADMIN MI? ADMINSE->TRUE DEGİLSE->FALSE.
        public bool LoginUygunMu(Model.Personel calisanmi)
        {
            #region SQL baglanti komutları query: "SELECT ID , Ad , Soyad,HesapAktif FROM Personeller where ID = @Id and Ad = @Ad and Soyad=@Soyad and HesapAktif=1 "
            SqlConnection baglanti = bag.BaglantiAl();
            string query = "SELECT ID , Ad , Soyad, HesapAktif=1 FROM Personeller where ID = @Id and Ad = @Ad and Soyad=@Soyad ";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter IdParm = new SqlParameter("@Id", SqlDbType.Int);
            IdParm.Value = calisanmi.ID;

            SqlParameter AdParm = new SqlParameter("@Ad", SqlDbType.VarChar);
            AdParm.Value = calisanmi.Ad;

            SqlParameter SoyadParm = new SqlParameter("@Soyad", SqlDbType.VarChar);
            SoyadParm.Value = calisanmi.Soyad;

            komut.Parameters.Add(IdParm);
            komut.Parameters.Add(AdParm);
            komut.Parameters.Add(SoyadParm);
            #endregion
            SqlDataReader reader = komut.ExecuteReader();
            if (!reader.HasRows)//Hic satir yoksa
            {
                baglanti.Close();
                return false;//giris yapamaz
            }
            reader.Close();
            #region SQL Baglantı komutu query:"UPDATE Personeller SET HesapAktif=1 WHERE ID = @Idd and Ad = @Add and Soyad=@Soyadd"
            query = "UPDATE Personeller SET HesapAktif=1 WHERE ID = @Idd and Ad = @Add and Soyad=@Soyadd";
            komut.CommandText = query;
            SqlParameter IdPar = new SqlParameter("@Idd", SqlDbType.Int);
            IdPar.Value = calisanmi.ID;
            SqlParameter AdPar = new SqlParameter("@Add", SqlDbType.VarChar);
            AdPar.Value = calisanmi.Ad;
            SqlParameter SoyadPar = new SqlParameter("@Soyadd", SqlDbType.VarChar);
            SoyadPar.Value = calisanmi.Soyad;
            komut.Parameters.Add(IdPar);
            komut.Parameters.Add(AdPar);
            komut.Parameters.Add(SoyadPar);
            #endregion
            reader = komut.ExecuteReader();
            reader.Close();
            baglanti.Close();
            return true;// giris yapabilir. 
        }//Login olma hakki varmi?Kontrol eder varsa:1 yoksa:0 return eder.
        public string yeniKullaniciEkle(Model.Personel yeni)
        {
            SqlConnection baglanti = bag.BaglantiAl();
            //UPDATE [Görev Takip Sistemi].dbo.Personeller SET TcNo = '11111111111', Mail = 'keko', Cinsiyet='k', Evlilik ='e', HesapAktif=1 WHERE ID = 4 and Ad = 'burcu' and Soyad='keklikoglu'
            string query = "UPDATE Personeller SET TcNo = @TcNo,Mail = @mail,Cinsiyet=@Cins,Evlilik =@Evli,DogumGunu=@Dg,HesapAktif=1,KullaniciAdi=@Ka,Sifre=@Sfre WHERE ID = @Id and Ad = @Ad and Soyad=@Soyad ";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter KaParm = new SqlParameter("@Ka", SqlDbType.VarChar);
            KaParm.Value = yeni.KullaniciAdi;
            SqlParameter SfrParm = new SqlParameter("@Sfre", SqlDbType.VarChar);
            SfrParm.Value = yeni.Sifre;
            SqlParameter TcParm = new SqlParameter("@TcNo", SqlDbType.NVarChar);
            TcParm.Value = yeni.TcNo;
            SqlParameter IdParm = new SqlParameter("@ID", SqlDbType.Int);
            IdParm.Value = yeni.ID;
            SqlParameter AdParm = new SqlParameter("@Ad", SqlDbType.VarChar);
            AdParm.Value = yeni.Ad;
            SqlParameter SoyadParm = new SqlParameter("@Soyad", SqlDbType.VarChar);
            SoyadParm.Value = yeni.Soyad;
            SqlParameter MailParm = new SqlParameter("@Mail", SqlDbType.VarChar);
            MailParm.Value = yeni.Mail;
            SqlParameter CinsParm = new SqlParameter("@Cins", SqlDbType.Char);
            CinsParm.Value = yeni.Cinsiyet;
            SqlParameter EvlilikParm = new SqlParameter("@Evli", SqlDbType.Char);
            EvlilikParm.Value = yeni.Evlilik;
            SqlParameter DGParm = new SqlParameter("@Dg", SqlDbType.SmallDateTime);
            DGParm.Value = yeni.DogumGunu;
            komut.Parameters.Add(TcParm);
            komut.Parameters.Add(MailParm);
            komut.Parameters.Add(CinsParm);
            komut.Parameters.Add(EvlilikParm);
            komut.Parameters.Add(DGParm);
            komut.Parameters.Add(KaParm);
            komut.Parameters.Add(SfrParm);
            komut.Parameters.Add(IdParm);
            komut.Parameters.Add(AdParm);
            komut.Parameters.Add(SoyadParm);
            komut.ExecuteScalar();
            baglanti.Close();
            return ("Sisteminiz Aktif Hale Gelmiştir.Giriş Yapabilirsiniz.");
        }//Yeni kullanıcı bilgileri ile Personel Tablosuna Ekleme
        public List<Model.Personel> TumPersoneliGetir()
        {
            List<Model.Personel> tumPersoneller = new List<Model.Personel>();

            SqlConnection baglanti = bag.BaglantiAl();


            string query = "SELECT ID, Soyad, Ad FROM Personeller Where Adminmi=0 ORDER BY Ad";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlDataReader reader = komut.ExecuteReader();
            while (reader.Read())
            {
                Model.Personel yeniPersonel = new Model.Personel();
                yeniPersonel.ID = Convert.ToInt16(reader["ID"]);
                yeniPersonel.Ad = reader["Ad"].ToString();
                yeniPersonel.Soyad = reader["Soyad"].ToString();
                tumPersoneller.Add(yeniPersonel);
            }

            baglanti.Close();

            return tumPersoneller;
        }
        public Model.Personel PesonelId(int PersonelId) 
        {
            Model.Personel Personelim = new Model.Personel();
            SqlConnection Baglanti = bag.BaglantiAl();
            string query = (@"SELECT * FROM Personeller WHERE ID=@ID");
            SqlCommand Komut = Baglanti.CreateCommand();
            Komut.CommandText = query;
            SqlParameter Id = new SqlParameter("@ID", SqlDbType.Int);
            Id.Value = PersonelId;
            Komut.Parameters.Add(Id);
            SqlDataReader reader = Komut.ExecuteReader();
            if (!reader.HasRows)//Hic Satir Gelmezse.
            {
                Baglanti.Close();
                return null;//
            }
            while (reader.Read())
            {
                #region okunan bilgileri LoginOlanPersonel yapisina tek tek kaydetme bolumu
                Personelim.ID = PersonelId;
                Personelim.Ad = reader["Ad"].ToString();
                Personelim.Soyad = reader["Soyad"].ToString();
                Personelim.TcNo = reader["TcNo"].ToString();
                Personelim.Mail = reader["Mail"].ToString();
                Personelim.Cinsiyet = reader["Cinsiyet"].ToString();
                Personelim.Evlilik = reader["Evlilik"].ToString();
                Personelim.DogumGunu = reader["DogumGunu"].ToString();
                Personelim.HesapAktif = Convert.ToInt16(reader["HesapAktif"]);
                Personelim.KullaniciAdi = reader["KullaniciAdi"].ToString();
                Personelim.Sifre = reader["Sifre"].ToString();
                #endregion
            }
            Baglanti.Close();
            return (Personelim);
        }
        public string GörevAta(Model.Görev görevim)
        {
            SqlConnection baglanti = bag.BaglantiAl();
            #region query = "Insert [Görev Takip Sistemi].dbo.Görevler (Yorum, BeklenenBitisTarihi,Verilistarihi, TarafındanAcıldı, GörevlendirilenPersonel, Baslık, Oncelik) VALUES (@Yorum, @Verilis,@Beklenen,@kimden,@kime,@baslik,@Oncelik)"
            string query = "Insert Görevler (Yorum, BeklenenBitisTarihi,Verilistarihi, TarafındanAcıldıID,TarafındanAcıldıİsim, GörevlendirilenPersonel,GörevlendirilenPersonelİsim,Baslık, Oncelik) VALUES (@Yorum,@Beklenen , @Verilis,@kimden,@kimdenisim,@kime,@kimeisim,@baslik,@Oncelik)";
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            yorum.Value = görevim.Yorum;
            SqlParameter öncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            öncelik.Value = görevim.Oncelik;
            SqlParameter isimkime = new SqlParameter("@kimeisim", SqlDbType.VarChar);
            isimkime.Value = görevim.GörevlendirilenPersonelİsim ;
            SqlParameter verilis = new SqlParameter("@Verilis", SqlDbType.SmallDateTime);
            verilis.Value = görevim.VerilisTarihi;
            SqlParameter beklenen = new SqlParameter("@Beklenen", SqlDbType.SmallDateTime);
            beklenen.Value = görevim.BeklenenBitisTarihi;
            SqlParameter kimden = new SqlParameter("@kimden", SqlDbType.Int);
            kimden.Value = görevim.TarafındanAcıldı;
            SqlParameter kimdenis = new SqlParameter("@kimdenisim", SqlDbType.VarChar);
            kimdenis.Value = görevim.TarafındanAcıldıİsim;
            SqlParameter kime = new SqlParameter("@kime", SqlDbType.Int);
            kime.Value = görevim.GörevlendirilenPersonel;
            SqlParameter baslık = new SqlParameter("@baslik", SqlDbType.VarChar);
            baslık.Value = görevim.Baslık;
            komut.Parameters.Add(yorum);
            komut.Parameters.Add(isimkime);
            komut.Parameters.Add(verilis);
            komut.Parameters.Add(beklenen);
            komut.Parameters.Add(öncelik);
            komut.Parameters.Add(kimden);
            komut.Parameters.Add(kimdenis);
            komut.Parameters.Add(kime);
            komut.Parameters.Add(baslık);
            
            #endregion
            komut.ExecuteScalar();
            baglanti.Close();
            return ("Görev Başarı İle Eklenmiştir.");
        }
        public Model.Görev GörevNo(int Görevıd)
        {

            Model.Görev Görev = new Model.Görev();
            SqlConnection Baglanti = bag.BaglantiAl();
            string query =( @"SELECT * FROM Görevler WHERE GörevId=@ID");
            SqlCommand Komut = Baglanti.CreateCommand();
            Komut.CommandText = query;
            SqlParameter Id = new SqlParameter("@ID", SqlDbType.Int);
            Id.Value = Görevıd;
            Komut.Parameters.Add(Id);
            SqlDataReader reader = Komut.ExecuteReader();
            if (!reader.HasRows)//Hic Satir Gelmezse.
            {
                Baglanti.Close();
                return null;//
            }
            while (reader.Read())
            {
                #region okunan bilgileri LoginOlanPersonel yapisina tek tek kaydetme bolumu
                Görev.Baslık = reader["Baslık"].ToString();
                Görev.BeklenenBitisTarihi = reader["BeklenenBitisTarihi"].ToString();
                Görev.GörevId = Convert.ToInt16(reader["GörevId"]);
                Görev.GörevlendirilenPersonel = Convert.ToInt16(reader["GörevlendirilenPersonel"]);
                Görev.GörevlendirilenPersonelİsim = reader["GörevlendirilenPersonelİsim"].ToString();
                Görev.Oncelik = reader["Oncelik"].ToString();
                Görev.TarafındanAcıldı = Convert.ToInt16(reader["TarafındanAcıldıID"]);
                Görev.TarafındanAcıldıİsim = reader["TarafındanAcıldıİsim"].ToString();
                Görev.VerilisTarihi = reader["Verilistarihi"].ToString();
                Görev.Yorum = reader["Yorum"].ToString();
                #endregion
            }
            Baglanti.Close();
            return (Görev);

        }
        public Model.ErtelenenGörevler ErtelenenGörevNo(int Görevıd)
        {
            Model.ErtelenenGörevler Görev = new Model.ErtelenenGörevler();
            SqlConnection Baglanti = bag.BaglantiAl();
            string query = @"SELECT * FROM ErtelenenGörevler WHERE GörevId=@ID";
            SqlCommand Komut = Baglanti.CreateCommand();
            Komut.CommandText = query;
            SqlParameter Id = new SqlParameter("@ID", SqlDbType.Int);
            Id.Value = Görevıd;
            Komut.Parameters.Add(Id);
            SqlDataReader reader = Komut.ExecuteReader();
            if (!reader.HasRows)//Hic Satir Gelmezse.
            {
                Baglanti.Close();
                return null;//
            }
            while (reader.Read())
            {
                #region okunan bilgileri LoginOlanPersonel yapisina tek tek kaydetme bolumu
                Görev.Baslık = reader["Baslık"].ToString();
                Görev.BeklenenBitisTarihi = reader["BeklenenBitisTarihi"].ToString();
                Görev.GörevId = Convert.ToInt16(reader["GörevId"]);
                Görev.GörevlendirilenPersonel = Convert.ToInt16(reader["GörevlendirilenPersonel"]);
                Görev.GörevlendirilenPersonelİsim = reader["GörevlendirilenPersonelİsim"].ToString();
                Görev.Oncelik = reader["Oncelik"].ToString();
                Görev.TarafındanAcıldıID = Convert.ToInt16(reader["TarafındanAcıldıID"]);
                Görev.TarafındanAcıldıİsim = reader["TarafındanAcıldıİsim"].ToString();
                Görev.Verilistarihi = reader["Verilistarihi"].ToString();
                Görev.Yorum = reader["Yorum"].ToString();
                Görev.ErtelemeNedeni = reader["ErtelemeNedeni"].ToString();
                Görev.ErtelemeTarihi = reader["ErtelemeTarihi"].ToString();
                Görev.ErtelenenTarih = reader["ErtelenenTarih"].ToString();
                #endregion
            }
            Baglanti.Close();
            return (Görev);
        }
        public void GörevDurumuGüncelle(string Tablo,string durum, int GörevNo,int a) 
        {
            SqlConnection Baglanti = bag.BaglantiAl();
            if (Tablo == "Görevler")
            {
                string query = @"UPDATE Görevler SET GörevinDurumu=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (Tablo == "ErtelenenGörevler") 
            {
                string query = @"UPDATE ErtelenenGörevler
                    SET GörevinDurumu=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM AND Sıra=(select Max(Sıra)As son from ErtelenenGörevler where
                    GörevId=@IDM)";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (Tablo == "SilinenGörevler") 
            {
                string query = @"UPDATE SilinenGörevler
                    SET GörevinDurumu=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM AND Sıra=(select Max(Sıra)As son from SilinenGörevler where
                    GörevId=@IDM)";
                
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (Tablo == "KabulEdilenGörevler") 
            {
                string query = @"UPDATE KabulEdilenGörevler SET GörevDurum=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (Tablo == "ReddedilenGörevler")
            {
                string query = @"UPDATE ReddedilenGörevler SET GörevDurum=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (Tablo == "TamamlananGörevler")
            {
                string query = @"UPDATE TamamlananGörevler SET GörevinDurumu=@drm,GörevGöster=@a
                    WHERE GörevId=@IDM";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            Baglanti.Close();
        }
        public void ParcalıGörevDurumuGüncelle(string durum, int GörevNo,int a,int Sıra)
        {
            SqlConnection Baglanti = bag.BaglantiAl();
            string query = " ";
                SqlCommand Komut = Baglanti.CreateCommand();
               
            if (Sıra > 0)
            {
                query = @"UPDATE ParçalananGörevler
                    SET GörevinDurumu=@drm,GörevGöster=@a,Tamamlanma=@a
                    WHERE GörevId=@IDM AND Sıra=(select Sıra As son from ParçalananGörevler where  Sıra =@Sır And
                    GörevId=@IDM  )";
                     Komut.CommandText = query;
                SqlParameter Sırr = new SqlParameter("@Sır", SqlDbType.Int);
                Sırr.Value = Sıra;
                Komut.Parameters.Add(Sırr);


            }
            else
            {
                query = @"UPDATE ParçalananGörevler
                SET GörevinDurumu=@drm,GörevGöster=@a,Tamamlanma=@a
                WHERE GörevId=@IDM  )";
                Komut.CommandText = query;
               
            }             
                SqlParameter Id = new SqlParameter("@IDM", SqlDbType.Int);
                Id.Value = GörevNo;
                SqlParameter drm = new SqlParameter("@drm", SqlDbType.VarChar);
                drm.Value = durum;
                SqlParameter A = new SqlParameter("@a", SqlDbType.Int);
                A.Value = a;
                Komut.Parameters.Add(Id);
                Komut.Parameters.Add(drm);
                Komut.Parameters.Add(A);
                
                SqlDataReader reader = Komut.ExecuteReader();
                Baglanti.Close();
        }
        public string TabloElemanSayısı(string Tablo, int Durum,int login)
        {
            string str="()";
            SqlConnection Baglanti = bag.BaglantiAl();
            if (Tablo == "Görevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.Görevler Where GörevGöster=@durum";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }   
            }
            else if (Tablo == "ErtelenenGörevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.ErtelenenGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log ";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }  
            }
            else if (Tablo == "SilinenGörevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.SilinenGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }  
            }
            else if (Tablo == "KabulEdilenGörevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.KabulEdilenGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log ";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }  
            }
            else if (Tablo == "TamamlananGörevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM TamamlananGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }
            }
            else if (Tablo == "ParçalananGörevler") 
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.ParçalananGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }  
            }
            else if (Tablo == "ReddedilenGörevler")
            {
                string query = @"SELECT COUNT(*) AS Number FROM [Görev Takip Sistemi].dbo.ReddedilenGörevler Where GörevGöster=@durum and TarafındanAcıldıID=@log";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@durum", SqlDbType.Int);
                A.Value = Durum;
                SqlParameter loginpar = new SqlParameter("@log", SqlDbType.Int);
                loginpar.Value = login;
                Komut.Parameters.Add(A);
                Komut.Parameters.Add(loginpar);
                SqlDataReader reader = Komut.ExecuteReader();
                if (reader.Read())
                {
                    str = "(" + reader["Number"].ToString() + ")";
                }
            }
            Baglanti.Close();
            
            return (str);
        }
        public void SilineniGeriAl(string HangiTabloya, int GörevID) 
        {
            SqlConnection Baglanti = bag.BaglantiAl();
            if (HangiTabloya == "ErtelenenGörevler")
            {
                string query = (@"UPDATE ErtelenenGörevler SET GörevGöster=1  Where GörevId=@ID");
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@ID", SqlDbType.Int);
                A.Value = GörevID;
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();  
            }
            else if (HangiTabloya == "ReddedilenGörevler")
            {
                string query = @"UPDATE ReddedilenGörevler SET GörevGöster=1  Where GörevId=@ID";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@ID", SqlDbType.Int);
                A.Value = GörevID;
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (HangiTabloya == "Görevler") 
            {
                string query = @"UPDATE Görevler SET GörevGöster=1  Where GörevId=@ID";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@ID", SqlDbType.Int);
                A.Value = GörevID;
                Komut.Parameters.Add(A);
                SqlDataReader reader = Komut.ExecuteReader();
            }
            else if (HangiTabloya == "TamamlananGörevler")
            {
                ParçalıGöreviSilinmediAyarla(GörevID);
                string query = @"UPDATE TamamlananGörevler SET GörevGöster=1  Where GörevId=@ID";
                SqlCommand Komut = Baglanti.CreateCommand();
                Komut.CommandText = query;
                SqlParameter A = new SqlParameter("@ID", SqlDbType.Int);
                A.Value = GörevID;
                Komut.Parameters.Add(A);
                Komut.ExecuteReader();
            }
            Baglanti.Close();
            
        }
        public string GöreviSil(int GörevID) 
        {
            //GÖREV SİLİNMEDEN UYARI VERİLMELİ****
            SqlConnection Baglanti = bag.BaglantiAl();
            string query =( @"DELETE FROM [Görev Takip Sistemi].dbo.ErtelenenGörevler WHERE GörevId=@ID
                            DELETE FROM [Görev Takip Sistemi].dbo.Görevler WHERE GörevId=@ID
                            DELETE FROM [Görev Takip Sistemi].dbo.KabulEdilenGörevler WHERE GörevId=@ID
                            DELETE FROM [Görev Takip Sistemi].dbo.SilinenGörevler WHERE GörevId=@ID  
                            DELETE FROM [Görev Takip Sistemi].dbo.ReddedilenGörevler WHERE GörevId=@ID 
                            DELETE FROM [Görev Takip Sistemi].dbo.TamamlananGörevler WHERE GörevId=@ID
                            DELETE FROM  [Görev Takip Sistemi].dbo.ParçalananGörevler WHERE GörevId=@ID ");   
            SqlCommand Komut = Baglanti.CreateCommand();
            Komut.CommandText = query;
            SqlParameter A = new SqlParameter("@ID", SqlDbType.Int);
            A.Value = GörevID;
            Komut.Parameters.Add(A);
            Komut.ExecuteReader();
            Baglanti.Close();
            return ("Görev Tamamen Silindi!");

        }
        public string SilinenGörevlereEkle(int ID, string tablo) 
        {
            string Query = @"INSERT INTO SilinenGörevler
            (GörevId, Yorum, BeklenenBitisTarihi, Verilistarihi, TarafındanAcıldıID, TarafındanAcıldıİsim, Oncelik,Baslık,GörevlendirilenPersonel,GörevlendirilenPersonelİsim,SilinenYer,SilinmeTarihi) 
            VALUES (@GörevId ,@Yorum ,@BeklenenBitisTarihi ,@Verilistarihi ,@TarafındanAcıldıID ,@TarafındanAcıldıİsim ,@Oncelik ,@Baslık ,@GörevlendirilenPersonel ,@GörevlendirilenPersonelİsim,@sil,@SilinmeTarihi) ";
            #region
            SqlConnection baglanti = bag.BaglantiAl();
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = Query;
            Model.Görev görevim = new Model.Görev();
            görevim = GörevNo(ID);
            SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = görevim.GörevId;
            SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = görevim.Yorum;
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = görevim.BeklenenBitisTarihi;
            SqlParameter Verilistarihi = new SqlParameter("@Verilistarihi", SqlDbType.SmallDateTime);
            Verilistarihi.Value = görevim.VerilisTarihi;
            SqlParameter TarafındanAcıldıID = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafındanAcıldıID.Value = görevim.TarafındanAcıldı;
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@TarafındanAcıldıİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = görevim.TarafındanAcıldıİsim;
            SqlParameter Oncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            Oncelik.Value = görevim.Oncelik;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = görevim.Baslık;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = görevim.GörevlendirilenPersonel;
            SqlParameter GörevlendirilenPersonelİsim = new SqlParameter("@GörevlendirilenPersonelİsim", SqlDbType.NVarChar);
            GörevlendirilenPersonelİsim.Value = görevim.GörevlendirilenPersonelİsim;
            SqlParameter Sil = new SqlParameter("@sil", SqlDbType.NVarChar);
            Sil.Value = tablo;
            SqlParameter SilinmeTarihi = new SqlParameter("@SilinmeTarihi", SqlDbType.SmallDateTime);
            SilinmeTarihi.Value = DateTime.Today;     
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(BeklenenBitisTarihi);
            komut.Parameters.Add(Verilistarihi);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(Oncelik);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(Sil);
            komut.Parameters.Add(GörevlendirilenPersonel);
            komut.Parameters.Add(GörevlendirilenPersonelİsim);
            komut.Parameters.Add(SilinmeTarihi);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
            return ("Silme İşlemi Başarılı!");
        }
        public string ReddedilenGörevlereEkle(int ID,string Neden)
        {
            SqlConnection baglanti = bag.BaglantiAl();
            Model.Görev görevim = new Model.Görev();
            görevim = GörevNo(ID);
            string query = @"INSERT INTO ReddedilenGörevler
(
GörevId,
Yorum,
BeklenenBitisTarihi,
Verilistarihi,
TarafındanAcıldıID,
TarafındanAcıldıİsim,
Oncelik,
Baslık,
GörevlendirilenPersonel,
ReddedilmeTarihi,
ReddetmeNedeni

) VALUES (
  @GörevId,
  @Yorum,
  @BeklenenBitisTarihi,
  @Verilistarihi,
  @TarafındanAcıldıID,
  @TarafındanAcıldıİsim,
  @Oncelik,
  @Baslık,
  @GörevlendirilenPersonel,
  @ReddedilmeTarihi,
  @ReddetmeNedeni
)";
            #region IVIRZIVIRI
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@TarafındanAcıldıİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = görevim.TarafındanAcıldıİsim.ToString();
            SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = görevim.GörevId;
            SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = görevim.Yorum;
            SqlParameter TarafındanAcıldıID = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafındanAcıldıID.Value = görevim.TarafındanAcıldı;
            SqlParameter Verilistarihi = new SqlParameter("@Verilistarihi", SqlDbType.SmallDateTime);
            Verilistarihi.Value = görevim.VerilisTarihi;
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = görevim.BeklenenBitisTarihi;
            SqlParameter Oncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            Oncelik.Value = görevim.Oncelik;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = görevim.Baslık;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = görevim.GörevlendirilenPersonel;
            SqlParameter ReddedilmeTarihi = new SqlParameter("@ReddedilmeTarihi", SqlDbType.SmallDateTime);
            ReddedilmeTarihi.Value = DateTime.Today;
            SqlParameter ReddetmeNedeni = new SqlParameter("@ReddetmeNedeni", SqlDbType.Text);
            ReddetmeNedeni.Value = Neden;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(BeklenenBitisTarihi);
            komut.Parameters.Add(Verilistarihi);
            komut.Parameters.Add(Oncelik);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(GörevlendirilenPersonel);
            komut.Parameters.Add(ReddedilmeTarihi);
            komut.Parameters.Add(ReddetmeNedeni);
            #endregion

            komut.ExecuteReader();
            baglanti.Close();
            return ("Reddedilen Görevlere Eklendi.");
        }
        public string KabulEdilenGörevlereEkle(int ID)
        {
            SqlConnection baglanti = bag.BaglantiAl();
            Model.Görev egörev = GörevNo(ID);
            string query = @"INSERT INTO KabulEdilenGörevler
(
GörevId,
Yorum,
BeklenenBitisTarihi,
Verilistarihi,
TarafındanAcıldıID,
TarafındanAcıldıİsim,
Oncelik,
Baslık,
GörevlendirilenPersonel,
GörevlendirilenPersonelİsim
) VALUES (
@GörevId,
@Yorum,
@BeklenenBitisTarihi,
@Verilistarihi,
@TarafındanAcıldıID,
@TarafındanAcıldıİsim,
@Oncelik,
@Baslık,
@GörevlendirilenPersonel,
@Personelİsim
)";
            #region IVIRZIVIRI
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@TarafındanAcıldıİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = egörev.TarafındanAcıldıİsim.ToString();
            SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = Convert.ToInt16(egörev.GörevId);
            SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = egörev.Yorum.ToString();
            SqlParameter TarafındanAcıldıID = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafındanAcıldıID.Value = egörev.TarafındanAcıldı.ToString();
            SqlParameter Verilistarihi = new SqlParameter("@Verilistarihi", SqlDbType.SmallDateTime);
            Verilistarihi.Value = egörev.VerilisTarihi.ToString();
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = egörev.BeklenenBitisTarihi.ToString();
            SqlParameter Oncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            Oncelik.Value = egörev.Oncelik;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = egörev.Baslık;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = Convert.ToInt16(egörev.GörevlendirilenPersonel);
            SqlParameter Personelİsim = new SqlParameter("@Personelİsim", SqlDbType.VarChar);
            Personelİsim.Value = egörev.GörevlendirilenPersonelİsim;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(BeklenenBitisTarihi);
            komut.Parameters.Add(Verilistarihi);
            komut.Parameters.Add(Oncelik);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(GörevlendirilenPersonel);
            komut.Parameters.Add(Personelİsim);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
            return ("Kabul Edilen Görevlere Eklendi.");
        
        }
        public string TamamlananGörevlereEkle(int ID)
        {

            SqlConnection baglanti = bag.BaglantiAl();
            Model.Görev egörev = GörevNo(ID);
            string query = @"INSERT INTO TamamlananGörevler
(
GörevId,
Yorum,
BeklenenBitisTarihi,
Verilistarihi,
TarafındanAcıldıID,
TarafındanAcıldıİsim,
Oncelik,
Baslık,
GörevlendirilenPersonel,
GörevlendirilenPersonelİsim,
TamamlanmaTarihi

) VALUES (
@GörevId,
@Yorum,
@BeklenenBitisTarihi,
@Verilistarihi,
@TarafındanAcıldıID,
@TarafındanAcıldıİsim,
@Oncelik,
@Baslık,
@GörevlendirilenPersonel,
@GörevlendirilenPersonelİsim,
@TamamlanmaTarihi

)";
            #region IVIRZIVIRI
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@TarafındanAcıldıİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = egörev.TarafındanAcıldıİsim.ToString();
            SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = Convert.ToInt16(egörev.GörevId);
            SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = egörev.Yorum.ToString();
            SqlParameter TarafındanAcıldıID = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafındanAcıldıID.Value = egörev.TarafındanAcıldı.ToString();
            SqlParameter Verilistarihi = new SqlParameter("@Verilistarihi", SqlDbType.SmallDateTime);
            Verilistarihi.Value = egörev.VerilisTarihi.ToString();
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = egörev.BeklenenBitisTarihi.ToString();
            SqlParameter Oncelik = new SqlParameter("@Oncelik", SqlDbType.VarChar);
            Oncelik.Value = egörev.Oncelik;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = egörev.Baslık;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = Convert.ToInt16(egörev.GörevlendirilenPersonel);
            SqlParameter Personelİsim = new SqlParameter("@GörevlendirilenPersonelİsim", SqlDbType.VarChar);
            Personelİsim.Value = egörev.GörevlendirilenPersonelİsim;
            SqlParameter TamamlanmaTarihi = new SqlParameter("@TamamlanmaTarihi", SqlDbType.SmallDateTime);
            TamamlanmaTarihi.Value = DateTime.Today;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(BeklenenBitisTarihi);
            komut.Parameters.Add(Verilistarihi);
            komut.Parameters.Add(Oncelik);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(GörevlendirilenPersonel);
            komut.Parameters.Add(Personelİsim);
            komut.Parameters.Add(TamamlanmaTarihi);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
            return ("Biten Görevlere Eklendi");
        }
        public string ParçalananGörevlereEkle(int ID, int DevredenID, string baslıgım, string yorum, string Bitistarihi, int GörevID) 
        {
            SqlConnection baglanti = bag.BaglantiAl();
            Model.Görev egörev = GörevNo(GörevID);
            Model.Personel AtananKisi = PesonelId(DevredenID);
            Model.Personel DevredenKisi = PesonelId(ID);
            string query = @"INSERT INTO ParçalananGörevler
(
GörevId,
Baslık,
Yorum,
ParçalanmaTarihi,
ParçalanmaBitişTarihi,
Parcalayanİsim,
ParçalayanID,
GörevlendirilenPersonel,
GörevlendirilenPersonelİsim,
TarafındanAcıldıID,
ParçalanmaNedeni,
BeklenenBitisTarihi

) VALUES (
    @GörevId,
    @Baslık,
    @Yorum,
    @ParçalanmaTarihi,
    @ParçalanmaBitisTarihi,
    @Parcalayanİsim,
    @ParçalayanID,
    @GörevlendirilenPersonel,
    @GörevlendirilenPersonelİsim,
@TarafındanAcıldıID,
@ParçalanmaNedeni,
@BeklenenBitisTarihi

)";
            #region IVIRZIVIRI
            SqlParameter TarafId = new SqlParameter("@TarafındanAcıldıID", SqlDbType.Int);
            TarafId.Value = egörev.TarafındanAcıldı;
            SqlParameter ParcalamaNedeni = new SqlParameter("@ParçalanmaNedeni", SqlDbType.VarChar);
            ParcalamaNedeni.Value = yorum;
            SqlParameter BeklenenBitisTarihi = new SqlParameter("@BeklenenBitisTarihi", SqlDbType.SmallDateTime);
            BeklenenBitisTarihi.Value = egörev.BeklenenBitisTarihi;
            SqlParameter TarafındanAcıldıİsim = new SqlParameter("@Parcalayanİsim", SqlDbType.VarChar);
            TarafındanAcıldıİsim.Value = DevredenKisi.Ad+" "+DevredenKisi.Soyad;
              SqlParameter GörevId = new SqlParameter("@GörevId", SqlDbType.Int);
            GörevId.Value = Convert.ToInt16(egörev.GörevId);
                SqlParameter Yorum = new SqlParameter("@Yorum", SqlDbType.Text);
            Yorum.Value = egörev.Yorum.ToString();
            SqlParameter TarafındanAcıldıID = new SqlParameter("@ParçalayanID", SqlDbType.Int);
            TarafındanAcıldıID.Value = DevredenKisi.ID.ToString() ;
               SqlParameter ParcalamaBitisTarihi = new SqlParameter("@ParçalanmaBitisTarihi", SqlDbType.SmallDateTime);
               ParcalamaBitisTarihi.Value = Bitistarihi;
            SqlParameter Baslık = new SqlParameter("@Baslık", SqlDbType.VarChar);
            Baslık.Value = baslıgım;
            SqlParameter GörevlendirilenPersonel = new SqlParameter("@GörevlendirilenPersonel", SqlDbType.Int);
            GörevlendirilenPersonel.Value = Convert.ToInt16(AtananKisi.ID);
            SqlParameter Personelİsim = new SqlParameter("@GörevlendirilenPersonelİsim", SqlDbType.VarChar);
            Personelİsim.Value = AtananKisi.Ad +" "+AtananKisi.Soyad;
            SqlParameter ParçalanmaTarihi = new SqlParameter("@ParçalanmaTarihi", SqlDbType.SmallDateTime);
            ParçalanmaTarihi.Value = DateTime.Today;
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            komut.Parameters.Add(TarafındanAcıldıİsim);
            komut.Parameters.Add(GörevId);
            komut.Parameters.Add(Yorum);
            komut.Parameters.Add(TarafındanAcıldıID);
            komut.Parameters.Add(ParcalamaBitisTarihi);
            komut.Parameters.Add(Baslık);
            komut.Parameters.Add(GörevlendirilenPersonel);
            komut.Parameters.Add(Personelİsim);
            komut.Parameters.Add(ParçalanmaTarihi);
            komut.Parameters.Add(TarafId);
            komut.Parameters.Add(ParcalamaNedeni);
            komut.Parameters.Add(BeklenenBitisTarihi);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
            return ("Parçalanan Görevlere Eklendi");
        }
        public string ParçalananGörevlerinTamamlanmaDurumu(int GörevId)
        {
            int toplam = 0;
            int biten = 0;
            string Query = @"SELECT Tamamlanma FROM ParçalananGörevler WHERE GörevId=@grv";
            #region
            SqlConnection baglanti = bag.BaglantiAl();
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = Query;
            SqlParameter Görevim = new SqlParameter("@grv", SqlDbType.Int);
            Görevim.Value = GörevId;
            komut.Parameters.Add(Görevim); 
            #endregion
            SqlDataReader reader = komut.ExecuteReader();//SQL sorgulama islemi
            if (!reader.HasRows)//Hic Satir Gelmezse.
            {
                baglanti.Close();
                return null;//
            }
           while (reader.Read())
            {
                if (Convert.ToInt16(reader["Tamamlanma"]) == 2)
                {
                    biten++;
                    toplam++;
                }
                else if(Convert.ToInt16(reader["Tamamlanma"]) >0)
                toplam++;
            }
            baglanti.Close();
            if (biten == toplam)
                return ("Tamamlandı");
            return (biten.ToString() + "/" + toplam.ToString());
            
        }
        public string HaberOlustur(string konum, string tarihim)
        {

            SqlConnection baglanti = bag.BaglantiAl();
            string query = @"INSERT INTO Duyurular
(
Konu,
Tarih
) VALUES (
@Konu,
@Tarih

)";
            #region IVIRZIVIRI

            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter Konu = new SqlParameter("@Konu", SqlDbType.Text);
            Konu.Value = konum;
            SqlParameter Tarih = new SqlParameter("@Tarih", SqlDbType.SmallDateTime);
            Tarih.Value = tarihim;

            komut.Parameters.Add(Konu);
            komut.Parameters.Add(Tarih);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
            return ("Duyurulara Eklendi.");
        
        
        
        }
        public void ParçalıGöreviSilindiAyarla(int GörevId) {

            SqlConnection baglanti = bag.BaglantiAl();
            string query = @"UPDATE ParçalananGörevler SET Silinme=1 WHERE GörevId=@IDM";
            #region IVIRZIVIRI

            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter görevim = new SqlParameter("@IDM", SqlDbType.Int);
            görevim.Value = GörevId;
            komut.Parameters.Add(görevim);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
        }
        public void ParçalıGöreviSilinmediAyarla(int GörevId)
        {

            SqlConnection baglanti = bag.BaglantiAl();
            string query = @"UPDATE ParçalananGörevler SET Silinme=0 WHERE GörevId=@IDM";
            #region IVIRZIVIRI
            SqlCommand komut = baglanti.CreateCommand();
            komut.CommandText = query;
            SqlParameter görevim = new SqlParameter("@IDM", SqlDbType.Int);
            görevim.Value = GörevId;
            komut.Parameters.Add(görevim);
            #endregion
            komut.ExecuteReader();
            baglanti.Close();
        }
    }
}
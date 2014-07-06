<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Üyeol.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.Üyeol" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 420px;
        }
        .style1
        {
            margin-left: 40px;
        }
        .style2
        {
            width: 218px;
        }
        .style3
        {
            margin-left: 40px;
            height: 19px;
        }
        .style4
        {
            width: 218px;
            height: 19px;
        }
        .style6
        {
            height: 25px;
        }
        .style7
        {
            height: 30px;
            width: 234px;
        }
        .style8
        {
            width: 234px;
        }
        .style9
        {
            width: 234px;
            height: 33px;
        }
        .style10
        {
            height: 30px;
            width: 250px;
        }
        .style11
        {
            width: 250px;
        }
        .style12
        {
            width: 250px;
            height: 33px;
        }
    </style>
</head>
<body style="height: 656px" bgcolor="#c0c0c0">
    <p>
        &nbsp;</p>
    <form id="form1" runat="server" 
    style="background-color: #C0C0C0; width: 1330px;">
    <table id="tablo_üyeolbilgilertablosu" align="center" 
        style="width: 35%; height: 174px;" dir="ltr" rules="none" valign="top">
        <tr>
            <td class="style1" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Label ID="Label_Eksiksizbilgigir" runat="server" Font-Bold="True" 
                    Text="Bilgilerinizi Giriniz..."></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="row_ıd" class="style1">
                ID</td>
            <td class="style2">
                <asp:TextBox ID="Textbox_Id" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td id="row_ad" class="style1">
                Ad</td>
            <td class="style2">
                <asp:TextBox ID="Textbox_ad0" runat="server" MaxLength="20"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td id="row_soyad" class="style1">
                Soyad</td>
            <td class="style2">
                <asp:TextBox ID="Textbox_soyad0" runat="server" MaxLength="20"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td id="row_tc" class="style1">
                Tc No(11 
                rakamlı)</td>
            <td class="style2">
                <asp:TextBox ID="Textbox_Tcno0" runat="server" MaxLength="11"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td id="row_tc0" class="style3">
                Cinsiyet</td>
            <td class="style4">
                &nbsp;&nbsp;
                <asp:RadioButtonList ID="RadioButton_cinsiyet" runat="server" Height="16px" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    Width="210px" RepeatDirection="Horizontal">
                    <asp:ListItem Value="E">Erkek</asp:ListItem>
                    <asp:ListItem Selected="True" Value="K">Kadın</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td id="row_mail" class="style1">
                Mail</td>
            <td class="style2">
                <asp:TextBox ID="Textbox_mail0" runat="server" MaxLength="28"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="Textbox_mail0" ErrorMessage="Mail Giriniz." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td id="row_evlilik" class="style1">
                Evlilik Durumu</td>
            <td class="style2">
                &nbsp;
                <asp:RadioButtonList ID="RadioButton_evlilik" runat="server" Height="16px" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    Width="210px" RepeatDirection="Horizontal">
                    <asp:ListItem Value="E">Evli</asp:ListItem>
                    <asp:ListItem Selected="True" Value="B">Bekar</asp:ListItem>
                </asp:RadioButtonList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td id="row_Dg" class="style1">
                Doğum Günü</td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList_gün" runat="server" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList_ay" runat="server" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Ocak</asp:ListItem>
                    <asp:ListItem Value="2">Şubat</asp:ListItem>
                    <asp:ListItem Value="3">Mart</asp:ListItem>
                    <asp:ListItem Value="4">Nisan</asp:ListItem>
                    <asp:ListItem Value="5">Mayıs</asp:ListItem>
                    <asp:ListItem Value="6">Haziran</asp:ListItem>
                    <asp:ListItem Value="7">Temmuz</asp:ListItem>
                    <asp:ListItem Value="8">Ağustos</asp:ListItem>
                    <asp:ListItem Value="9">Eylül</asp:ListItem>
                    <asp:ListItem Value="10">Ekim</asp:ListItem>
                    <asp:ListItem Value="11">Kasım</asp:ListItem>
                    <asp:ListItem Value="12">Aralık</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList_yıl" runat="server" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                    <asp:ListItem Value="1">2012</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>1999</asp:ListItem>
                    <asp:ListItem>98</asp:ListItem>
                    <asp:ListItem>97</asp:ListItem>
                    <asp:ListItem>96</asp:ListItem>
                    <asp:ListItem>95</asp:ListItem>
                    <asp:ListItem>94</asp:ListItem>
                    <asp:ListItem>93</asp:ListItem>
                    <asp:ListItem>92</asp:ListItem>
                    <asp:ListItem>91</asp:ListItem>
                    <asp:ListItem>90</asp:ListItem>
                    <asp:ListItem>1989</asp:ListItem>
                    <asp:ListItem>88</asp:ListItem>
                    <asp:ListItem>87</asp:ListItem>
                    <asp:ListItem>86</asp:ListItem>
                    <asp:ListItem>85</asp:ListItem>
                    <asp:ListItem>84</asp:ListItem>
                    <asp:ListItem>83</asp:ListItem>
                    <asp:ListItem>82</asp:ListItem>
                    <asp:ListItem>81</asp:ListItem>
                    <asp:ListItem>80</asp:ListItem>
                    <asp:ListItem>1979</asp:ListItem>
                    <asp:ListItem>78</asp:ListItem>
                    <asp:ListItem>77</asp:ListItem>
                    <asp:ListItem>76</asp:ListItem>
                    <asp:ListItem>75</asp:ListItem>
                    <asp:ListItem>74</asp:ListItem>
                    <asp:ListItem>73</asp:ListItem>
                    <asp:ListItem>72</asp:ListItem>
                    <asp:ListItem>71</asp:ListItem>
                    <asp:ListItem>70</asp:ListItem>
                    <asp:ListItem>1969</asp:ListItem>
                    <asp:ListItem>68</asp:ListItem>
                    <asp:ListItem>67</asp:ListItem>
                    <asp:ListItem>66</asp:ListItem>
                    <asp:ListItem>65</asp:ListItem>
                    <asp:ListItem>64</asp:ListItem>
                    <asp:ListItem>63</asp:ListItem>
                    <asp:ListItem>62</asp:ListItem>
                    <asp:ListItem>61</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                    <asp:ListItem>1959</asp:ListItem>
                    <asp:ListItem>58</asp:ListItem>
                    <asp:ListItem>57</asp:ListItem>
                    <asp:ListItem>56</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>54</asp:ListItem>
                    <asp:ListItem>53</asp:ListItem>
                    <asp:ListItem>52</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
    </table>
    <div style="width: 216px; margin-left: 640px; height: 72px;">
&nbsp;<asp:Label ID="Label_eksikbilgi" runat="server" Font-Overline="False" 
            Font-Underline="True" ForeColor="Red" Text="Lütfen bilgileri eksiksiz giriniz." 
            Visible="False"></asp:Label>
&nbsp;<asp:Button ID="Button_Onayla" runat="server" onclick="Button_Onayla_Click" 
            Text="Onayla" />
        <br />
        <asp:Label ID="Label1_kayıtbilgisi" runat="server" Font-Underline="True" 
            ForeColor="Red" 
            Text="Sistemde Verilen bilgide kimse yok, iş vereninizle görüşün." 
            Visible="False" Width="374px"></asp:Label>
    </div>
    <asp:Panel ID="Panel1" runat="server" Height="231px" HorizontalAlign="Justify" 
        style="margin-left: 159px" Visible="False" Width="763px">
        <br />
        <table ID="Table_YeniKullanıcı bilgisi" align="right" class="style1">
            <tr>
                <td align="left" class="style10">
                    <asp:Label ID="Label3" runat="server" Text="Yeni Kullanıcı Adı"></asp:Label>
                </td>
                <td align="left" class="style7">
                    <asp:TextBox ID="TextBoxKullaniciAdi" runat="server" style="margin-left: 1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="style11">
                    <asp:Label ID="Label4" runat="server" Text="Şifre"></asp:Label>
                </td>
                <td align="left" class="style8">
                    <asp:TextBox ID="TextBoxSifre" runat="server" TextMode="Password"></asp:TextBox>
                    En az 4
                </td>
            </tr>
            <tr>
                <td align="left" class="style12">
                    Tekrar Şifre</td>
                <td align="left" class="style9" style="margin-left: 120px">
                    <asp:TextBox ID="TextBoxSifretekrar" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style11">
                    &nbsp;</td>
                <td class="style8">
                    <asp:Button ID="Button_Tamamla" runat="server" onclick="Button_Tamamla_Click" 
                        Text="Tamam" Width="61px" />
                </td>
            </tr>
            <tr>
                <td align="left" class="style6" colspan="2">
                    <asp:Label ID="Label_sifrelemeHatası" runat="server" Font-Underline="True" 
                        ForeColor="Red" Visible="False">Şifreler Uyusmuyor veya 4 ten az girildi.Lütfen tekrar Deneyin</asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>

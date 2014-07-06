<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
    {
        width: 54%;
            height: 97px;
            margin-left: 160px;
            margin-top: 4px;
        }
        .style2
        {
            height: 31px;
        }
        .style4
        {
            height: 37px;
        }
        .style5
        {
            height: 30px;
        }
        #form1
        {
            width: 537px;
            height: 317px;
            margin-left: 358px;
        }
        .style6
        {
            color: #FF0000;
        }
    </style>
</head>
<body bgcolor="Silver" style="text-align: center; height: 625px;">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div style="width: 315px; height: 31px; margin-left: 160px">
&nbsp;&nbsp;
        <asp:Label ID="Label_GörevTakipSistemiYazısı" runat="server" BorderColor="Red" 
            Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Red" 
            Text="Görev Takip Sistemi "></asp:Label>
&nbsp;
        <br />
    </div>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label5" runat="server" BorderStyle="Double" Font-Italic="True" 
        ForeColor="Red" Text="Hoşgeldiniz"></asp:Label>
    
        <table class="style1" align="center">
            <tr>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="TextBoxKullaniciAdi" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label4" runat="server" Text="Şifre"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBoxSifre" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td class="style4" style="margin-left: 120px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
                        ID="ButtonLogin" runat="server" onclick="Button1_Click" 
                        Text="Login" style="height: 26px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelSonuc" runat="server" Width="200px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink_üye_ol" runat="server" 
                        NavigateUrl="~/Yönetim/ÜyeOlPage/Üyeol.aspx" Target="_top">Üye ol</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span class="style6">Ziyaret Sayısı</span>:<asp:Label ID="Label_visits" 
                        runat="server" Text="Label_visits"></asp:Label>
                </td>
            </tr>
        </table>
    
    &nbsp;</form>
</body>
</html>

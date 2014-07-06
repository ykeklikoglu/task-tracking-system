<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="PersonelAlımı.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.PersonelAlımı" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            color: #FF0000;
        }
        .style10
        {}
        .style11
        {
            color: #FF0000;
            width: 182px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <br />
        <table class="style7" 
            style="height: 386px; width: 93%; background-image: url('../../İmages/active-logosoluk.gif'); background-repeat: no-repeat;">
            <tr>
                <td class="style9" colspan="3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    Ad :</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox_AdGir" runat="server" Width="227px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Soyad :</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox_SoyadGir" runat="server" Width="227px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Personel Tipi</td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList_personeltipi" runat="server" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="-1">Personel Tipi Seçin</asp:ListItem>
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                        <asp:ListItem Value="0">Personel</asp:ListItem>
                    </asp:DropDownList>
&nbsp;&nbsp;
                    <asp:Label ID="Label_Personeltipi" runat="server" Font-Underline="True" 
                        ForeColor="Red" Text="Bir Çalışan Tipi Seçiniz" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td class="style10">
                    <asp:Button ID="Button_Tamam" runat="server" Height="26px" 
                        onclick="Button_Tamam_Click" Text="Tamam" />
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Underline="True" ForeColor="Red" 
                        Text="Bilgileri Boş  Bırakmayınız." Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="ID :" 
                        Visible="False"></asp:Label>
                </td>
                <td class="style10">
                    <asp:Label ID="Label_ShowID" runat="server" BorderColor="Black" Text="Okumadım" 
                        Visible="False" BorderStyle="Dotted" Font-Bold="True" Font-Size="X-Large" 
                        Font-Strikeout="False" Font-Underline="True" ForeColor="Maroon"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td class="style10" colspan="2">
                    <asp:Label ID="Label_islemtamam" runat="server" Font-Underline="True" 
                        ForeColor="Red" Text="Kişi Başarı İle Eklenmişti" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>

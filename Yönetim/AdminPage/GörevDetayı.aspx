<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/GörevDetayıYönetici.master" AutoEventWireup="true" CodeBehind="GörevDetayı.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.GörevDetayı" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
    <table style="width: 100%">
    <tr>
        <td style="width: 238px">
            &nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Mesaj At" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button_GöreviSil" runat="server" Text="Görevi Sil" 
                onclick="Button_GöreviSil_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button_Güncelle" runat="server" Text="Güncelle" 
                Visible="False" />
        </td>
    </tr>
</table>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/GörevDetayıPersonel.master" AutoEventWireup="true" CodeBehind="KabulGörevDetayı.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.KabulGörevDetayı" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td style="width: 211px" align="right" valign="top">
                    <asp:Label ID="Label_TamamlanmaDurumu" runat="server" Visible="False"></asp:Label>
                </td>
                <td style="width: 473px">
                    <asp:Button ID="Button_Tamamla" runat="server" BackColor="#99FF66" 
                        style="margin-left: 10px; height: 26px; width: 81px;" Text="Tamamla" 
                        onclick="Button_Tamamla_Click" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button_Parçala" runat="server" BackColor="#CCCCFF" 
                        Text="Parçala" Height="26px" Width="81px" onclick="Button_Parçala_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button_SorunBildir" runat="server" BackColor="#FF5050" 
                        Text="Sorun Bildir" Height="26px" Width="81px" 
                        onclick="Button_SorunBildir_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BackColor="#0066FF" 
                        BorderColor="#0066FF" ForeColor="Black" Height="26px" 
                        Text="Devret" Width="81px" Visible="False" />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" BackColor="#E4E4E4" 
                        BorderColor="#000066" Text="Yöneticiye Mesaj At" Visible="False" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

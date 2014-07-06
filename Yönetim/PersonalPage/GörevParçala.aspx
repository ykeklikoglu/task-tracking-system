

<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="GörevParçala.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.GörevParçala" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style17
        {
            width: 32px;
            height: 32px;
        }
        .style15
        {
            width: 517px;
            height: 35px;
        }
        .style16
        {
            height: 35px;
        }
        .style7
    {
            width: 517px;
        }
        .style14
    {
        color: #FF0000;
    }
        .style12
        {
            width: 517px;
            height: 19px;
        }
        .style13
        {
            height: 19px;
        }
    .style18
    {
        font-size: x-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p align="left" style="margin-left: 60px" 
        id="ContentPlaceHolder_GörevBilgilendirmeTablosu">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <span class="style18"><em>
                    Görev Parçalanma İsteği İle Yöneticiye İletiliyor.</em></span>&nbsp;<img alt="" class="style17" 
    longdesc="http://localhost:49540/İmages/Yukleniyor.gif" 
    src="../../İmages/Yukleniyor.gif" /></ProgressTemplate>
            </asp:UpdateProgress>
<br />
            <table class="style6" 
                style="background-repeat: no-repeat; width: 738px; height: 484px; background-image: url('../../İmages/active-logosoluk.gif');" 
                width="800">
                <tr>
                    <td class="style15" style="color: #FF0000">
                        PARÇALAMA BAŞLIĞI:</td>
                    <td class="style16" width="700">
                        <asp:TextBox ID="TextBox_Baslık" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style7" style="color: #FF0000">
                        KİME:</td>
                    <td width="700">
                        <asp:DropDownList ID="DropDownListKisiler" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="-1">Lütfen Bir Çalışan Seçin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style7" style="color: #FF0000">
                        <p style="language: tr; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging">
                            BİTİŞ TARİHİ:</p>
                    </td>
                    <td class="style14" width="700" align="left">
                        <asp:Calendar ID="Calendar_BitisTarihi" runat="server" BackColor="White" 
                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="107px" 
                            SelectedDate="2012-05-25" Width="172px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="style12" style="color: #FF0000">
                        PARÇALAMA SEBEBİ:</td>
                    <td class="style13" width="700">
                        <asp:TextBox ID="TextBox_yorum" runat="server" Height="41px" 
                            TextMode="MultiLine" Width="347px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style7" style="color: #FF0000">
                        &nbsp;</td>
                    <td width="700">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                            ID="Label_GörevParçalandı" runat="server" 
                            Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="Red" 
                            Text="Görev Paçalandı." Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
                            ID="Button_Tamamla" runat="server" 
                            onclick="Button1_Click" Text="Tamamla" Height="26px" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    <br />
</p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="GörevAtaPage.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.GörevAtaPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
    {
        width: 643px;
        height: 150px;
    }
    .style7
    {
            width: 517px;
        }
        .style10
        {
            width: 459px;
            height: 201px;
        }
        .style11
        {
            height: 201px;
            width: 414px;
        }
        .style12
        {
            width: 459px;
            height: 19px;
            background-color: #FFFFFF;
        }
        .style13
        {
            height: 19px;
            width: 414px;
        }
    .style14
    {
        color: #FF0000;
            width: 414px;
        }
        .style15
        {
            width: 459px;
            height: 35px;
        }
        .style16
        {
            height: 35px;
            width: 414px;
        }
        .style17
        {
            width: 32px;
            height: 32px;
        }
        .style19
        {
            background-color: #FFFFFF;
        }
        .style20
        {
            width: 414px;
        }
        .style22
        {
            width: 459px;
            height: 2px;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Görev Yükleniyor.&nbsp;<img alt="" class="style17" 
    longdesc="http://localhost:49540/İmages/Yukleniyor.gif" 
    src="../../İmages/Yukleniyor.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
<br />
            <table class="style6" 
                
                style="background-repeat: no-repeat; width: 605px; height: 484px; background-image: url('../../İmages/active-logosoluk.gif');">
                <tr>
                    <td class="style15" style="color: #FF0000" align="center">
                        BAŞLIK:</td>
                    <td class="style16" align="center">
                        <asp:TextBox ID="TextBox_Baslık" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style22" style="color: #FF0000" align="center">
                        KİME:</td>
                    <td align="center" class="style20">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="-1">Lütfen Bir Çalışan Seçin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style22" style="color: #FF0000" align="center">
                        ÖNCELİK:</td>
                    <td align="center" class="style20">
                        <asp:DropDownList ID="DropDownList_Oncelik" runat="server">
                            <asp:ListItem Selected="True">Normal </asp:ListItem>
                            <asp:ListItem>Yüksek</asp:ListItem>
                            <asp:ListItem>Alçak</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style22" style="color: #FF0000" align="center">
                        <p style="language: tr; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging">
                            <span class="style19">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VERİLİŞ TARİHİ:</span></p>
                    </td>
                    <td class="style14" align="center">
                        BİTİŞ TARİHİ:</td>
                </tr>
                <tr>
                    <td class="style10" style="color: #FF0000" align="center">
                        <asp:Calendar ID="Calendar_baslangıctarihi0" runat="server" BackColor="White" 
                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="107px" 
                            SelectedDate="05/10/2012 01:37:29" Width="172px">
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
                    <td class="style11" align="center">
                        <asp:Calendar ID="Calendar_bitistarihi" runat="server" BackColor="White" 
                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="107px" 
                            SelectedDate="05/10/2012 01:37:44" Width="172px">
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
                    <td class="style12" style="color: #FF0000" align="center">
                        AÇIKLAMA:</td>
                    <td class="style13" align="center">
                        <asp:TextBox ID="TextBox_yorum" runat="server" Height="41px" 
                            TextMode="MultiLine" Width="347px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style22" style="color: #FF0000" align="center">
                        &nbsp;</td>
                    <td align="center" class="style20">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label_GörevYüklendimi" runat="server" 
                            Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="Red" 
                            Text="Label" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button_Tamamla" runat="server" 
                            onclick="Button1_Click" Text="Tamamla" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    <br />
</p>
</asp:Content>


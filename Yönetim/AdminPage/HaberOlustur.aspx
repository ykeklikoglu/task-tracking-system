<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="HaberOlustur.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.HaberOlustur" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style9
    {
        width: 98%;
        height: 186px;
    }
    .style10
    {
        color: #FF0000;
        width: 338px;
    }
    .style11
    {
        width: 338px;
    }
    .style12
    {
        width: 32px;
        height: 32px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </p>
<asp:UpdateProgress ID="UpdateProgress2" runat="server" 
    AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duyuru 
        Yükleniyor
        <img alt="Duyuru Yükleniyor" class="style12" 
    src="../../İmages/Yukleniyor.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="style9">
            <tr>
                <td align="center" class="style10">
                    Konu:</td>
                <td align="center">
                    <asp:TextBox ID="TextBox1" runat="server" 
                TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" class="style10">
                    Son Yayınlanma Tarihi:</td>
                <td align="center">
                    <asp:Calendar ID="Calendar2" runat="server" 
                BackColor="White" BorderColor="#999999" CellPadding="4" 
                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                Height="37px" Width="100px" SelectedDate="05/30/2012 21:17:22">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" 
                    Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" 
                    ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" 
                    Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td align="center" class="style11">
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                        Text="Lütfen Konu Giriniz." Visible="False"></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Tamam" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
</asp:UpdateProgress>
<p>
        <br />
    </p>
    </asp:Content>

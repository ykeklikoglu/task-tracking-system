<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/GörevDetayıPersonel.master" AutoEventWireup="true" CodeBehind="GörevDetayı.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.GörevDetayı" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<table style="width: 100%">
    <tr>
        <td style="height: 34px">
            </td>
        <td style="width: 508px; height: 34px;">
            </td>
        <td style="height: 34px">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                    Text="İşlem Yap" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button8" runat="server" Text="Onayla" onclick="Button8_Click" />
            </td>
    </tr>
</table>
    <asp:Panel ID="Panel_İnceAyar" runat="server" Height="41px" Width="956px" 
        Visible="False">
        <table class="style9" style="margin-bottom: 0px">
            <tr>
                <td align="center" bgcolor="#FFE8A6" class="style11" valign="middle" 
                    style="height: 15px">
                    <asp:Button ID="Button9" runat="server" BackColor="#FFE8A6" Text="Ertele" 
                        onclick="Button9_Click" Height="26px" Width="314px" />
                </td>
                <td align="center" bgcolor="#FFE8A6" class="style1" valign="middle" 
                    style="height: 12px; text-align: left;">
                    <asp:Button ID="Button12" runat="server" BackColor="#FFE8A6" Height="26px" 
                        onclick="Button10_Click" Text="Reddet" Width="314px" />
                    </td>
                <td align="center" bgcolor="#FFE8A6" class="style16" valign="middle" 
                    style="height: 15px">
                    <asp:Button ID="Button11" runat="server" BackColor="#FFE8A6" Text="Devret" 
                        onclick="Button11_Click" Height="26px" Width="314px" Visible="False" />
                </td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;<br />
        <asp:Panel ID="Panel_işlemYapmaBilgileri" runat="server" 
            style="margin-right: 0px" Width="959px">
            <table class="style31">
                <tr>
                    <td class="style27" style="width: 269px">
                        <asp:Panel ID="Panel_ErtelemeBilgileri" runat="server" Height="568px" 
                            Visible="False" Width="282px" style="margin-right: 8px">
                            <table class="style30">
                                <tr>
                                    <td align="center" class="style34">
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="Label12" runat="server" ForeColor="Red" 
                                            Text="Başlangıç Tarihi Giriniz."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style34">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" 
                                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="50px" 
                                            SelectedDate="05/18/2012 00:30:01" Width="161px">
                                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                            <NextPrevStyle VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#808080" />
                                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" />
                                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                        </asp:Calendar>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" class="style34">
                                        <asp:Label ID="Label13" runat="server" ForeColor="Red" 
                                            Text="Bitiş Tarihi Giriniz."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style34">
                                        <asp:Calendar ID="Calendar3" runat="server" BackColor="White" 
                                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="50px" 
                                            SelectedDate="05/18/2012 00:30:11" Width="161px">
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
                                    <td align="center" class="style34">
                                        <asp:Label ID="Label14" runat="server" ForeColor="Red" 
                                            Text="Erteleme Nedeni Giriniz."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style34">
                                        <asp:TextBox ID="TextBox_erteleme" runat="server" Height="51px" 
                                            TextMode="MultiLine" Width="255px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style34">
                                        <asp:Button ID="Button_Erteleme_onayla0" runat="server" Height="26px" 
                                            onclick="Button_Erteleme_onayla0_Click" Text="Onayla" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td align="center" class="style33" valign="top" style="width: 363px">
                        <asp:Panel ID="Panel_ReddetBilgisi" runat="server" Visible="False">
                            <table class="style31">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" CssClass="style10" ForeColor="Red" 
                                            Text="Reddetme Sebebiniz nedir?" Width="240px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBox_reddet" runat="server" Height="51px" 
                                            TextMode="MultiLine" Width="255px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Button_reddetin_onayla" runat="server" Height="26px" 
                                            onclick="Button_reddetin_onayla_Click" Text="Onayla" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td valign="top">
                        <asp:Panel ID="Panel_DevretBilgisi" runat="server" Visible="False" 
                            Width="258px">
                            <table class="style36">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" CssClass="style10" ForeColor="Red" 
                                            Text="Devretme Sebebiniz nedir?" Width="240px" ViewStateMode="Disabled" 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBox_devret" runat="server" Height="51px" 
                                            TextMode="MultiLine" Width="255px" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label_devredilecekkisi" runat="server" CssClass="style10" 
                                            ForeColor="Red" Text="Devredilecek Personeli Seçiniz." Width="240px" 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <asp:DropDownList ID="DropDownList_KisiListelemeDevret" runat="server" 
                                            AutoPostBack="True" Visible="False">
                                            <asp:ListItem Value="-1">Lütfen Bir Çalışan Seçin</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="Button_devret_onayla0" runat="server" Height="26px" 
                                            onclick="Button_devret_onayla0_Click" Text="Onayla" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Panel>
        <asp:Label ID="Label_GörevNo" runat="server" Text="Label_GörevNo" 
            Visible="False"></asp:Label>
    <br />
<br />
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label_ertelemeNotu" runat="server" 
        Text="Talebiniz Yöneticiye İletilmiştir." Visible="False" 
        Font-Italic="True" ForeColor="Red" style="font-size: x-large"></asp:Label>
</asp:Content>


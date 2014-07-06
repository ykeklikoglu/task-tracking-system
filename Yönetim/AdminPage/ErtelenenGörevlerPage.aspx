<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ErtelenenGörevlerPage.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.ErtelenenGörevlerPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <asp:GridView ID="GridView_Ertelenen" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" DataKeyNames="GörevId" 
        BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        onrowcancelingedit="GridView_Ertelenen_RowCancelingEdit" 
        onrowdeleting="GridView_Ertelenen_RowDeleting" 
        onrowediting="GridView_Ertelenen_RowEditing" 
        onrowupdating="GridView_Ertelenen_RowUpdating" 
        onrowcommand="GridView_Ertelenen_RowCommand" 
        onselectedindexchanged="GridView_Ertelenen_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="GörevID">
                <ItemTemplate>
                    <asp:Label ID="Label_GörevId" runat="server" Text='<%#Bind("GörevId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Baslık">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Baslık") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Baslik" runat="server" Text='<%#Bind("Baslık") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Veriliş Tarihi">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar_verilis" runat="server" BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="68px" 
                        Width="114px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("Verilistarihi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bitiş Tarihi">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("BeklenenBitisTarihi") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar_bitis" runat="server" BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="61px" 
                        Width="87px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Yorum">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Yorum" runat="server" Text='<%#Bind("Yorum") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("Yorum") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oncelik">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%#Bind("Oncelik") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Görevli Kisi ID">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%#Bind("GörevlendirilenPersonel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Görevli Kisi Ad">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%#Bind("GörevlendirilenPersonelİsim") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Erteleme Nedeni">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%#Bind("ErtelemeNedeni") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ertelenen Başlama Tarihi">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%#Bind("ErtelemeTarihi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ertelenen Bitiş Tarihi">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%#Bind("ErtelenenTarih") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" 
                EditImageUrl="~/İmages/icon_edit_and_up.gif" ShowEditButton="True" 
                UpdateImageUrl="~/İmages/icon_update.gif" 
                CancelImageUrl="~/İmages/cancel_icon.jpg" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" 
                ShowCancelButton="False" ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="Kabul Et">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" AccessKey="1" 
                        CommandArgument="1" CommandName="kabulet" 
                        ImageUrl="~/İmages/like_icon.png" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reddet">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" AccessKey="0" 
                        CommandArgument="0" CommandName="reddet" 
                        ImageUrl="~/İmages/unlike_icon.png" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                SelectImageUrl="~/İmages/selectIcon.jpg" />
        </Columns>
        <EmptyDataTemplate>
            Ertelenen Görev Yok.
        </EmptyDataTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <br />
    <asp:Label ID="Label11" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
</asp:Content>

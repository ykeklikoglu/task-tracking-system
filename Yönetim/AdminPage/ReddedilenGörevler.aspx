<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ReddedilenGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.ReddedilenGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style10
        {
            width: 32px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label_Uyarı" runat="server" Font-Italic="True" 
            Font-Underline="True" Text="Lütfen Seçim Yapınız." Visible="False"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:UpdateProgress 
                ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    Görev Silinen Görevlere Ekleniyor!
                    <img class="style10" src="../../İmages/Yukleniyor.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" 
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="4" DataKeyNames="GörevId" DataSourceID="SqlDataSource1" 
                GridLines="Horizontal" onrowcommand="GridView1_RowCommand" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                        SortExpression="GörevId" />
                    <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                        SortExpression="Baslık" />
                    <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                    <asp:BoundField DataField="Verilistarihi" HeaderText="Verilistarihi" 
                        SortExpression="Verilistarihi" />
                    <asp:BoundField DataField="BeklenenBitisTarihi" 
                        HeaderText="BeklenenBitisTarihi" SortExpression="BeklenenBitisTarihi" />
                    <asp:BoundField DataField="ReddetmeNedeni" HeaderText="ReddetmeNedeni" 
                        SortExpression="ReddetmeNedeni" />
                    <asp:BoundField DataField="GörevlendirilenPersonelİsim" 
                        HeaderText="GörevlendirilenPersonelİsim" 
                        SortExpression="GörevlendirilenPersonelİsim" />
                    <asp:BoundField DataField="ReddedilmeTarihi" HeaderText="ReddedilmeTarihi" 
                        SortExpression="ReddedilmeTarihi" />
                    <asp:TemplateField HeaderText="Yeniden Oluştur">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Yeniden Oluştur" 
                                Height="37px" ImageUrl="~/İmages/iconResearchPapers.png" Width="35px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sil">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Sil" 
                                ImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                        ShowSelectButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    Reddedilen Görev Yok!
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            
            SelectCommand="SELECT [GörevId], [Baslık], [Yorum], [Verilistarihi], [BeklenenBitisTarihi], [ReddetmeNedeni], [GörevlendirilenPersonelİsim], [ReddedilmeTarihi] FROM [ReddedilenGörevler] WHERE (([GörevGöster] = @GörevDurum) AND ([TarafındanAcıldıID] = @TarafındanAcıldıID))">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="GörevDurum" Type="String" />
                <asp:SessionParameter Name="TarafındanAcıldıID" SessionField="ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>

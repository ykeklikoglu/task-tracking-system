<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="BitirdigimGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.BitirdigimGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
        <br />
        <asp:Label ID="Label_SeçimYap" runat="server" Text="Lütfen bir Seçim Yapınız." 
            Visible="False"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="GörevId"
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowcommand="GridView1_RowCommand" EmptyDataText="Tamamlanan Görev Yok.">
            <Columns>
                <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                    SortExpression="GörevId" Visible="False" />
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                <asp:BoundField DataField="GörevlendirilenPersonelİsim" 
                    HeaderText="GörevlendirilenPersonelİsim" 
                    SortExpression="GörevlendirilenPersonelİsim" />
                <asp:BoundField DataField="TamamlanmaTarihi" HeaderText="TamamlanmaTarihi" 
                    SortExpression="TamamlanmaTarihi" />
                <asp:BoundField DataField="GörevinDurumu" HeaderText="GörevinDurumu" 
                    SortExpression="GörevinDurumu" />
                <asp:TemplateField HeaderText="Sil" Visible="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="Sil" runat="server" CommandName="Sil" 
                            ImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detay">
                    <ItemTemplate>
                        <asp:ImageButton ID="Detay" runat="server" CommandName="Detay" 
                            ImageUrl="~/İmages/selectIcon.jpg" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField 
                    ShowCancelButton="False" ShowSelectButton="True" SelectText="Seç" />
            </Columns>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            SelectCommand="SELECT [GörevId], [Baslık], [Yorum], [GörevlendirilenPersonelİsim], [TamamlanmaTarihi], [GörevinDurumu] FROM [TamamlananGörevler] WHERE (([GörevlendirilenPersonel] = @GörevlendirilenPersonel) AND ([GörevGöster] = @GörevGöster))">
            <SelectParameters>
                <asp:SessionParameter Name="GörevlendirilenPersonel" SessionField="ID" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

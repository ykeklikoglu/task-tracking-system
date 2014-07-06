<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="TamamlananGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.TamamlananGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:Label ID="Label_uyarı" runat="server" Text="Lütfen Bir Seçim Yapınız." 
            Visible="False"></asp:Label>
    <br />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames= "GörevId"
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
        AllowPaging="True" AllowSorting="True" onrowcommand="GridView1_RowCommand" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                SortExpression="GörevId" />
            <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                SortExpression="Baslık" />
            <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
            <asp:BoundField DataField="GörevlendirilenPersonelİsim" 
                HeaderText="GörevlendirilenPersonelİsim" 
                SortExpression="GörevlendirilenPersonelİsim" />
            <asp:BoundField DataField="BeklenenBitisTarihi" 
                HeaderText="BeklenenBitisTarihi" SortExpression="BeklenenBitisTarihi" />
            <asp:BoundField DataField="TamamlanmaTarihi" HeaderText="TamamlanmaTarihi" 
                SortExpression="TamamlanmaTarihi" />
            <asp:TemplateField HeaderText="İncele">
                <ItemTemplate>
                    <asp:ImageButton ID="İncele" runat="server" CommandName="İncele" 
                        ImageUrl="~/İmages/İncele.png" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sil">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton_Sil" runat="server" CommandName="Sil" 
                        ImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                ShowCancelButton="False" ShowSelectButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Tamamlanan Görev Yok.
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
        SelectCommand="SELECT [GörevId], [Baslık], [Yorum], [GörevlendirilenPersonelİsim], [BeklenenBitisTarihi], [TamamlanmaTarihi] FROM [TamamlananGörevler] WHERE (([TarafındanAcıldıID] = @TarafındanAcıldıID) AND ([GörevGöster] = @GörevGöster))">
        <SelectParameters>
            <asp:SessionParameter Name="TarafındanAcıldıID" SessionField="ID" 
                Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>

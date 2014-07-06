<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="TümGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.TümGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                SortExpression="Baslık" />
            <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
            <asp:BoundField DataField="Verilistarihi" HeaderText="Verilistarihi" 
                SortExpression="Verilistarihi" />
            <asp:BoundField DataField="BeklenenBitisTarihi" 
                HeaderText="BeklenenBitisTarihi" SortExpression="BeklenenBitisTarihi" />
            <asp:BoundField DataField="TarafındanAcıldıİsim" 
                HeaderText="TarafındanAcıldıİsim" SortExpression="TarafındanAcıldıİsim" />
            <asp:BoundField DataField="GörevlendirilenPersonelİsim" 
                HeaderText="GörevlendirilenPersonelİsim" 
                SortExpression="GörevlendirilenPersonelİsim" />
            <asp:BoundField DataField="GörevinDurumu" HeaderText="GörevinDurumu" 
                SortExpression="GörevinDurumu" />
        </Columns>
        <EmptyDataTemplate>
            Aktif Görev Yok.
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
        SelectCommand="SELECT [Baslık], [Yorum], [Verilistarihi], [BeklenenBitisTarihi], [TarafındanAcıldıİsim], [GörevlendirilenPersonelİsim], [GörevinDurumu] FROM [Görevler] WHERE ([GörevGöster] = @GörevGöster)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

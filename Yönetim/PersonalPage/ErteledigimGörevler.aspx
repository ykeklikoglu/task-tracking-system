<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="ErteledigimGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.ErteledigimGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" DataSourceID="SqlDataSource1" 
            EmptyDataText="Ertelenen Görev Yok." GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                <asp:BoundField DataField="Verilistarihi" HeaderText="Verilistarihi" 
                    SortExpression="Verilistarihi" />
                <asp:BoundField DataField="BeklenenBitisTarihi" 
                    HeaderText="BeklenenBitisTarihi" SortExpression="BeklenenBitisTarihi" />
                <asp:BoundField DataField="ErtelemeTarihi" HeaderText="ErtelemeTarihi" 
                    SortExpression="ErtelemeTarihi" />
                <asp:BoundField DataField="ErtelenenTarih" HeaderText="ErtelenenTarih" 
                    SortExpression="ErtelenenTarih" />
                <asp:BoundField DataField="ErtelemeNedeni" HeaderText="ErtelemeNedeni" 
                    SortExpression="ErtelemeNedeni" />
                <asp:BoundField DataField="GörevinDurumu" HeaderText="GörevinDurumu" 
                    SortExpression="GörevinDurumu" />
                <asp:BoundField DataField="Tarih" HeaderText="Tarih" SortExpression="Tarih" />
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
            SelectCommand="SELECT [Baslık], [Yorum], [Verilistarihi], [BeklenenBitisTarihi], [ErtelemeTarihi], [ErtelenenTarih], [ErtelemeNedeni], [GörevinDurumu], [Tarih] FROM [ErtelenenGörevler] WHERE (([GörevGöster] = @GörevGöster) AND ([GörevlendirilenPersonel] = @GörevlendirilenPersonel))">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
                <asp:SessionParameter Name="GörevlendirilenPersonel" SessionField="ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

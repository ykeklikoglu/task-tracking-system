<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="ParçalananGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.ParçalananGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="GörevID" HeaderText="GörevID" 
                    SortExpression="GörevID" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                <asp:BoundField DataField="ParçalanmaTarihi" HeaderText="ParçalanmaTarihi" 
                    SortExpression="ParçalanmaTarihi" />
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="ParçalanmaNedeni" HeaderText="ParçalanmaNedeni" 
                    SortExpression="ParçalanmaNedeni" />
                <asp:BoundField DataField="GörevinDurumu" HeaderText="GörevinDurumu" 
                    SortExpression="GörevinDurumu" />
            </Columns>
            <EmptyDataTemplate>
                Parçalanan Görev Yok!
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
            
            SelectCommand="SELECT [GörevID], [Baslık], [Yorum], [ParçalanmaTarihi], [ParçalanmaNedeni], [GörevinDurumu] FROM [ParçalananGörevler] WHERE ([ParçalayanID] = @ParçalayanID) ">
            <SelectParameters>
                <asp:SessionParameter Name="ParçalayanID" SessionField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

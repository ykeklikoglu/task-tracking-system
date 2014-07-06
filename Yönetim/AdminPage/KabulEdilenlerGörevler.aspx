<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="KabulEdilenlerGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.KabulEdilenlerGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="GörevId"
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
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
                <asp:BoundField DataField="Oncelik" HeaderText="Oncelik" 
                    SortExpression="Oncelik" />
                <asp:BoundField DataField="GörevDurum" HeaderText="GörevDurum" 
                    SortExpression="GörevDurum" />
                <asp:BoundField DataField="GörevlendirilenPersonelİsim" 
                    HeaderText="GörevlendirilenPersonelİsim" 
                    SortExpression="GörevlendirilenPersonelİsim" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                    ShowSelectButton="True" />
            </Columns>
            <EmptyDataTemplate>
                Kabul Edilen Görev Yok.
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
            
            SelectCommand="SELECT [GörevId], [Baslık], [Yorum], [Verilistarihi], [BeklenenBitisTarihi], [Oncelik], [GörevDurum], [GörevlendirilenPersonelİsim] FROM [KabulEdilenGörevler] WHERE (([TarafındanAcıldıID] = @TarafındanAcıldıID) AND ([GörevGöster] = @GörevGöster)) ORDER BY [BeklenenBitisTarihi], [Verilistarihi] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="TarafındanAcıldıID" SessionField="ID" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

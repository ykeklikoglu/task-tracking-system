<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="SilinenGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.SilinenGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
    <asp:Label ID="Label_Sonuc" runat="server" Text="Label_Sonuc" Visible="False"></asp:Label>
    <br />
        <asp:GridView ID="GridView_SilinenGörevler" runat="server" BackColor="White" DataKeyNames="GörevId"
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            AutoGenerateColumns="False" Height="138px" Width="655px" 
            onrowcommand="GridView_SilinenGörevler_RowCommand" AllowPaging="True" 
        AllowSorting="True" DataSourceID="SqlDataSource1" 
            onselectedindexchanged="SelectedIndexChanged" 
            EmptyDataText="Silinen Görev Yok.">
           <Columns>
                <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                    SortExpression="GörevId" Visible="False" />
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                <asp:BoundField DataField="SilinenYer" HeaderText="SilinenYer" 
                    SortExpression="SilinenYer" />
                <asp:BoundField DataField="SilinmeTarihi" HeaderText="SilinmeTarihi" 
                    SortExpression="SilinmeTarihi" />
                <asp:TemplateField HeaderText="Geri Al">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="GeriAl" 
                            ImageUrl="~/İmages/icon_update.gif" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                    ShowSelectButton="True" />
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
        SelectCommand="SELECT [Baslık], [Yorum], [SilinenYer], [SilinmeTarihi], [GörevId] FROM [SilinenGörevler] WHERE (([GörevlendirilenPersonel] = @GörevlendirilenPersonel) AND ([GörevGöster] = @GörevGöster))">
        <SelectParameters>
            <asp:SessionParameter Name="GörevlendirilenPersonel" SessionField="ID" 
                Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
</p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="ReddedilenGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.ReddedilenGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
        <asp:Label ID="Label_Uyarı" runat="server" 
            Text="Lütfen Secilecek Görevini Seciniz." Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="GörevId"
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" Width="653px" 
            EmptyDataText="Reddedilen Görev Yok.">
            <Columns>
                <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                    SortExpression="GörevId" Visible="False" />
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" 
                    SortExpression="Yorum" />
                <asp:BoundField DataField="ReddedilmeTarihi" HeaderText="ReddedilmeTarihi" 
                    SortExpression="ReddedilmeTarihi" />
                <asp:BoundField DataField="ReddetmeNedeni" HeaderText="ReddetmeNedeni" 
                    SortExpression="ReddetmeNedeni" />
                <asp:BoundField DataField="GörevDurum" HeaderText="GörevDurum" 
                    SortExpression="GörevDurum" />
                <asp:TemplateField HeaderText="Sil" Visible="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton_Sil" runat="server" CommandName="Sil" 
                            ImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" onclick="Sil" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                    ShowCancelButton="False" ShowSelectButton="True" />
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

<SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            
            
            SelectCommand="SELECT [GörevId], [Baslık], [Yorum], [ReddedilmeTarihi], [ReddetmeNedeni], [GörevDurum] FROM [ReddedilenGörevler] WHERE (([GörevlendirilenPersonel] = @GörevlendirilenPersonel) AND ([GörevGöster] = @GörevGöster))">
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

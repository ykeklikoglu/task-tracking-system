<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="ParçalananGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.ParçalananGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label_Uyarı" runat="server" Text="Lütfen Seçim Yapınız." 
            Visible="False"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="GörevId,Sıra"
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            onrowcommand="GridView1_RowCommand" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="GörevID" HeaderText="GörevID" 
                    SortExpression="GörevID" />
                <asp:BoundField DataField="Sıra" HeaderText="Sıra" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Sıra" />
                <asp:BoundField DataField="Baslık" HeaderText="Baslık" 
                    SortExpression="Baslık" />
                <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                <asp:BoundField DataField="ParçalanmaTarihi" HeaderText="ParçalanmaTarihi" 
                    SortExpression="ParçalanmaTarihi" />
                <asp:BoundField DataField="ParçalanmaNedeni" HeaderText="ParçalanmaNedeni" 
                    SortExpression="ParçalanmaNedeni" />
                <asp:BoundField DataField="BeklenenBitisTarihi" 
                    HeaderText="BeklenenBitisTarihi" SortExpression="BeklenenBitisTarihi" />
                <asp:BoundField DataField="Parcalayanİsim" HeaderText="Parcalayanİsim" 
                    SortExpression="Parcalayanİsim" />
                <asp:BoundField DataField="GörevlendirilenPersonel" 
                    HeaderText="GörevlendirilenPersonel" SortExpression="GörevlendirilenPersonel" />
                <asp:TemplateField HeaderText="Kabul Et">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Kabul" 
                            ImageUrl="~/İmages/like_icon.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reddet">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Reddet" 
                            ImageUrl="~/İmages/unlike_icon.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" ShowSelectButton="True" 
                    UpdateImageUrl="~/İmages/selectIcon.jpg" />
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
            
            
            
            SelectCommand="SELECT [GörevID], [Sıra], [Baslık], [Yorum], [ParçalanmaTarihi], [ParçalanmaNedeni], [BeklenenBitisTarihi], [Parcalayanİsim], [GörevlendirilenPersonel] FROM [ParçalananGörevler] WHERE (([TarafındanAcıldıID] = @TarafındanAcıldıID) AND ([GörevGöster] = @GörevGöster))">
            <SelectParameters>
                <asp:SessionParameter Name="TarafındanAcıldıID" SessionField="ID" 
                    Type="Int32" DefaultValue="2" />
                <asp:Parameter DefaultValue="0" Name="GörevGöster" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="YeniGörevlerim.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.YeniGörevlerim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label_Secim" runat="server" Text="Lütfen Seçim Yapınız." 
        Visible="False"></asp:Label>
    <asp:GridView ID="Gridview_YeniGörev" runat="server" 
            AutoGenerateColumns="False" BackImageUrl="~/İmages/active-logosoluk.gif" 
            BorderColor="#336666" Height="351px" 
        Width="766px" AllowPaging="True" BackColor="White" BorderStyle="Double" 
        BorderWidth="3px" CellPadding="4" DataKeyNames="GörevId" PageSize="4" 
        style="margin-left: 125px; margin-right: 0px;" 
        GridLines="Horizontal" 
        onselectedindexchanged="Gridview_YeniGörev_SelectedIndexChanged" 
        onpageindexchanging="Gridview_YeniGörev_PageIndexChanging" 
        EmptyDataText="Yeni Göreviniz Yok." Font-Italic="False">
        <AlternatingRowStyle BorderColor="Red" />
        <Columns>
            <asp:TemplateField HeaderText="Görev Başlığı">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Baslık") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Veriliş Tarihi">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("Verilistarihi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bitiş Tarihi">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("BeklenenBitisTarihi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Görevin Durumu">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("GörevinDurumu") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Veren Yönetici">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%#Bind("TarafındanAcıldı") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                SelectImageUrl="~/İmages/selectIcon.jpg" HeaderText="Detay" />
        </Columns>
        <EditRowStyle BorderColor="Red" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" BorderColor="Red" BorderStyle="Double" 
            Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="White" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BorderColor="Red" BackColor="#275353" />
    </asp:GridView>
    <p style="margin-left: 40px">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            
            
            
            SelectCommand="SELECT [GörevId],[Sıra],[ParçalanmaTarihi], [ParçalanmaBitişTarihi], [Parcalayanİsim], [ParçalanmaNedeni], [GörevinDurumu] FROM [ParçalananGörevler] WHERE (([GörevlendirilenPersonel] = @GörevlendirilenPersonel) AND ([GörevGöster] = @GörevGöster) AND Silinme=0)">
            <SelectParameters>
                <asp:SessionParameter Name="GörevlendirilenPersonel" SessionField="ID" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="margin-left: 40px">
        <asp:GridView ID="GridView_Parçalama" runat="server" AllowPaging="True" DataKeyNames="GörevId,Sıra"
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            style="margin-left: 128px; margin-right: 4px" Width="762px" 
            onrowcommand="GridView_Parçalama_RowCommand" 
            onselectedindexchanged="GridView_Parçalama_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                    SortExpression="GörevId" />
                <asp:BoundField DataField="Sıra" HeaderText="Sıra" 
                    SortExpression="Sıra" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="ParçalanmaTarihi" HeaderText="ParçalanmaTarihi" 
                    SortExpression="ParçalanmaTarihi" />
                <asp:BoundField DataField="ParçalanmaBitişTarihi" HeaderText="ParçalanmaBitişTarihi" 
                    SortExpression="ParçalanmaBitişTarihi" />
                <asp:BoundField DataField="Parcalayanİsim" HeaderText="Parcalayanİsim" 
                    SortExpression="Parcalayanİsim" />
                <asp:BoundField DataField="ParçalanmaNedeni" HeaderText="ParçalanmaNedeni" 
                    SortExpression="ParçalanmaNedeni" />
                <asp:BoundField DataField="GörevinDurumu" HeaderText="GörevinDurumu" 
                    SortExpression="GörevinDurumu" />
                <asp:TemplateField HeaderText="Tamamla">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Tamamla" 
                            Height="36px" ImageUrl="~/İmages/icon_success.gif" Width="37px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reddet">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Reddet" 
                            ImageUrl="~/İmages/unlike_icon.png" />
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
    <br />
    </p>
</asp:Content>

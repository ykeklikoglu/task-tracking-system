<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="KabulEttigimGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.KabulEtigimGörevler" %><%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style11
        {
            width: 32px;
            height: 32px;
        }
        .style12
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <span class="style12">
        <br />
    </p>
    <p>
        &nbsp;</p>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Bekleyiniz.
<img class="style11" src="../../İmages/Yukleniyor.gif" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="0" 
                CssClass="style12" DataKeyNames="GörevId" DataSourceID="SqlDataSource1" 
                EmptyDataText="Kabul Edilen Görev Yok." GridLines="Horizontal" Height="96px" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="2" 
                Width="725px">
                <Columns>
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
                    <asp:BoundField DataField="TarafındanAcıldıİsim" 
                        HeaderText="TarafındanAcıldıİsim" SortExpression="TarafındanAcıldıİsim" />
                    <asp:BoundField DataField="GörevId" HeaderText="GörevId" 
                        SortExpression="GörevId" Visible="False" />
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
            &nbsp;&nbsp;
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            SelectCommand="SELECT [Baslık], [Yorum], [Verilistarihi], [BeklenenBitisTarihi], [Oncelik], [GörevDurum], [GörevlendirilenPersonelİsim], [TarafındanAcıldıİsim], [GörevId] FROM [KabulEdilenGörevler] WHERE (([GörevlendirilenPersonel] = @GörevlendirilenPersonel) AND ([GörevGöster] = @GörevGöster))">
            <SelectParameters>
                <asp:SessionParameter Name="GörevlendirilenPersonel" SessionField="ID" 
                    Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="GörevGöster" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

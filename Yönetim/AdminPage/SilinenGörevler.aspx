<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="SilinenGörevler.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.SilinenGörevler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style7
        {
            width: 32px;
            height: 32px;
        }
        .style8
        {
            font-size:medium;
        }
        .style10
        {
            color: #FFFFFF;
        }
        .style11
        {
            width: 32px;
            height: 32px;
        }
        .style12
        {
            width: 32px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="margin-left: 440px">
        <asp:Label ID="Label_Sonuc" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <span class="style10"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; İşle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            ştiriliyor. Lütfen Bekleyi<img 
    class="style12" src="../../İmages/Yukleniyor.gif" />niz. </em>
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </ProgressTemplate>
    </asp:UpdateProgress>
    <p>
        &nbsp;</p>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<br />
            <asp:GridView ID="GridView_SilinenGörevler" runat="server" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="GörevId" 
                Height="138px" onrowcommand="GridView_SilinenGörevler_RowCommand" 
                onselectedindexchanged="GridView_SilinenGörevler_SelectedIndexChanged" 
                Width="16px">
                <Columns>
                    <asp:TemplateField HeaderText="GörevId">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("GörevId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Yorum">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% #Bind("Yorum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BeklenenBitisTarihi">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% #Bind("BeklenenBitisTarihi") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verilistarihi">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% #Bind("Verilistarihi") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TarafındanAcıldıİsim">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" 
                                Text='<% #Bind("TarafındanAcıldıİsim") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Oncelik">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<% #Bind("Oncelik") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Baslık">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<% #Bind("Baslık") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="GörevlendirilenPersonelİsim">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" 
                                Text='<% #Bind("GörevlendirilenPersonelİsim") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Silinen Yer">
                        <ItemTemplate>
                            <asp:Label ID="Label_silinenYer" runat="server" Text='<%#Bind("SilinenYer")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SilinmeTarihi">
                        <ItemTemplate>
                            <asp:Label ID="LabelSilinmeTarihi" runat="server" 
                                Text='<%#Bind("SilinmeTarihi")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sil">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Sil" 
                                ImageUrl="~/İmages/trash_bin_icon-218931-1236789704.jpeg" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Geri Al">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="GeriAl" 
                                Height="22px" ImageUrl="~/İmages/icon_update.gif" Width="27px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/İmages/selectIcon.jpg" 
                        ShowSelectButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    Silinen Görevler Kutusu Boş.
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
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
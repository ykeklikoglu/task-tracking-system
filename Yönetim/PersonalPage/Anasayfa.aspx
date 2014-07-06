<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/PersonPage_AnaTablo.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.PersonalPage.Anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_deneme" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="width: 302px; margin-left: 0px; height: 195px; margin-top: 0px;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            
            
            SelectCommand="SELECT [Tarih], [Konu] FROM [Duyurular] WHERE ([Tarih] &gt;= @Tarih)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="Tarih" PropertyName="Text" 
                    Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <marquee scrollamount="1" scrolldelay="60" scroolDelay="80" scrollAmount="2" direction="up" loop="99999" 
            onmouseout="this.start()" onmouseover="this.stop()" 
            style="height: 337px; width: 219px; text-align:center;"

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

            <ItemTemplate>

            <span id="duyuru"><tt><%# Eval("Konu")  %></tt>  <br /><br/></span>        

            </ItemTemplate>

        </asp:Repeater></marquee><asp:Label ID="Label1" runat="server" Text="Label" 
            Visible="False"></asp:Label>
    </p>
</asp:Content>

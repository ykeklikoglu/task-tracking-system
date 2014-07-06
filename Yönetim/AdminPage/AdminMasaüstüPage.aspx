<%@ Page Title="" Language="C#" MasterPageFile="~/Master page/MasterAdminPage.Master" AutoEventWireup="true" CodeBehind="AdminMasaüstüPage.aspx.cs" Inherits="Görev_Takip_sistemim.Yönetim.AdminPage.AdminMasaüstüPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 220px;
        }
        .style9
        {
            width: 220px;
            height: 65px;
        }
        .style10
        {
            height: 65px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="height: 19px; width: 730px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        1 TL=<asp:Label ID="MessageBox" runat="server" ForeColor="Red" 
            Text="MessageBox1"></asp:Label>
&nbsp;EURO</p>
    <p style="height: 19px; width: 730px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        1TL=<asp:Label ID="MessageBox2" runat="server" ForeColor="Red" 
            Text="MessageBox2"></asp:Label>
&nbsp;DOLAR<br />
    </p>
</asp:Content>
<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder4">
        <p>
            &nbsp;<p style="width: 302px; margin-left: 0px; height: 195px; margin-top: 0px;" 
            align="right">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Görev Takip SistemiConnectionString %>" 
            
            
            SelectCommand="SELECT [Konu] FROM [Duyurular]">
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
    </p></p>
    </asp:Content>


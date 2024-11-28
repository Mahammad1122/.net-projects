<%@ Page Title="" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ActivityProject.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="overflow-x:hidden;padding-left:5px">
        <h2>User Details:</h2> <br/>
        <asp:DetailsView ID="dlUser" runat="server" >
        </asp:DetailsView>
        <br/>
        <br/>
        <h2>Borrowed Books</h2> <br />
        <asp:GridView ID="gvBooks" runat="server">
        </asp:GridView>
    </div>
</asp:Content>

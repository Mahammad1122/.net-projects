<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="allBooks.aspx.cs" Inherits="ActivityProject.admin.allBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .item-wrapper {
    display: inline-block;
    width: 200px; /* Adjust the width as needed */
    height:270px;
    margin: 5px; /* Add some spacing between items */
    border: 1px solid #ddd; /* Optional: Add a border */
    padding: 10px; /* Optional: Add some padding */
    word-wrap: break-word; /* Ensure long words are wrapped */
}

        
    </style>
    <script type="text/javascript">
        function btnDeleteBook(id) {
            if (confirm("Are you sure you want to delete book?")) {
                window.location.href = "allBooks.aspx?bookId=" + id;
            }
        }
        function btnEditBook(id) {
            window.location.href = "editBooks.aspx?bookId=" + id;            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="overflow-x:hidden;padding-left:5px">
        <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblSearch" runat="server" Text="Search:" Font-Size="12"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearch" runat="server" Width="172px" Height="18px"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Height="20" Width="80"/>
                            <asp:Button ID="btnClear" runat="server" Text="Clear" Visible="false" Height="20" Width="80"
                 onclick="btnClear_Click"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNotFound" runat="server"></asp:Label>
                        </td>
                    </tr>
         </table>
         <div style="margin:10px 0px;">
            <span style="font-size:18px;">Category/Genre:</span><asp:RadioButtonList ID="radioListGenre" runat="server" 
            RepeatDirection="Horizontal" RepeatColumns="12" CellPadding="10" 
            CellSpacing="5" AutoPostBack="true" 
            onselectedindexchanged="radioListGenre_SelectedIndexChanged">
                        </asp:RadioButtonList> 
         </div>
         <asp:DataList ID="dlSearchBook" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
            style="margin-top: 0">
            <HeaderTemplate>
                <h3>Search Results:</h3>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="item-wrapper">
                  <table>
                       <tr>
                            <td colspan="2"> <asp:Image ID="imgSearchBook" ImageUrl='<%# Eval("book_img_url") %>' Width="120px" Height="150px" runat="server" /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Title : <asp:Label ID="lbSearchBookName" runat="server" Text='<%# Eval("title") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Author :  <asp:Label ID="lbSearchAuthor" runat="server" Text='<%# Eval("author") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Genre :  <asp:Label ID="lblSearchGenre" runat="server" Text='<%# Eval("genre") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Isbn :  <asp:Label ID="lblSearchIsbn" runat="server" Text='<%# Eval("isbn") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Quantity :  <asp:Label ID="lblsearchQuantity" runat="server" Text='<%# Eval("total_books") %>' /> </td>
                       </tr>
                       <tr>
                            <td> 
                                <asp:Button ID="btnSearchDeleteBook" runat="server" Text="Delete Book" OnClientClick='<%# "btnDeleteBook("+Eval("id")+");return false;" %>' />
                            </td>
                            <td>
                                <asp:Button ID="btnSearchEditBook" runat="server" Text="Edit Book" OnClientClick='<%# "btnEditBook("+Eval("id")+");return false;" %>' />
                            </td>
                       </tr>
                  </table>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="dlBooks" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" 
            style="margin-top: 0">
             <HeaderTemplate>
                <h3 style="padding-left:5px;font-size:20px">Available Books:</h3>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="item-wrapper">
                  <table width="100%">
                       <tr>
                            <td colspan="2"> <asp:Image ID="imgBook" ImageUrl='<%# Eval("book_img_url") %>' Width="120px" Height="150px" runat="server" /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Title : <asp:Label ID="lbBookName" runat="server" Text='<%# Eval("title") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Author :  <asp:Label ID="lbAuthor" runat="server" Text='<%# Eval("author") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Genre :  <asp:Label ID="lblGenre" runat="server" Text='<%# Eval("genre") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Isbn :  <asp:Label ID="lblIsbn" runat="server" Text='<%# Eval("isbn") %>' /> </td>
                       </tr>
                       <tr>
                            <td colspan="2"> Quantity :  <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("total_books") %>' /> </td>
                       </tr>
                       <tr>
                             <td> 
                                <asp:Button ID="btnDeleteBook" runat="server" Text="Delete Book" OnClientClick='<%# "btnDeleteBook("+Eval("id")+");return false;" %>' />
                            </td>
                            <td>
                                <asp:Button ID="btnEditBook" runat="server" Text="Edit Book" OnClientClick='<%# "btnEditBook("+Eval("id")+");return false;" %>' />
                            </td>
                       </tr>
                  </table>
                  </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="addBook.aspx.cs" Inherits="ActivityProject.admin.addBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
      <table cellspacing="10px" >
        <tr>
            <th colspan="2" style="padding:10px;font-size:20px;">Add Book</th>
            <th></th>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="172px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="titleRequiredField" ControlToValidate="txtTitle" runat="server" ErrorMessage="Title is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAuthor" runat="server" Text="Author:"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtAuthor" runat="server" Width="172px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtAuthor" runat="server" ErrorMessage="Author is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblIsbn" runat="server" Text="Isbn:" ></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtIsbn" runat="server" Width="172px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="isbnRequiredField" ControlToValidate="txtIsbn" runat="server" ErrorMessage="Isbn is Required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="isbnRange" ControlToValidate="txtIsbn" MinimumValue="1111111111111" MaximumValue="9999999999999" runat="server" ErrorMessage="Isbn must be 13 digit"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtGenre"  runat="server" Width="172px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="genreField" ControlToValidate="txtGenre" runat="server" ErrorMessage="Genre is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" Width="172px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="QuantityRequiredField" ControlToValidate="txtQuantity" runat="server" ErrorMessage="Quantity is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBookImg" runat="server" Text="Book Image"></asp:Label>    
            </td>
            <td>
                <asp:FileUpload ID="fuBookImg" runat="server" Width="172px" Height="22px" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="bookImgField" ControlToValidate="fuBookImg" runat="server" ErrorMessage="Image is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnAddBook" runat="server" Text="Add Book" Height="24" Width="100"
                    onclick="btnAddBook_Click" />
            </td>
        </tr>
      </table>
    </div>
</asp:Content>

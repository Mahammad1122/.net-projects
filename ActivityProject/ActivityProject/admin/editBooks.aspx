<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editBooks.aspx.cs" Inherits="ActivityProject.admin.editBooks" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Book</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <table cellspacing="10px">
        <tr>
            <th colspan="2">Edit Book</th>
            <th></th>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtAuthor" runat="server" ErrorMessage="Author is Required" ForeColor="red"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblIsbn" runat="server" Text="Isbn:"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtIsbn" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="isbnRequiredField" ControlToValidate="txtIsbn" runat="server" ErrorMessage="Isbn is Required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="isbnRange" ControlToValidate="txtIsbn" MinimumValue="1111111111111" MaximumValue="9999999999999" runat="server" ErrorMessage="Isbn must be 13 digit" ForeColor="Red"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtGenre"  runat="server"></asp:TextBox>
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
                <asp:TextBox ID="txtQuantity" TextMode="Number" runat="server"></asp:TextBox>
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
                <asp:Image ID="imgBook" Width="120px" Height="150px" runat="server" />
                <br />
                <asp:FileUpload ID="fuBookImg" runat="server" /> 
                <asp:Button ID="btnUpdate" runat="server" Text="Update Image" 
                    onclick="btnUpdate_Click" />
            </td>
            <td>
                             
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnEditBook" runat="server" Text="Edit Book" 
                    onclick="btnEditBook_Click" />
            </td>
            <td>

            </td>
        </tr>
      </table>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userDetails.aspx.cs" Inherits="ActivityProject.admin.userDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>User Details:</h2> <br/>
        <asp:DetailsView ID="dlUser" runat="server" >
        </asp:DetailsView>
        <br/>
        <br/>
        <h2>Borrowed Books</h2> <br />
        <asp:GridView ID="gvBooks" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>

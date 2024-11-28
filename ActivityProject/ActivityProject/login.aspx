<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ActivityProject.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        ul
        {
            margin:0;
            padding:0;
            text-align:left;   
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="10px" cellspacing="0" align="center">
            <thead>
                <tr>
                    <th colspan="2" >
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            Width="224px" />
                        <asp:RegularExpressionValidator ID="emailRegex" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Email format is not valid" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </th>
                </tr>
                <tr>
                    <th colspan="2"> Login </th> 
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="emailRequiredField" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required" Forecolor="red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequiredField" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is Required" ForeColor="red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="hlRegister" NavigateUrl="~/registration.aspx" runat="server">Not registered?</asp:HyperLink>
                    </td>
                    <td align="right">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" 
                            onclick="btnLogin_Click" />
                    </td>
                </tr>
                <tr align="center" >
                    <td colspan="2">
                        <asp:CustomValidator ID="EmailCustomValidator" OnServerValidate="checkCredintial" ControlToValidate="txtEmail" runat="server" ErrorMessage="Invalid Credintials" ForeColor="Red"></asp:CustomValidator>    <br/>                    
                        <asp:CustomValidator ID="PasswordCustomValidator" OnServerValidate="checkCredintial" ControlToValidate="txtPassword" runat="server" ErrorMessage="Invalid Credintials" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>

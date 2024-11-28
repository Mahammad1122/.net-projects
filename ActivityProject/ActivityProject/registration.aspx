<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="ActivityProject.registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registation</title>
    <style>
         table td:first-child
         {
            text-align:right;   
          }
          .validSummary
          {
                display:flex;
                justify-content:center;
                flex-flow:column wrap;
                align-items:center;
          }
          ul
          {
            margin:0px;
            padding:0px;
            text-align:left;
           }
    </style>
</head>
<body style="height: 394px">
    <form id="form1" runat="server">
    <div>
        <table cellpadding="5px" align="center">
            <thead>
                <tr>
                    <th colspan="2">Registration</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="User Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField" ControlToValidate="txtName" runat="server" ErrorMessage="User name is required" ForeColor="red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="E-Mail:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="emailRequiredField" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required" ForeColor=red>*</asp:RequiredFieldValidator>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequiredField" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is required" ForeColor="Red"> *</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="passwordCompare" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" runat="server" ErrorMessage="Password does not match" ForeColor='Red'>*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="hlLogin" NavigateUrl="~/login.aspx" runat="server">Have an Account?</asp:HyperLink>                        
                    </td>
                    <td align="right">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" 
                            onclick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                         <asp:RegularExpressionValidator ID="emailRegex" ControlToValidate="txtEmail" 
                            runat="server" ErrorMessage="* Entter valid email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="validSummary">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red" 
                            style="text-align:center;" Height="38px" Width="182px"/>
        </div>
    </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="students.aspx.cs" Inherits="ActivityProject.admin.students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function btnShowDetail(id) {
             window.location.href = "userDetails.aspx?userId=" + id;
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:10px">
        <table cellpadding="5px" align="center">
            <thead>
                <tr>
                    <th colspan="2" style="padding:10px;font-size:20px;">Add Student</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="padding-bottom:10px">
                        <asp:Label ID="lblName" runat="server" Text="User Name:"></asp:Label>
                    </td>
                    <td style="padding-bottom:10px">
                        <asp:TextBox ID="txtName" runat="server" Width="172px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredField" ControlToValidate="txtName" runat="server" ErrorMessage="User name is required" ForeColor="red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom:10px">
                        <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" ></asp:Label>
                    </td>
                    <td style="padding-bottom:10px">
                        <asp:TextBox ID="txtEmail" runat="server" Width="172px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="emailRequiredField" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is Required" ForeColor=red>*</asp:RequiredFieldValidator>
                       
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom:10px">
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td style="padding-bottom:10px">
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="172px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequiredField" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is required" ForeColor="Red"> *</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom:10px">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td style="padding-bottom:10px">
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Width="172px" Height="22px"></asp:TextBox>
                        <asp:CompareValidator ID="passwordCompare" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" runat="server" ErrorMessage="Password does not match" ForeColor='Red'>*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" Height="24" Width="100" />
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
        <asp:DataList ID="dlStudents" runat="server">
            <HeaderTemplate>
                <table border="1px" style="border-collapse:collapse">
                        <thead>
                            <tr>   
                                <th style="padding:10px">Id</th>
                                <th style="padding:10px">User Name </th>
                                <th style="padding:10px">Email</th>
                                <th style="padding:10px">Created At</th>
                                <th style="padding:10px">Action</th>
                            </tr>
                        </thead>
            </HeaderTemplate>
            <ItemTemplate>
                        <tbody>
                            <tr>
                                <td style="padding:5px"> <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblDate" runat="server" Text='<%# Eval("created_at") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Button ID="btnShowDetail" runat="server" Text="View Details" OnClientClick='<%# "btnShowDetail("+Eval("id")+");return false;" %>' /> </td>
                            </tr>
                        </tbody>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

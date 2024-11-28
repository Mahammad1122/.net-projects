<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="issueBook.aspx.cs" Inherits="ActivityProject.admin.issueBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function btnReturn(id) {
            if (confirm("Are you sure you want to return book?")) {
                window.location.href = "issueBook.aspx?bookId="+id;
            }
        }
    </script>
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:10px">
        <table>
            <tr>
                <th colspan="3" style="padding:10px;font-size:20px;">Issue Book</th>
            </tr>
            <tr>
                <td style="padding-bottom:10px" class="style1">
                    <asp:Label ID="lblBook" runat="server" Text="Book:"></asp:Label>
                </td>
                <td style="padding-bottom:10px">
                    <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="true" Width="176px" Height="26px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="bookRequired" ControlToValidate="ddlBooks" runat="server" ErrorMessage="Select Book" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-bottom:10px" class="style1">
                    <asp:Label ID="lblUserId" runat="server" Text="User Id:"></asp:Label>
                </td>
                <td style="padding-bottom:10px">
                    <asp:TextBox ID="txtUserId" runat="server" Width="172px" Height="22px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="userIdRequired" ControlToValidate="txtUserId" runat="server" ErrorMessage="User Id is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-bottom:10px" class="style1">
                    <asp:Label ID="lblDueDate" runat="server" Text="Due Date:" ></asp:Label>
                </td>
                <td style="padding-bottom:10px">
                    <asp:TextBox ID="txtDueDate" TextMode="Date" runat="server" Width="172px" Height="22px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="dueDateRequired" ControlToValidate="txtDueDate" runat="server" ErrorMessage="Due Date is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="btnIssueBook" runat="server" Text="Issue Book" Height="24" Width="100"
                        onclick="btnIssueBook_Click" />
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td colspan="2"> <asp:Label ID="lblMessage" runat="server" ForeColor="Red"/> </td>
            </tr>
        </table>
        <br/>
        <br/>
        <h3> Issued Books: </h3>
        <br />
        <asp:DataList ID="dlIssueBooks" runat="server" >
            <HeaderTemplate>
                <table border="1px" style="border-collapse:collapse">
                            <tr>   
                                <th style="padding:10px">Id</th>
                                <th style="padding:10px">Book Name</th>
                                <th style="padding:10px">Issued By</th>
                                <th style="padding:10px">Issue Date</th>
                                <th style="padding:10px">Due Date</th>
                                <th style="padding:10px">Return Date</th>
                                <th style="padding:10px">Action</th>
                            </tr>
            </HeaderTemplate>
            <ItemTemplate>
                            <tr>
                                <td style="padding:5px"> <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("book_name") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblIssueBy" runat="server" Text='<%# Eval("user_name") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblIssueDate" runat="server" Text='<%# Eval("borrowed_date") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblDueDate" runat="server" Text='<%# Eval("due_date") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Label ID="lblReturnDate" runat="server" Text='<%# Eval("return_date") == DBNull.Value ? "Book not Returned" : Eval("return_date") %>' ></asp:Label> </td>
                                <td style="padding:5px"> <asp:Button ID="btnReturnBook" runat="server" Text="Return Book" OnClientClick='<%# "btnReturn("+Eval("id")+");return false;" %>' /> </td>
                            </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </table>
            </FooterTemplate>
        </asp:DataList>
    </div>
</asp:Content>

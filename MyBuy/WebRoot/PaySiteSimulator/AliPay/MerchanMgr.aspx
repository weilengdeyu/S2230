<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchanMgr.aspx.cs" Inherits="PaySiteSimulator.AliPay.MerchanMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商户管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="PaySiteSimulator.AliPay.DataSetAliPayTableAdapters.MerchanTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="MerchNumber" Type="String" />
                <asp:Parameter Name="MerchKey" Type="String" />
                <asp:Parameter Name="MerchName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MerchNumber" Type="String" />
                <asp:Parameter Name="MerchKey" Type="String" />
                <asp:Parameter Name="MerchName" Type="String" />
                <asp:Parameter Name="Original_Id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
    </div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" 
        DataSourceID="ObjectDataSource1" EnableModelValidation="True" 
        InsertItemPosition="LastItem">
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchNumberTextBox" runat="server" 
                        Text='<%# Bind("MerchNumber") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchKeyTextBox" runat="server" 
                        Text='<%# Bind("MerchKey") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchNameTextBox" runat="server" 
                        Text='<%# Bind("MerchName") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                </td>
                <td>
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchNumberTextBox" runat="server" 
                        Text='<%# Bind("MerchNumber") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchKeyTextBox" runat="server" 
                        Text='<%# Bind("MerchKey") %>' />
                </td>
                <td>
                    <asp:TextBox ID="MerchNameTextBox" runat="server" 
                        Text='<%# Bind("MerchName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="MerchNumberLabel" runat="server" 
                        Text='<%# Eval("MerchNumber") %>' />
                </td>
                <td>
                    <asp:Label ID="MerchKeyLabel" runat="server" Text='<%# Eval("MerchKey") %>' />
                </td>
                <td>
                    <asp:Label ID="MerchNameLabel" runat="server" Text='<%# Eval("MerchName") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    Id</th>
                                <th runat="server">
                                    商户号</th>
                                <th runat="server">
                                    密钥</th>
                                <th runat="server">
                                    商户名</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    </form>
</body>
</html>

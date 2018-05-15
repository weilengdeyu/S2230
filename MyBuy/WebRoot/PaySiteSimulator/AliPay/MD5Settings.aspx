<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MD5Settings.aspx.cs" Inherits="PaySiteSimulator.AliPay.MD5Settings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商户后台</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Text="商户名："></asp:Label>
        <asp:Label ID="labelName" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="商户密钥"></asp:Label>
        <asp:TextBox ID="txtkey" runat="server"></asp:TextBox>
        <asp:Button ID="btnChange" runat="server" onclick="btnChange_Click" Text="修改" />
    
    </div>
    </form>
</body>
</html>

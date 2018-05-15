<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MerchanLogin.aspx.cs" Inherits="PaySiteSimulator.AliPay.MerchanLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商户后台登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" GroupingText="登录">
            商户号：<asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
            <br />
            密码：<asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="登录" onclick="btnLogin_Click" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

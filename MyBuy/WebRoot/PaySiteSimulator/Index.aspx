<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PaySiteSimulator._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/AliPay/MerchanLogin.aspx">支付宝商户后台</asp:HyperLink>
    
        <br />
        <br />
    
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/AliPay/MerchanMgr.aspx">支付宝网站后台（支付宝工作人员用）</asp:HyperLink>
    
        <br />
        <br />
    
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="~/ChinaBank/MerchanLogin.aspx">网银在线商户后台</asp:HyperLink>
    
        <br />
        <br />
    
        <asp:HyperLink ID="HyperLink4" runat="server" 
            NavigateUrl="~/ChinaBank/MerchanMgr.aspx">网银在线网站后台（网银在线工作人员用）</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayPage.aspx.cs" Inherits="PaySiteSimulator.ChinaBank.PayPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 436px;
            height: 54px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <center>
            <img alt="" class="style1" src="chinabanklogo.jpg" /><br />
            网银在线支付平台（模拟平台）</center><br />
    
        <asp:Label ID="Label1" runat="server" Text="帐号"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        付款给商户【<asp:Literal ID="litMerch" runat="server"></asp:Literal>
        】【<asp:Literal ID="litAmount" runat="server"></asp:Literal>
        】元，订单号【<asp:Literal ID="litOid" runat="server"></asp:Literal>
        】<br />
        <asp:Button ID="btnPay" runat="server" onclick="btnPay_Click" Text="付款" />
        <div>这是测试环境，不是真实的支付环境，因此不会从您的帐户中扣钱，帐号、密码随便填就可以！</div>
    </div>
    </form>
</body>
</html>

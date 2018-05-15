<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>易买网 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="scripts/function.js"></script>
<style type="text/css">
  .info{
  
    font-size: 14px;
  height: 40px;
  line-height: 40px;
  float: left;
  }
  #tt{
  
    position: fixed;
  bottom: 0;
  left: 0;
  z-index: 100;
  width: 100%;
  background-color: #f0f0f0;
  width:100%;
  height:50px;
  }
  
  #order-submit{
  background-color: #e00;
    line-height: 52px;
  color: #fff;
  text-align: center;
  font-size: 18px;
  font-family: '\5fae\8f6f\96c5\9ed1';
  }
  
  .myimg:hover{
    border:2px solid red;
  }
</style>
<script type="text/javascript">
  function submit_Order(){
	  form.submit();
  }
 $(function(){
	 
 });
</script>
</head>
<body>
<jsp:include page="top.jsp" />
<div id="position0" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 结账
</div>
<div id="news" class="right-main" style=" 
  padding: 0 20px;margin-left: 200px;
  ">
		<h1>&nbsp;</h1>
		<div class="content" style="position:relative;">
            <form action="PayServlet" method="get" name="form">
                <h3 class="info">收货人信息</h3><br/>
                <input name="addr" id="addr" type="button"  value="添加新地址" />
                <%--<span><%=request.getAttribute("price") %></span>
                --%><span id="span"></span> <br />
                <input name="address" type="radio" id="address0" checked="checked" /><span>${loginuser.address}</span><br />
                <div class="button">  <%--<input type="submit" value="结账" />    --%></div>
                
                
                
                <h3 class="info">支付方式</h3><br/><div id="dialog-confirm" title="请选择支付方式"  >	
	<table style="WIDTH: 100%" >
              <tbody>
                <tr valign="middle">                 
                  <td style="vertical-align:middle; text-align:left ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <img alt="" src="images/y_zfb.gif" class="myimg" /><input name="zfPay" type="radio" value="zfb" checked="checked" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <img  alt=""  src="images/unionpay.gif" class="myimg" /><input name="zfPay"  id="zfPay"
                          type="radio" value="wyzx"  /></td>
                </tr> 
                <tr>
                <td>
                
                </td>
                </tr>              
              </tbody>
            </table>
            <p></p>
            <p></p>
            <p>定单号:<span id="orderNumber"></span></p>
            <p>支付金额:<span id="totalMoney"></span>元</p>
</div>


      <h3 class="info">送货清单</h3>

            </form>
            <div id="tt">
            <button type="submit" class="" id="order-submit" onclick="javascript:submit_Order();">
                提交订单<b></b>
              </button></div>            

            
            
		</div>
	</div>
<div class="clear"></div>
<div id="position1" class="wrap"></div>
<div class="wrap">
	<div id="shopping"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 微冷的雨 All Rights Reserved. 京ICP证1000001号
</div>
</body>

</html>

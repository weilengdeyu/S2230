<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'NewCart.jsp' starting page</title>
    <%--
    
	

  <script type="text/javascript" src="js2/jquery.js"></script>
  
  
  
  --%>
  
  <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="js2/requestAnimationFrame.js"></script>
  <script type="text/javascript" src="js2/jquery.fly.min.js"></script>
  <script type="text/javascript">
            $(function() {
                var offset = $("#icon-cart").offset();
                $(".addcart").click(function(event) {
                    var img = $(this).parent().children('img').attr('src');//获取当前点击图片链接
                    var flyer = $('<img class="flyer-img" src="' + img + '">');//抛物体对象
                    flyer.fly({
                        start: {
                            left: event.pageX, //抛物体起点横坐标
                            top: event.pageY////抛物体起点纵坐标
                        },
                        end: {
                            left: offset.left + 10, //抛物体终点横坐标
                            top: offset.top + 10, //抛物体终点纵坐标
                        },
                        onEnd: function() {
                            $("#tip").show().animate({width: '200px'}, 300).fadeOut(500);//成功加入购物车动画效果
                            this.destory();//销毁抛物体
                        }
                    });
                });
            });
        </script>
  
  
  </head>
  
  <body>
     <div class="head">
            <div class="head_inner">
                <a class="logo" href="http://www.sucaihuo.com">
                    <img alt="素材火logo" src="http://www.sucaihuo.com/Public/images/logo.jpg">
                </a>
            </div>
        </div>
        <div class="container">
            <h2 class="title"><a href="http://www.sucaihuo.com/jquery/demo/1/">jQuery仿天猫完美加入购物车</a></h2>
            <div class="demo clearfix">
                <div class="per">
                    <img src="images2/1.jpg" width="180" height="240" alt="图片二"/>
                    <h3>¥<span>259.00</span></h3>
                    <div class="title">春款真皮坡跟大码单鞋内增高女士鞋子</div>
                    <a href="javascript:void(0);" class="button orange addcart">加入购物车</a>
                </div>
                <div class="per">
                    <img src="images2/2.jpg" width="180" height="240" alt="图片二"/>
                    <h3>¥<span>136.00</span></h3>
                    <div class="title">韩国代购情侣棉衣棉服女款韩版羊羔毛大衣</div>
                    <a href="javascript:void(0);" class="button orange addcart">加入购物车</a>
                </div>
                <div class="per">
                    <img src="images/3.jpg" width="180" height="240" alt="图片三"/>
                    <h3>¥<span>¥728.00</span></h3>
                    <div class="title">冬季运动情侣羽绒棉马甲男士薄马甲</div>
                    <a href="javascript:void(0);" class="button orange addcart">加入购物车</a>
                </div>
                <div class="per">
                    <img src="images/4.jpg" width="180" height="240" alt="图片四"/>
                    <h3>¥<span>119.00</span></h3>
                    <div class="title">原创-城市简约文艺纯色棉麻新中式小立领</div>
                    <a href="javascript:void(0);" class="button orange addcart">加入购物车</a>
                </div>
            </div>
        </div>
        <div class="cart-sidebar">
            <div class="cart">
                <i id="icon-cart"></i>
                <span>购物车</span>
            </div>
        </div>
        <div id="tip">成功加入购物车！</div>
        <div class="foot">
            Powered by sucaihuo.com  本站皆为作者原创，转载请注明原文链接：<a href="http://www.sucaihuo.com" target="_blank">www.sucaihuo.com</a>
        </div>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	var login = "${requestScope.login}"+"d";
    	if(login == "logind"){
    		window.parent.parent.parent.location.href="../login.jsp";
    	}
    </script>
  </head>
  <body>
      <table class="layui-table">
        <thead>
          <tr>
             <th>ID</th>
            <th>订单ID</th>
            <th>商品ID</th>
            <th>数量</th>
            <th>原价格</th>
            <th>现价格</th>
           	<th>备注</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.lists}" var="order">
          <tr>
            <th>${order.id}</th>
             <th>${order.orders_id}</th>
             <th>${order.product_id}</th>
             <th>${order.count}</th>
             <th>${order.price}</th>
             <th>${order.nowprice}</th>
             <th>${order.comments}</th>
            <td class="td-manage">
              <a title="修改"  onclick="x_admin_show('修改','order-view.html')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>

    
  </body>

</html>
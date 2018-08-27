<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
    		window.parent.parent.location.href="../login.jsp";
    	}
    </script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" action="../order_c/insert" method="post">
        
        <div class="layui-form-item">
              <label for="date" class="layui-form-label">
                  <span class="x-red">*</span>日期
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="date" class="layui-input">
              </div>
         </div>
        
        <div class="layui-form-item">
              <label for="code" class="layui-form-label">
                  <span class="x-red">*</span>订单编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="code" class="layui-input">
              </div>
          </div>
        
        <div class="layui-form-item">
              <label for="code" class="layui-form-label">
                  <span class="x-red">*</span>总金额
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="amount" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="code" class="layui-form-label">
                  <span class="x-red">*</span>应付金额
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="nowamount" class="layui-input">
              </div>
          </div>
        
        <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>收货地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="address_id" class="layui-input">
              </div>
          </div>
        
        
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用户
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="user_id" class="layui-input">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label for="status" class="layui-form-label">
                  <span class="x-red">*</span>订单状态
              </label>
              <div class="layui-input-inline">
              <select name="status">
					<option class="layui-input" selected="selected" value="0">未支付</option>
					<option class="layui-input" value="1">已支付</option>
					<option class="layui-input" value="2">已发货</option>
					<option class="layui-input" value="3">已签收</option>
					<option class="layui-input" value="4">退货中</option>
					<option class="layui-input" value="5">已退货</option>
				</select>
              </div>
          </div>
          
          
          
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">备注</label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入内容" name="comments" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" type="button" onclick="add();" >增加</button>
          </div>
      </form>
    </div>
    <script>
    //监听提交
    function add() {
   	  $.post($(".layui-form").attr("action"),$(".layui-form").serialize(),function(json){
   			if(json.status>0){
   				var index=parent.layer.getFrameIndex(window.name);
   				parent.layer.close(index);
   				parent.fresh();
   			}else{
   				alert(json.text);
   				var index=parent.layer.getFrameIndex(window.name);
   				parent.layer.close(index);
   			}
   		},"json");
     }
    </script>
  </body>

</html>
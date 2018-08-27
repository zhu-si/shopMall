<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="../js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	var login = "${requestScope.login}"+"d";
    	if(login == "logind"){
    		window.parent.location.href="../login.jsp";
    	}
    </script>
</head>

<body>
	<div class="x-body">
		<form class="layui-form" action="../operator_c/insert" method="post">
			<div class="layui-form-item">
				<label for="nike" class="layui-form-label"> <span
					class="x-red">*</span>管理员名
				</label>
				<div class="layui-input-inline">
					<input type="text" name="nike" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">
					<span class="x-red">*</span>将会成为您唯一的登入名
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" name="password" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>

			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red"></span>姓名
				</label>
				<div class="layui-input-inline">
					<input type="text" name="name" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red"></span>性别
				</label>
				
				<div class="layui-input-inline">
				<select name="sex">
					<option class="layui-input" selected="selected" value="0">男</option>
					<option class="layui-input" value="1">女</option>
				</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> <span class="x-red">*</span>电话
				</label>
				<div class="layui-input-inline">
					<input type="text" name="tel" class="layui-input">
				</div>

			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red"></span>权限</label>
				<div class="layui-input-block">
					<input type="checkbox" name="power" title="白银 " value="0" checked="checked"> 
					<input type="checkbox" name="power" title="黄金" value="1"> 
					<input type="checkbox" name="power" title="钻石" value="2">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"><spanclass="x-red"></span>状态</label>
				<div class="layui-input-inline">
				<select name="status">
					<option class="layui-input" selected="selected" value="0">在职</option>
					<option class="layui-input" value="1">离职</option>
				</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <spanclass="x-red"></span>备注</label>
				<div class="layui-input-inline">
					<input type="text" name="comments" 	class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" type="button" onclick="add();" >增加</button>
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
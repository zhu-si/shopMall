<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用户修改页</title>
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
    		window.parent.parent.location.href="../login.jsp";
    	}
    </script>
</head>

<body>
	<div class="x-body">
	
	<c:if test="${requestScope.info!=null}">
			<form class="layui-form" action="../user_c/update" method="post">
			<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		<c:if test="${requestScope.info==null}">
			<form class="layui-form" action="../user_c/insert" method="post">
		</c:if>
	
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label"> <span
					class="x-red">*</span>登录邮箱
				</label>
				<div class="layui-input-inline">
					<input type="text" id="L_email" name="email" class="layui-input" value="${requestScope.info.email}">
				</div>
				<div class="layui-form-mid layui-word-aux">
					<span class="x-red">*</span>
				</div>
			</div>

			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" name="password" class="layui-input" value="${requestScope.info.password}">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>

			<div class="layui-form-item">
				<label for="phone" class="layui-form-label"> <span
					class="x-red">*</span>手机
				</label>
				<div class="layui-input-inline">
					<input type="text" name="tel" value="${requestScope.info.tel}" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red"></span>会员等级
				</label>
				<div class="layui-input-inline">
				<select name="level">
				<c:if test="${requestScope.info.level==null}">
					<option class="layui-input" selected="selected" value="0">白银</option>
					<option class="layui-input" value="1">黄金</option>
					<option class="layui-input" value="1">钻石</option>
					<option class="layui-input" value="1">至尊</option>
					<option class="layui-input" value="1">超级</option>
				</c:if>
				<c:if test="${requestScope.info.level==0}">
					<option class="layui-input" selected="selected" value="0">白银</option>
					<option class="layui-input" value="1">黄金</option>
					<option class="layui-input" value="2">钻石</option>
					<option class="layui-input" value="3">至尊</option>
					<option class="layui-input" value="4">超级</option>
				</c:if>
				<c:if test="${requestScope.info.level==1}">
					<option class="layui-input" value="0">白银</option>
					<option class="layui-input" selected="selected" value="1">黄金</option>
					<option class="layui-input" value="2">钻石</option>
					<option class="layui-input" value="3">至尊</option>
					<option class="layui-input" value="4">超级</option>
				</c:if>
				<c:if test="${requestScope.info.level==2}">
					<option class="layui-input" value="0">白银</option>
					<option class="layui-input" value="1">黄金</option>
					<option class="layui-input" selected="selected" value="2">钻石</option>
					<option class="layui-input" value="3">至尊</option>
					<option class="layui-input" value="4">超级</option>
				</c:if>
				<c:if test="${requestScope.info.level==3}">
					<option class="layui-input" value="0">白银</option>
					<option class="layui-input" value="1">黄金</option>
					<option class="layui-input" value="2">钻石</option>
					<option class="layui-input" selected="selected" value="3">至尊</option>
					<option class="layui-input" value="4">超级</option>
				</c:if>
				<c:if test="${requestScope.info.level==4}">
					<option class="layui-input" value="0">白银</option>
					<option class="layui-input" value="1">黄金</option>
					<option class="layui-input" value="2">钻石</option>
					<option class="layui-input" value="3">至尊</option>
					<option class="layui-input" selected="selected" value="4">超级</option>
				</c:if>
				</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red"></span>消费金额
				</label>
				<div class="layui-input-inline">
					<input type="text" name="amount" value="${requestScope.info.amount}" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red"></span>状态</label>
				<div class="layui-input-block">
				<c:if test="${requestScope.info.status==null}">
					<input type="checkbox" name="status" title="活跃" value="0" checked="checked"> 
					<input type="checkbox" name="status" title="潜水" value="1"> 
				</c:if>
					<c:if test="${requestScope.info.status==0}">
					<input type="checkbox" name="status" title="活跃" value="0" checked="checked"> 
					<input type="checkbox" name="status" title="潜水" value="1"> 
				</c:if>
				<c:if test="${requestScope.info.status==1}">
					<input type="checkbox" name="status" title="活跃" value="0" > 
					<input type="checkbox" name="status" title="潜水" value="1" checked="checked"> 
				</c:if>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red"></span>备注
				</label>
				<div class="layui-input-inline">
					<input type="text" name="comments" value="${requestScope.info.comments}"	class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" type="button" onclick="edit();">提交</button>
			</div>
		</form>
	</div>
	<script>
	 //监听提交
    function edit() {
    	 $.post($(".layui-form").attr("action"),$(".layui-form").serialize(),function(json){
    			if(json.status>0){
    				location.href="def";
    			}else{
    				var index=parent.layer.getFrameIndex(window.name);
    				parent.layer.close(index);
    			}
    		},"json");
     }
	</script>
</body>

</html>
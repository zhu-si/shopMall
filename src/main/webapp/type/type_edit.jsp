<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>类型修改页</title>
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

<body >
	<div class="x-body">
	
	<c:if test="${requestScope.info!=null}">
			<form class="layui-form" action="update" method="post">
			<input type="hidden" name="id" value="${requestScope.info1.id}">
		</c:if>
		<c:if test="${requestScope.info==null}">
			<form class="layui-form" action="insert" method="post">
			<input type="hidden" name="parentid" value="${requestScope.parentid}">
		</c:if>
	

			<div class="layui-form-item">
				<label for="name" class="layui-form-label"> <span
					class="x-red">*</span>类别名称:
				</label>
				<div class="layui-input-inline">
					<input type="text" name="name" value="${requestScope.info.name}" class="layui-input">
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
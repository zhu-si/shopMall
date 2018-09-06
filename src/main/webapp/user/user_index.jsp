<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.0</title>
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
    	//用户状态修改
    	function member_run(obj,id){
        	layer.confirm('确认要操作吗？',function(index){
                if($(obj).attr('title')=='停用'){
                  //发异步把用户状态进行更改
                  $(obj).attr('title','启用')
                  $(obj).find('i').html('&#xe62f;');
                  $(obj).parents("tr").find(".th-status").find('span').addClass('layui-btn-disabled').html('已停用');
                  layer.msg('已停用 !');
                }else{
                  $(obj).attr('title','停用')
                  $(obj).find('i').html('&#xe601;');
                  $(obj).parents("tr").find(".th-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                  layer.msg('已启用!');
                }
            });
        }
    	
    </script>
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">用户</a>
			<a> <cite>用户管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right" href="def"
			title="刷新"> <i class="layui-icon" style="line-height: 40px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" action="def" method="post">
				<input type="text" name="txt" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${requestScope.ttt}">
				<button class="layui-btn" type="submit" lay-filter="sreach" style="margin-top:-5px">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<!-- <xblock>
		<button class="layui-btn layui-btn-danger" onclick="delall()">
			<i class="layui-icon"></i>批量删除
		</button>
		<button class="layui-btn" onclick="x_admin_show('添加用户','add')">
			<i class="layui-icon"></i>添加
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：88 条</span> </xblock> -->
		<table class="layui-table">
			<thead>
				<tr>
					<th><input type="checkbox" class="selectall"></th>
					<th>ID</th>
					<th>登录邮箱</th>
					<th>密码</th>
					<th>绑定手机号</th>
					<!-- <th>会员级别</th> -->
					<th>累计消费金额</th>
					<!-- <th>状态</th> -->
					<th>备注</th>
					<!-- <th>操作</th> -->
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="user">
					<tr>
						<th><input type="checkbox" class="chk" myid="${user.id}"></th>
						<th>${user.id}</th>
						<th>${user.email}</th>
						<th>${user.password}</th>
						<th>${user.tel}</th>
						<%-- <c:if test="${user.level==0}">
							<th>白银</th>
						</c:if>
						<c:if test="${user.level==1}">
							<th>黄金</th>
						</c:if>
						<c:if test="${user.level==2}">
							<th>钻石</th>
						</c:if>
						<c:if test="${user.level==3}">
							<th>至尊</th>
						</c:if>
						<c:if test="${user.level==4}">
							<th>超级</th>
						</c:if> --%>
						<th>${user.amount}</th>
						<!-- <th class="th-status"><span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></th> -->
						<th>${user.comments}</th>
						<%-- <th class="td-manage">
							<a onclick="member_run(this,'10001')" href="javascript:;" title="停用"> <i class="layui-icon">&#xe601;</i></a> 
							<a title="修改" onclick="javascript:openwinee(${user.id});"> <i class="layui-icon">&#xe642;</i></a> 
							<a title="删除" href="javascript:del(${user.id});"><i class="layui-icon">&#xe640;</i> </a>
						</th> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page">
			<div>
				<a class="num" onclick="location.href='def?pageno=${prev}'">上一页</a>
				<a class="num" onclick="location.href='def?pageno=${next}'">下一页</a>
			</div>
		</div>

	</div>
	<script>
    
    function openwinee(id) {
    	location.href="../user_c/edit?id="+id;
    }
    
    function fresha() {
    	location.href="../user_c/def";
    }
    
    function openwine(id) {
    	x_admin_show('编辑','edit?id='+id);
    }

    function refresh() {
    	location.href="../user_c/def";
    }

    $(function(){
    	$(".selectall").on("click",function(){
    		if(event.target.checked)
    		$(".chk").prop("checked","checked");
    		else
    		$(".chk").prop("checked","");
    	});
    });

    function delall(id) {
    	if(confirm("确认删除？")){
    		var ids=[];
    		$(".chk").each(function(){
    			if( $(this).prop("checked")){
    				ids.push($(this).attr("myid"));
    			}
    		});
    		
    		if(ids.length==0){
    			alert("请选择行？");
    			return ;
    		}
    		location.href="deleteall?ids="+ids;
    	}
    }

    function del(id) {
    	if(confirm("确认删除？")){
    		location.href="delete?id="+id;
    	}
    }

    </script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员管理</title>
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
<script type="text/javascript">
function openwine(id) {
	x_admin_show('编辑','edit?id='+id);
}
function uppass(id) {
		$.ajax({
			  type: 'POST',
			  url: "uppass",
			  data:{id:id},
			  dataType:"json",
			  success: function(json){
			       if(json.status=="1"){
			    	   alert(json.text);
			       }
			  }
			});
}

function fresh() {
	location.href="../operator_c/def";
}

/* $(function(){
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
} */

/*管理员-状态*/
function member_run(obj, id) {
	layer.confirm('确认要操作吗？', function(index) {
		if ($(obj).attr('title') == '停用') {
			//发异步把用户状态进行更改
			$(obj).attr('title', '启用')
			$(obj).find('i').html('&#xe62f;');
			$(obj).parents("tr").find(".th-status").find('span').addClass(
					'layui-btn-disabled').html('离职');
			layer.msg('已停用 !');
		} else {
			$(obj).attr('title', '停用')
			$(obj).find('i').html('&#xe601;');
			$(obj).parents("tr").find(".th-status").find('span')
					.removeClass('layui-btn-disabled').html('在职');
			layer.msg('已启用!');
		}
	});
}

</script>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">管理员管理</a> <a href="">管理员列表</a>
			<a> <cite>管理员操作</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="def" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="x-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so" action="def" method="post">
				<input type="text" name="txt" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				<button class="layui-btn" type="submit" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
			</form>
		</div>
		<xblock>
		<!-- <button class="layui-btn layui-btn-danger" onclick="delall()"><i class="layui-icon"></i>批量删除</button> -->
		<button class="layui-btn" onclick="x_admin_show('添加用户','../operator/operator-add.jsp','950','440')"><i class="layui-icon"></i>添加</button>
		</xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<!-- <th><input type="checkbox" class="selectall"></th> -->
					<th>ID</th><th>用户名</th><th>姓名</th><th>性别</th><th>电话</th><th>权限</th><th>状态</th><th>备注</th><th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.list}" var="operator">
				<tr>
					<%-- <th><input type="checkbox" class="chk" myid="${operator.id}"></th> --%>
					<th>${operator.id}</th><th>${operator.nike}</th><th>${operator.name}</th>
					<c:if test="${operator.sex==0}"><td>男</td></c:if>
					<c:if test="${operator.sex==1}"><td>女</td></c:if>
					<th>${operator.tel}</th>
					<c:if test="${operator.power==2}"><td>用户管理员</td></c:if>
					<c:if test="${operator.power==1}"><td>商品管理员</td></c:if>
					<c:if test="${operator.power==3}"><td>订单管理员</td></c:if>
					<c:if test="${operator.power==0}"><td>超级管理员</td></c:if>
					<th class="th-status" style="width:70px"><span class="layui-btn layui-btn-normal layui-btn-mini">在职</span></th>
					<th>${operator.comments}</th>
					<th class="td-manage">
						<a onclick="member_run(this,'10001')" href="javascript:;" title="停用"> <i class="layui-icon">&#xe601;</i></a>
						<a title="重置密码"  onclick="javascript:uppass(${operator.id});"> <i class="layui-icon">&#xe642;</i></a> 
						<%-- <a title="修改" onclick="javascript:openwine(${operator.id});" > <i class="layui-icon">&#xe642;</i></a> --%>
						<%-- <a title="删除" href="javascript:del(${operator.id});"><i class="layui-icon">&#xe640;</i></a> --%>
					</th>
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
</body>
</html>
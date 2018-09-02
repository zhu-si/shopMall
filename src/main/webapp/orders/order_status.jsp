<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>订单页面</title>
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
    		window.parent.location.href="../login.jsp";
    	}
    </script>
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
          <input class="layui-input" placeholder="开始日" name="start" id="start">
          <input class="layui-input" placeholder="截止日" name="end" id="end">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delall()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th><input type="checkbox" class="selectall"></th>
            <th>订单ID</th>
            <th>时间</th>
            <th>订单目的状态</th>
            <th>状态文本</th>
            <th>状态数字</th>
            <th>状态金额</th>
           	<th>备注</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="orders">
          <tr>
            <th><input type="checkbox" class="chk" myid="${orders.id}"></th>
             <th>${orders.id}</th>
             <th>${orders.date}</th>
             <th>${orders.code}</th>
             <th>${orders.amount}</th>
             <th>${orders.nowamount}</th>
             <th>${orders.address_id}</th>
             <th>${orders.comments}</th>
            <td class="td-manage">
              <a title="查看" href="javascript:search(${orders.id});">
                <i class="layui-icon">&#xe63c;</i>
              </a>
              <a title="删除" href="javascript:del(${orders.id})"><i class="layui-icon">&#xe640;</i></a>
            </td>
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
    
    function search(id) {
    	x_admin_show('修改','search?id='+id);
    }
    
    function openwin(id) {
    	x_admin_show('修改','edit?id='+id);
    }

    function fresha() {
    	location.href="../product_c/def";
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
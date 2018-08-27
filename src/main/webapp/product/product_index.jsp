<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>商品列表</title>
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
        <form class="layui-form layui-col-md12 x-so" action="def" method="post">
          <input type="text" name="txt"  placeholder="请输入商品名" autocomplete="off" class="layui-input">
          <button class="layui-btn" type="submit" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
      
        <button class="layui-btn layui-btn-danger" onclick="delall()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加商品','add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th><input type="checkbox" class="selectall"></th>
            <th>ID</th>
            <th>商品名</th>
            <th>商品类型</th>
            <th>活动</th>
            <th>提示信息</th>
            <th>促销信息</th>
            <th>原价格</th>
            <th>现价格</th>
            <th>销售数量</th>
            <th>收藏人数</th>
            <th>优先级</th>
            <th>状态</th>
            <th>图片</th>
            <th>备注</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="product">
          <tr>
            <td><input type="checkbox" class="chk" myid="${product.id}"></td>
            <td>${product.id}</td>
            <td>${product.fullname}</td>
            <td>${product.type_id}</td>
            <td>${product.activity}</td>
			<td>${product.tip}</td>
			<td>${product.sale}</td>
			<td>${product.price}</td>
			<td>${product.nowprice}</td>
			<td>${product.salecount}</td>
			<td>${product.collectcount}</td>
			<td>${product.priority}</td>
			<c:if test="${product.status==0}"><td>未出售</td></c:if>
			<c:if test="${product.status==1}"><td>销售中</td></c:if>
			<c:if test="${product.status==2}"><td>已售罄</td></c:if>
            <td><img alt="" src="${product.pics }"></td>
            <td>${product.comments}</td>
            <td class="td-manage">
              <a title="修改" onclick="javascript:openwin(${product.id});"><i class="layui-icon">&#xe642;</i></a>
              <a title="删除" href="javascript:del(${product.id})"><i class="layui-icon">&#xe640;</i></a>
              <a title="下级" href="def?parentid=${type.id}"><i class="layui-icon">&#xe600;</i></a>
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
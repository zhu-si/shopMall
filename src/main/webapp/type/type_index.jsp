<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>分类</title>
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
        <a href="">分类</a>
        <a href="">商品</a>
        <a>
          <cite>列表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="def" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
      	<label>上级：</label><label>${requestScope.path}</label>
        <button class="layui-btn" onclick="javascript:openwin();"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>名称</th>
            <th>上级名称</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="type">
          <tr>
					<th>${type.name}</th><th>${type.parent_name}</th>
            <th class="td-manage">
              <a title="修改" onclick="javascript:openwinee(${type.id});" >
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" href="javascript:del(${type.id});"><i class="layui-icon">&#xe640;</i>              
              </a>
              <a title="下级" href="def?parentid=${type.id}"><i class="layui-icon">&#xe600;</i>
             </a>
            </th>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <script>
    var parentid=${requestScope.parentid};
    function openwinee(id) {
    	location.href="../type_c/edit?id="+id;
    }
    
    function fresha() {
    	location.href="../type_c/def";
    }
    
    function openwin() {
    	location.href="../type_c/add?parentid="+parentid;
    }

    function refresh() {
    	location.href="../type_c/def";
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
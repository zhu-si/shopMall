<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>商品操作</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/xadmin.css">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<link rel="stylesheet" href="../fileupload/css/font-awesome.min.css">

<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/xadmin.js"></script>
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="../fileupload/js/piclist.js"></script>


<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="../ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	var login = "${requestScope.login}" + "d";
	if (login == "logind") {
		window.parent.parent.location.href = "../login.jsp";
	}
	
	layui.use([ 'form' ],function(){
	    var form = layui.form;
		form.on('select(test)',function(data) {
			$(event.target).parent().parent().parent().nextAll().remove();
				     form.render('select');
				$.post("gettypelist",{id : data.value},function(json) {
						    if (json.length>0) {
						    	var select = $("<select lay-filter='test' class='select'></select>");
								var div = $("<div class='layui-input-inline'></div>");
							    var first = $("<option>请选择</option>");
								select.append(first);
								for (var i = 0; i < json.length; i++) {
									select.append($("<option value='"+json[i].id+"'>"+ json[i].name+ "</option>"));
									div.append(select);
									form.render('select');
								}
				                $("#type").append(div);
				                form.render('select');
							} else {
								$(".hiddeninput").val(data.value);
								form.render('select');
								}
						    form.render('select');
                });
         });
 });

</script>



</head>

<body>
	<div class="x-body">

		<c:if test="${requestScope.info!=null}">
			<form class="layui-form" action="../product_c/update" method="post">
				<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		<c:if test="${requestScope.info==null}">
			<form class="layui-form" action="../product_c/insert" method="post">
		</c:if>

		
		<div class="layui-form-item" id="type">
			<label class="layui-form-label" id="select">商品类型</label>
				<input type="hidden" name="type_id" value="${requestScope.info.type_id}" class="hiddeninput" />
					<%-- <c:if test="${requestScope.info==null}"> --%>
					<div class="layui-input-inline">
						<select lay-filter="test" class="select">
							<option>请选择</option>
							<c:forEach items="${requestScope.typelist}" var="r">
								<option value="${r.id}">${r.name}</option>
							</c:forEach>
						</select>
					</div>
				<%-- </c:if> --%>
			<%-- <c:if test="${requestScope.info!=null}"></c:if> --%>
		</div>
		
		
		<%-- <div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>商品类型
			</label>
			<div class="layui-input-inline">
				<input name="type_id" class="layui-input"
					value="${requestScope.info.type_id}">
			</div>
		</div> --%>
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-inline">
				<input type="text" name="fullname" class="layui-input"
					value="${requestScope.info.fullname}">
			</div>
		
			<label class="layui-form-label">活动</label>
			<div class="layui-input-inline">
				<input type="text" name="activity"
					value="${requestScope.info.activity}" class="layui-input">
			</div>
		 </div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">提示信息</label>
			<div class="layui-input-inline">
				<input type="text" name="tip" value="${requestScope.info.tip}" class="layui-input">
			</div>
		
			<label class="layui-form-label">促销信息</label>
			<div class="layui-input-inline">
				<input type="text" name="sale" value="${requestScope.info.sale}" class="layui-input">
			</div>
		</div>

<!-- 
		
 -->
		<div class="layui-form-item">
			<label class="layui-form-label">原价格</label>
			<div class="layui-input-inline">
				<input type="text" name="price" value="${requestScope.info.price}"
					class="layui-input">
			</div>
		
			<label class="layui-form-label">现价格</label>
			<div class="layui-input-inline">
				<input type="text" name="nowprice"
					value="${requestScope.info.nowprice}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">销售数量</label>
			<div class="layui-input-inline">
				<input type="text" name="salecount"
					value="${requestScope.info.salecount}" class="layui-input">
			</div>
		
			<label class="layui-form-label">收藏人数</label>
			<div class="layui-input-inline">
				<input type="text" name="collectcount" value="${requestScope.info.collectcount}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">优先级</label>
			<div class="layui-input-inline">
				<input type="text" name="priority" value="${requestScope.info.priority}" class="layui-input">
			</div>
			
			<label for="name" class="layui-form-label">备注</label>
			<div class="layui-input-inline">
				<input type="text" name="comments" value="${requestScope.info.comments}" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<c:if test="${requestScope.info.status==null}">
					<input type="radio" name="status" title="未出售" value="0"
						checked="checked">
					<input type="radio" name="status" title="出售中" value="1">
					<!-- <input type="radio" name="status" title="已售罄" value="2"> -->
				</c:if>
				<c:if test="${requestScope.info.status==0}">
					<input type="radio" name="status" title="未出售" value="0"
						checked="checked">
					<input type="radio" name="status" title="出售中" value="1">
					<!-- <input type="radio" name="status" title="已售罄" value="2"> -->
				</c:if>
				<c:if test="${requestScope.info.status==1}">
					<input type="radio" name="status" title="未出售" value="0">
					<input type="radio" name="status" title="出售中" value="1"
						checked="checked">
					<!-- <input type="radio" name="status" title="已售罄" value="2"> -->
				</c:if>
				<%-- <c:if test="${requestScope.info.status==2}">
					<input type="radio" name="status" title="未出售" value="0">
					<input type="radio" name="status" title="出售中" value="1">
					<input type="radio" name="status" title="已售罄" value="2"
						checked="checked">
				</c:if> --%>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label for="name" class="layui-form-label">图片</label>
			<div class="layui-upload">
				<blockquote style="margin-top: 10px; height: 92px; width: 70%">
				<div class="picList" name="pics" width="300" height="200+" rows="2" cols="5" style="width:600px">
						<c:forEach items="${requestScope.info.piclist}" var="p">
							<item url="${p}">
						</c:forEach>
					</div>
				</blockquote>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品详情</label>
			<script id="editor" type="text/plain"
				style="width: 300px; height: 200px; margin-top: 50px">${requestScope.info.info}</script>
		</div>
		
		<div class="layui-form-item" style="text-align: center;">
			<label for="L_repass" class="layui-form-label"> </label>
			<button class="layui-btn" type="button" onclick="edit();">提交</button>
		</div>
		</form>
	</div>
	<script>
		//ueditor 编辑器
		var ue = UE.getEditor('editor');
		$(function(){
			var content ="789";
			ue.setContent(content);
		});

		//图片上传
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;
			//监听提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//发异步，把数据提交给php
				$.post("save", $(".layui-form").serialize(), function(date) {
					if (date > 0) {
						layer.alert("保存成功", {
							icon : 6
						},
								function() {
									// 获得frame索引
									var index = parent.layer
											.getFrameIndex(window.name);
									window.parent.location.reload();
									//关闭当前frame
									parent.layer.close(index);
								});
					}
				}, "json");
				return false;
			});
		});

		//监听提交
		function edit() {
			$.post($(".layui-form").attr("action"), $(".layui-form")
					.serialize(), function(json) {
				if (json.status > 0) {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
					parent.fresha();
				} else {
					alert(json.text);
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			}, "json");
		}
	</script>
</body>

</html>
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

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>商品名称
			</label>
			<div class="layui-input-inline">
				<input type="text" name="fullname" class="layui-input"
					value="${requestScope.info.fullname}">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>商品类型
			</label>
			<div class="layui-input-inline">
				<input name="type_id" class="layui-input"
					value="${requestScope.info.type_id}">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>活动
			</label>
			<div class="layui-input-inline">
				<input type="text" name="activity"
					value="${requestScope.info.activity}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>提示信息
			</label>
			<div class="layui-input-inline">
				<input type="text" name="tip" value="${requestScope.info.tip}"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>促销信息
			</label>
			<div class="layui-input-inline">
				<input type="text" name="sale" value="${requestScope.info.sale}"
					class="layui-input">
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>商品详情
			</label>
			<script id="editor" type="text/plain"
				style="width: 300px; height: 200px; margin-top: 50px">${requestScope.info.info}</script>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>原价格
			</label>
			<div class="layui-input-inline">
				<input type="text" name="price" value="${requestScope.info.price}"
					class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>现价格
			</label>
			<div class="layui-input-inline">
				<input type="text" name="nowprice"
					value="${requestScope.info.nowprice}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>销售数量
			</label>
			<div class="layui-input-inline">
				<input type="text" name="salecount"
					value="${requestScope.info.salecount}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"> <span class="x-red">*</span>收藏人数
			</label>
			<div class="layui-input-inline">
				<input type="text" name="collectcount"
					value="${requestScope.info.collectcount}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="name" class="layui-form-label"> <span
				class="x-red"></span>优先级
			</label>
			<div class="layui-input-inline">
				<input type="text" name="priority"
					value="${requestScope.info.priority}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"><span class="x-red"></span>状态</label>
			<div class="layui-input-block">
				<c:if test="${requestScope.info.status==null}">
					<input type="checkbox" name="status" title="未出售" value="0"
						checked="checked">
					<input type="checkbox" name="status" title="出售中" value="1">
					<input type="checkbox" name="status" title="已售罄" value="2">
				</c:if>
				<c:if test="${requestScope.info.status==0}">
					<input type="checkbox" name="status" title="未出售" value="0"
						checked="checked">
					<input type="checkbox" name="status" title="出售中" value="1">
					<input type="checkbox" name="status" title="已售罄" value="2">
				</c:if>
				<c:if test="${requestScope.info.status==1}">
					<input type="checkbox" name="status" title="未出售" value="0">
					<input type="checkbox" name="status" title="出售中" value="1"
						checked="checked">
					<input type="checkbox" name="status" title="已售罄" value="2">
				</c:if>
				<c:if test="${requestScope.info.status==2}">
					<input type="checkbox" name="status" title="未出售" value="0">
					<input type="checkbox" name="status" title="出售中" value="1">
					<input type="checkbox" name="status" title="已售罄" value="2"
						checked="checked">
				</c:if>
			</div>
		</div>

		<div class="layui-form-item">
			<label for="name" class="layui-form-label"> <span
				class="x-red"></span>图片
			</label>
			<div class="layui-upload">
				<blockquote style="margin-top: 10px; height: 92px; width: 70%">
				
				<div class="picList" name="pics" width="300" height="200+" rows="2"
						cols="5">
						<c:forEach items="${requestScope.info.pics}" var="p">
							<item url="${p}">
						</c:forEach>
					</div>
				</blockquote>
				<button class="layui-btn" id="test2" type="button"
					style="margin: 10px 110px">上传</button>
				<input type="hidden" id="imgurls" name="pics" value="${requestScope.info.pics}">
			</div>
		</div>

		<div class="layui-form-item">
			<label for="name" class="layui-form-label"> <span
				class="x-red"></span>备注
			</label>
			<div class="layui-input-inline">
				<input type="text" name="comments"
					value="${requestScope.info.comments}" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
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
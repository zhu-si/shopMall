<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ZHU SHOP 登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
<script type="text/javascript">

if(window.top !== window.self){
	window.top.location = window.location;
}
var a = 0;
function changerimg(o){
	o.src="rcode/img?a="+(a++);
}



</script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">ZHU SHOP 管理登录-${sessionScope.error}</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="operator_c/login">
            <input name="nike" placeholder="用户名"  type="text" required="" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <div class="layui-input" style="height:50px;border: none">
            <input name="code" placeholder="验证码"  type="text"  style="width: 210px;margin-left:-10px;margin-right:25px">
            <img src="rcode/img" onclick="changerimg(this);">
            </div>
            <hr class="hr15">
            <input value="登录" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

</body>
</html>
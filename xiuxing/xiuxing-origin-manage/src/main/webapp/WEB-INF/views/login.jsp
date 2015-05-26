<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>好货到家运营管理系统</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	font-size: 12px;
	color: #666;
}

.login {
	left: 50%;
	top: 50%;
	position: absolute;
}

.login .main {
	width: 550px;
	height: 425px;
	margin: -230px 0 0 -275px;
	background: url(${pageContext.request.contextPath}/images/login_bg.gif) no-repeat bottom left;
	position: relative;
}

.login .main ul {
	width: 450px;
	padding: 170px 0 0 100px;
	height: 200px;
	background: url(${pageContext.request.contextPath}/images/login_head.gif) no-repeat;
}

.login .main li {
	padding-bottom: 8px;
}

.login .inp_btn {
	width: 76px;
	height: 32px;
	background: url(${pageContext.request.contextPath}/images/login_btn.gif) no-repeat;
	padding: 0;
}
</style>
</head>
<body>
	<form name="adminform" style="margin: 0;" action="doLogin.do" method="post">
		<div class="login">
			<div class="main">
				<ul class="col-ul ul_li_sp">
					<li><span>用户名:</span>
					<input tabindex="0" type="text" class="inp_txt w-140" name="name" value="" /><label style="color: red"> <c:out value="${message_login}" /></label></li>
					<li><span>密 码: </span>
					<input tabindex="0" type="password" class="inp_txt w-140" name="password" value="" /></li>
					<!-- 
					<li><span>验证码: </span>
					<img src="" alt="" />
					<input tabindex="0" type="text" class="inp_txt w-140" name="" value="" /></li> -->
					<li><input name="submit" type="submit" class="inp_btn" tabindex="1" value="登录" /></li>
				</ul>
				<p class="col-p a-c">
					<a href="http://www.fuzhifu.com.cn/" target="_blank">好货到家V1.8 2014</a>, All rights reserved
				</p>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		if (window != top)
			top.location.href = location.href;

		$("input[name='username']").focus();
	</script>
</body>
</html>

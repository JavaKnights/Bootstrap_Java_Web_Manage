<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>404</title>

<%-- <style type="text/css">
.pg-unknow-1 {
padding: 600px 0 400px;
background: url("${pageContext.request.contextPath}/images/404_1.jpg") no-repeat center 30px;
/*background-size: 271px 200px;*/
text-align: center;
}
.pg-unknow-2 {
padding: 600px 0 400px;
background: url("${pageContext.request.contextPath}/images/404_2.jpg") no-repeat center 30px;
/*background-size: 271px 200px;*/
text-align: center;

}
</style> --%>
</head>
<body style="">
	<%--  <h1>对不起，系统出错啦！找遍千山万水也没找到您需要的！</h1>  --%>
	<%-- <a href="${pageContext.request.contextPath}/groupbuy/index.do">返回首页</a> --%>
	<div class="" id="pgDiv" style="text-align: center;">
		<!--  <h1 style="font-size: 300px;">404</h1> -->
		<font style="font-size: 300px;">404</font><BR /> <font style="font-size: 100px;"> ERROR </font><BR /> <font style="font-size: 100px;">PAGE NOT FOUND!</font>
	</div>
</body>
<%-- <script type="text/javascript">
function rnd(start, end){
    return Math.floor(Math.random() * (end - start) + start);
}
var flag = rnd(1,3);
if(flag == 2){
	window.document.getElementById("pgDiv").className="pg-unknow-2";
}else{
	window.document.getElementById("pgDiv").className="pg-unknow-1";
}
</script> --%>
</html>

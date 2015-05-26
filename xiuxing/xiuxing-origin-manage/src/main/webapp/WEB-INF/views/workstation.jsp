<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<%@ include file="/WEB-INF/views/commons/commonsjs.jsp"%>



<title>好货到家</title>
</head>
<body scrolling="no" style="text-align: center" align="center">
	<h1 style="margin: 10px;">好货到家运营管理平台首页</h1>

	<script type="text/javascript">
	$(document).ready(function() {
		
		
	});
	
	
	
	</script>
	
	<div id="jplayer"></div>
	<div>
		<h2>查询APP详细统计情况：<a href="http://www.umeng.com/" >友盟</a></h2>
	</div>
	<div class="myacc_c2">
		<div>
			<h2>订单情况统计</h2>
		</div>
		<div>
			<div id="orderTotalDiv"></div>
		</div>

	</div>
	<div class="myacc_c2">
		<div>
			<h2>会员情况统计</h2>
		</div>
		<div>
			<div id="memberTotalDiv"></div>
		</div>
	</div>
	<div style="position: absolute;left: 20%;top: 50%;">
		<div id='canvasDiv'></div>
	</div>
</body>
</html>
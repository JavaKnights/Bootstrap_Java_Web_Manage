<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>
<%@ include file="/WEB-INF/views/commons/commonsjs.jsp"%>
<script type="text/javascript">
	/* function setmain(title,href){
		
		$('.contentFrame').attr('src','href');
		return false;		
	} */
</script>
</head>
<body><%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 中部页面部分 -->
<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
	<!-- 饰品栏 -->
	<!-- START WIDGETS -->
	<div class="row">
		<div class="col-md-3">
			<!-- 时钟饰品 -->
			<!-- START WIDGET CLOCK -->
			<div class="widget widget-info widget-padding-sm">
				<div class="widget-big-int plugin-clock">00:00</div>
				<div class="widget-subtitle plugin-date">Loading...</div>
				<div class="widget-controls">
					<a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="left" title="Remove Widget">
						<span class="fa fa-times"></span>
					</a>
				</div>
				<div class="widget-buttons widget-c3">
					<div class="col">
						<a href="#">
							<span class="fa fa-clock-o"></span>
						</a>
					</div>
					<div class="col">
						<a href="#">
							<span class="fa fa-bell"></span>
						</a>
					</div>
					<div class="col">
						<a href="#">
							<span class="fa fa-calendar"></span>
						</a>
					</div>
				</div>
			</div>
			<!-- END WIDGET CLOCK -->

		</div>
	
		<div class="col-md-3">
			<!-- 系统游客统计 -->
			<!-- START WIDGET SLIDER -->
			<div class="widget widget-default widget-carousel">
				<div class="owl-carousel" id="owl-example">
					<div>
						<div class="widget-title">Total Visitors</div>
						<div class="widget-subtitle">27/08/2014 15:23</div>
						<div class="widget-int">3,548</div>
					</div>
					<div>
						<div class="widget-title">Returned</div>
						<div class="widget-subtitle">Visitors</div>
						<div class="widget-int">1,695</div>
					</div>
					<div>
						<div class="widget-title">New</div>
						<div class="widget-subtitle">Visitors</div>
						<div class="widget-int">1,977</div>
					</div>
				</div>
				<div class="widget-controls">
					<a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget">
						<span class="fa fa-times"></span>
					</a>
				</div>
			</div>
			<!-- END WIDGET SLIDER -->

		</div>
		<div class="col-md-3">
			<!-- 邮件提醒饰品 -->
			<!-- START WIDGET MESSAGES -->
			<div class="widget widget-default widget-item-icon" onclick="location.href='pages-messages.html';">
				<div class="widget-item-left">
					<span class="fa fa-envelope"></span>
				</div>
				<div class="widget-data">
					<div class="widget-int num-count">48</div>
					<div class="widget-title">New messages</div>
					<div class="widget-subtitle">In your mailbox</div>
				</div>
				<div class="widget-controls">
					<a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget">
						<span class="fa fa-times"></span>
					</a>
				</div>
			</div>
			<!-- END WIDGET MESSAGES -->

		</div>
		<div class="col-md-3">
			<!-- 系统注册总人数统计 -->
			<!-- START WIDGET REGISTRED -->
			<div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
				<div class="widget-item-left">
					<span class="fa fa-user"></span>
				</div>
				<div class="widget-data">
					<div class="widget-int num-count">375</div>
					<div class="widget-title">Registred users</div>
					<div class="widget-subtitle">On your website</div>
				</div>
				<div class="widget-controls">
					<a href="#" class="widget-control-right widget-remove" data-toggle="tooltip" data-placement="top" title="Remove Widget">
						<span class="fa fa-times"></span>
					</a>
				</div>
			</div>
			<!-- END WIDGET REGISTRED -->

		</div>
		
	</div>
	<!-- END WIDGETS -->

	<!-- 主要内容展示 比如数据表格，统计图等, 这部分动态可变 -->
	<div class="row">
		<div class="col-md-4">

			<!-- START USERS ACTIVITY BLOCK -->

			<!-- END USERS ACTIVITY BLOCK -->

		</div>
		<div class="col-md-4">

			<!-- START VISITORS BLOCK -->

			<!-- END VISITORS BLOCK -->

		</div>

		<div class="col-md-4">

			<!-- START PROJECTS BLOCK -->

			<!-- END PROJECTS BLOCK -->

		</div>
	</div>

	<div class="row">
		<div class="col-md-8">

			<!-- START SALES BLOCK -->

			<!-- END SALES BLOCK -->

		</div>
		<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-content">
				<ul class="list-inline item-details">
					<li>
						<a href="http://themifycloud.com/downloads/janux-premium-responsive-bootstrap-admin-dashboard-template/">Admin templates</a>
					</li>
					<li>
						<a href="http://themescloud.org">Bootstrap themes</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="col-md-4">

			<!-- START SALES & EVENTS BLOCK -->

			<!-- END SALES & EVENTS BLOCK -->

		</div>
	</div>

	<!-- START DASHBOARD CHART -->
	<div class="chart-holder" id="dashboard-area-1" style="height: 200px;"></div>
	<div class="block-full-width"></div>
	<!-- END DASHBOARD CHART -->

</div>
<!-- END PAGE CONTENT WRAPPER --></body>
</html>
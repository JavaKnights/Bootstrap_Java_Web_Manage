<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>        
		<%@ include file="/WEB-INF/views/commons/top.jsp"%>
        <%@ include file="/WEB-INF/views/commons/commonsjs.jsp"%> 
		<script type="text/javascript">

		     
		</script>                            
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <!-- 左侧栏 -->    
            <!-- START PAGE SIDEBAR -->
            <%@ include file="/WEB-INF/views/commons/leftMenu.jsp"%>

            
            <!-- 中间部分的页面 -->
            <!-- PAGE CONTENT -->
            <div class="page-content">
                
                <!-- 顶部页面 -->
                <!-- START X-NAVIGATION VERTICAL -->
                <%@ include file="/WEB-INF/views/commons/navigation.jsp"%>
                <!-- END X-NAVIGATION VERTICAL -->                     

				<!-- 链接栏页面 -->
                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>                    
                    <li class="active">Dashboard</li>
                </ul>
                <!-- END BREADCRUMB -->                       
                
                <!-- 中部页面部分 -->
                <!-- PAGE CONTENT WRAPPER -->
                <iframe name="contentFrame" src="defaultContent.do" style="border: none; display: block; height: 100%; width: 100%; overflow-y: scroll;" frameborder="0" seamless="seamless"></iframe>     
				<!-- END PAGE CONTENT WRAPPER -->
	    
            </div>        
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->


		<!-- 退出登录 弹出的消息栏 -->
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->

        <!-- START PRELOADS -->
        <audio id="audio-alert" src="${ctx}/joli-admin/audio/alert.mp3" preload="auto"></audio>
        <audio id="audio-fail" src="${ctx}/joli-admin/audio/fail.mp3" preload="auto"></audio>
        <!-- END PRELOADS -->                  
        
    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='${ctx}/joli-admin/js/plugins/icheck/icheck.min.js'></script>        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/scrolltotop/scrolltopcontrol.js"></script>
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/morris/raphael-min.js"></script>
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/morris/morris.min.js"></script>       
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/rickshaw/d3.v3.js"></script>
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/rickshaw/rickshaw.min.js"></script>
        <script type='text/javascript' src='${ctx}/joli-admin/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
        <script type='text/javascript' src='${ctx}/joli-admin/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>                
        <script type='text/javascript' src='${ctx}/joli-admin/js/plugins/bootstrap/bootstrap-datepicker.js'></script>                
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/owl/owl.carousel.min.js"></script>                 
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/moment.min.js"></script>
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- END THIS PAGE PLUGINS-->        
        
        <!-- 自定义JS -->
        <script type="text/javascript" src="${ctx}/resources/project_path.js"></script>

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="${ctx}/joli-admin/js/settings.js"></script>
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins.js"></script>        
        <script type="text/javascript" src="${ctx}/joli-admin/js/actions.js"></script>
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/demo_dashboard.js"></script>
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->         
    </body>
</html>
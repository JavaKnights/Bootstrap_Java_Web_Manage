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

        <!-- START TEMPLATE 
        <script type="text/javascript" src="${ctx}/joli-admin/js/settings.js"></script>-->
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/plugins.js"></script>        
        <script type="text/javascript" src="${ctx}/joli-admin/js/actions.js"></script>
        
        <script type="text/javascript" src="${ctx}/joli-admin/js/demo_dashboard.js"></script>
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->         
    	<script type="text/javascript">
    	//设置按钮的HTML组装
    	var site_settings = '<div class="ts-button">'
    	        +'<span class="fa fa-cogs fa-spin"></span>'
    	    +'</div>'
    	    +'<div class="ts-body">'
    		    +'<div class="ts-title">Themes</div>'
    	        +'<div class="ts-themes">'
    	            +'<a href="#" class="active" data-theme="'+${ctx}+'/joli-admin/css/theme-default.css"><img src="'+${ctx}+'/joli-admin/img/themes/default.jpg"/></a>'            
    	            +'<a href="#" data-theme="'+${ctx}+'/joli-admin/css/theme-brown.css"><img src="'+${ctx}+'/joli-admin/img/themes/brown.jpg"/></a>'
    	            +'<a href="#" data-theme="'+${ctx}+'/joli-admin/css/theme-blue.css"><img src="'+${ctx}+'/joli-admin/img/themes/blue.jpg"/></a>'                        
    	            +'<a href="#" data-theme="'+${ctx}+'/joli-admin/css/theme-white.css"><img src="'+${ctx}+'/joli-admin/img/themes/light.jpg"/></a>'            
    	            +'<a href="#" data-theme="'+${ctx}+'/joli-admin/css/theme-black.css"><img src="'+${ctx}+'/joli-admin/img/themes/black.jpg"/></a>'
    	        +'</div>'
    			+'<div class="ts-title">Layout</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="radio" class="iradio" name="st_layout_boxed" value="0" checked/> Full Width</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="radio" class="iradio" name="st_layout_boxed" value="1"/> Boxed</label>'
    	        +'</div>'
    	        +'<div class="ts-title">Options</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_head_fixed" value="1"/> Fixed Header</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_sb_fixed" value="1" checked/> Fixed Sidebar</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_sb_scroll" value="1"/> Scroll Sidebar</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_sb_right" value="1"/> Right Sidebar</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_sb_custom" value="1"/> Custom Navigation</label>'
    	        +'</div>'
    	        +'<div class="ts-row">'
    	            +'<label class="check"><input type="checkbox" class="icheckbox" name="st_sb_toggled" value="1"/> Toggled Navigation</label>'
    	        +'</div>'
    	        
    	        
    	    +'</div>';
    	    
    	var settings_block = document.createElement('div');
    	    settings_block.className = "theme-settings";
    	    settings_block.innerHTML = site_settings;
    	    document.body.appendChild(settings_block);

    	$(document).ready(function(){

    	    /* Default settings */
    	    var theme_settings = {
    	        st_head_fixed: 0,
    	        st_sb_fixed: 1,
    	        st_sb_scroll: 1,
    	        st_sb_right: 0,
    	        st_sb_custom: 0,
    	        st_sb_toggled: 0,
    	        st_layout_boxed: 0
    	    };
    	    /* End Default settings */
    	    
    	    set_settings(theme_settings,false);    
    	    
    	    $(".theme-settings input").on("ifClicked",function(){
    	        
    	        var input   = $(this);

    	        if(input.attr("name") != 'st_layout_boxed'){
    	                
    	            if(!input.prop("checked")){
    	                theme_settings[input.attr("name")] = input.val();
    	            }else{            
    	                theme_settings[input.attr("name")] = 0;
    	            }
    	            
    	        }else{
    	            theme_settings[input.attr("name")] = input.val();
    	        }

    	        /* Rules */
    	        if(input.attr("name") === 'st_sb_fixed'){
    	            if(theme_settings.st_sb_fixed == 1){
    	                theme_settings.st_sb_scroll = 1;
    	            }else{
    	                theme_settings.st_sb_scroll = 0;
    	            }
    	        }
    	        
    	        if(input.attr("name") === 'st_sb_scroll'){
    	            if(theme_settings.st_sb_scroll == 1 && theme_settings.st_layout_boxed == 0){
    	                theme_settings.st_sb_fixed = 1;
    	            }else if(theme_settings.st_sb_scroll == 1 && theme_settings.st_layout_boxed == 1){
    	                theme_settings.st_sb_fixed = -1;
    	            }else if(theme_settings.st_sb_scroll == 0 && theme_settings.st_layout_boxed == 1){
    	                theme_settings.st_sb_fixed = -1;
    	            }else{
    	                theme_settings.st_sb_fixed = 0;
    	            }
    	        }
    	        
    	        if(input.attr("name") === 'st_layout_boxed'){
    	            if(theme_settings.st_layout_boxed == 1){                
    	                theme_settings.st_head_fixed    = -1;
    	                theme_settings.st_sb_fixed      = -1;
    	                theme_settings.st_sb_scroll     = 1;
    	            }else{
    	                theme_settings.st_head_fixed    = 0;
    	                theme_settings.st_sb_fixed      = 1;
    	                theme_settings.st_sb_scroll     = 1;
    	            }
    	        }
    	        /* End Rules */
    	        
    	        set_settings(theme_settings,input.attr("name"));
    	    });
    	    
    	    /* Change Theme */
    	    $(".ts-themes a").click(function(){
    	        $(".ts-themes a").removeClass("active");
    	        $(this).addClass("active");
    	        $("#theme").attr("href",$(this).data("theme"));
    	        return false;
    	    });
    	    /* END Change Theme */
    	    
    	    /* Open/Hide Settings */
    	    $(".ts-button").on("click",function(){
    	        $(".theme-settings").toggleClass("active");
    	    });
    	    /* End open/hide settings */
    	});

    	function set_settings(theme_settings,option){
    	    
    	    /* Start Header Fixed */
    	    if(theme_settings.st_head_fixed == 1)
    	        $(".page-container").addClass("page-navigation-top-fixed");
    	    else
    	        $(".page-container").removeClass("page-navigation-top-fixed");    
    	    /* END Header Fixed */
    	    
    	    /* Start Sidebar Fixed */
    	    if(theme_settings.st_sb_fixed == 1){        
    	        $(".page-sidebar").addClass("page-sidebar-fixed");
    	    }else
    	        $(".page-sidebar").removeClass("page-sidebar-fixed");
    	    /* END Sidebar Fixed */
    	    
    	    /* Start Sidebar Fixed */
    	    if(theme_settings.st_sb_scroll == 1){          
    	        $(".page-sidebar").addClass("scroll").mCustomScrollbar("update");        
    	    }else
    	        $(".page-sidebar").removeClass("scroll").css("height","").mCustomScrollbar("disable",true);
    	    
    	    /* END Sidebar Fixed */
    	    
    	    /* Start Right Sidebar */
    	    if(theme_settings.st_sb_right == 1)
    	        $(".page-container").addClass("page-mode-rtl");
    	    else
    	        $(".page-container").removeClass("page-mode-rtl");
    	    /* END Right Sidebar */
    	    
    	    /* Start Custom Sidebar */
    	    if(theme_settings.st_sb_custom == 1)
    	        $(".page-sidebar .x-navigation").addClass("x-navigation-custom");
    	    else
    	        $(".page-sidebar .x-navigation").removeClass("x-navigation-custom");
    	    /* END Custom Sidebar */
    	    
    	    /* Start Custom Sidebar */
    	    if(option && option === 'st_sb_toggled'){
    	        if(theme_settings.st_sb_toggled == 1){
    	            $(".page-container").addClass("page-navigation-toggled");
    	            $(".x-navigation-minimize").trigger("click");
    	        }else{          
    	            $(".page-container").removeClass("page-navigation-toggled");
    	            $(".x-navigation-minimize").trigger("click");
    	        }
    	    }
    	    /* END Custom Sidebar */
    	    
    	    /* Start Layout Boxed */
    	    if(theme_settings.st_layout_boxed == 1)
    	        $("body").addClass("page-container-boxed");
    	    else
    	        $("body").removeClass("page-container-boxed");
    	    /* END Layout Boxed */
    	    
    	    /* Set states for options */
    	    if(option === false || option === 'st_layout_boxed' || option === 'st_sb_fixed' || option === 'st_sb_scroll'){        
    	        for(option in theme_settings){
    	            set_settings_checkbox(option,theme_settings[option]);
    	        }
    	    }
    	    /* End states for options */
    	    
    	    /* Call resize window */
    	    $(window).resize();
    	    /* End call resize window */
    	}

    	function set_settings_checkbox(name,value){
    	    
    	    if(name == 'st_layout_boxed'){    
    	        
    	        $(".theme-settings").find("input[name="+name+"]").prop("checked",false).parent("div").removeClass("checked");
    	        
    	        var input = $(".theme-settings").find("input[name="+name+"][value="+value+"]");
    	                
    	        input.prop("checked",true);
    	        input.parent("div").addClass("checked");        
    	        
    	    }else{
    	        
    	        var input = $(".theme-settings").find("input[name="+name+"]");
    	        
    	        input.prop("disabled",false);            
    	        input.parent("div").removeClass("disabled").parent(".check").removeClass("disabled");        
    	        
    	        if(value === 1){
    	            input.prop("checked",true);
    	            input.parent("div").addClass("checked");
    	        }
    	        if(value === 0){
    	            input.prop("checked",false);            
    	            input.parent("div").removeClass("checked");            
    	        }
    	        if(value === -1){
    	            input.prop("checked",false);            
    	            input.parent("div").removeClass("checked");
    	            input.prop("disabled",true);            
    	            input.parent("div").addClass("disabled").parent(".check").addClass("disabled");
    	        }        
    	                
    	    }
    	}
    		
    	</script>
    </body>
</html>
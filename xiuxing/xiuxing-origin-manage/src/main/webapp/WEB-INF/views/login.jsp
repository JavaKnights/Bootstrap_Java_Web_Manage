<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html><html lang="zh-CN" class="body-full-height">
  <head>
  	<!-- META SECTION -->
    <title>Joli Admin - Responsive Bootstrap Admin Template</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- END META SECTION -->
    
	<%@ include file="/WEB-INF/views/commons/commonsjs.jsp"%>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
    	
    	
    </script>
  </head>

  <body>

    <div class="login-container lightmode">
        
            <div class="login-box animated fadeInDown">
                <div class="login-logo"></div>
                <div class="login-body">
                    <div class="login-title"><strong>登录</strong>后台管理系统</div>
                    <form action="doLogin.do" class="form-horizontal" method="post">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="用户名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="密码"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <a href="#" class="btn btn-link btn-block">忘记密码?</a>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-info btn-block">登录</button>
                        </div>
                    </div>
                    <!-- 
                    <div class="login-or">OR</div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <button class="btn btn-info btn-block btn-twitter"><span class="fa fa-twitter"></span> Twitter</button>
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-info btn-block btn-facebook"><span class="fa fa-facebook"></span> Facebook</button>
                        </div>
                        <div class="col-md-4">                            
                            <button class="btn btn-info btn-block btn-google"><span class="fa fa-google-plus"></span> Google</button>
                        </div>
                    </div>
                     -->
                    <div class="login-subtitle">
                       	你还没有账户 ? <a href="#">注册一个</a>
                    </div>
                    </form>
                </div>
                <div class="login-footer">
                    <div class="pull-left">
                        &copy; 2015 枫帝科技
                    </div>
                    <div class="pull-right">
                        <a href="#">关于</a> |
                        <a href="#">声明</a> |
                        <a href="#">联系我们</a>
                    </div>
                </div>
            </div>
            
        </div>
  </body>
</html>


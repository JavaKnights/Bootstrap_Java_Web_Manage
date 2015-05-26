<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link href="css/admin.css" type="text/css" rel="stylesheet" media="all" />
<title>好货到家管理平台</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
<%@ include file="/WEB-INF/views/commons/commonsjs.jsp"%>
<style type="text/css">
body {
	padding-left: 160px;
	background: #f8f8f9 url(images/left_bg.gif) repeat-y left;
}

html, body {
	height: 100%;
	position: relative;
}
</style>

<script type="text/javascript">
	//$.dialog.setConfig('base', 'http://www.fuzhifu.com.cn');
	var isSetSearchWordColor = 0;
	function setSearchWordColor(keywords) {
		if (isSetSearchWordColor) {
			return;
		}

		isSetSearchWordColor = 1;
		keywords = keywords.split(" ");

		$("#main").bind(
				"load.search",
				function() {
					$("#main").unbind("load.search");
					var main = this.contentWindow.document;
					$("td span", main).each(
							function() {
								var o = $(this);
								$.each(keywords, function(i, n) {
									var html = o.html();
									html = html.replace(n,
											"<font color='#c60a00'>" + n
													+ "</font>");
									o.html(html);
								});
							});
					isSetSearchWordColor = 0;
				});
	}

	$(function() {
		initMenu();
		shortcut.getShortcut();
	});

	window.topMenu = {};//保存每个tip对于的菜单导航id
	window.currentMenu;//保存当前菜单对应的导航id

	function getMenu(id, obj) {
		$("#nav li").removeClass("on");
		$(obj).addClass("on");
		changeMenu(id);
		currentMenu = id;
		$("#main").attr("src", $("#" + id + " .on").attr("href"));
	}

	function changeMenu(id) {
		$("#menu").html($("#" + id).html());
		$("#menu a").click(function() {
			$("#menu a").removeClass("on");
			$(this).addClass("on")
		});
	}
	function initMenu(url) {
		var url = url || "index.do";
		$("#menulist").find('a').each(function(i) {
			if (url.indexOf($(this).attr('href')) >= 0) {
				var menuId = $(this).parent().parent().parent().attr("id");
				$("#nav li").removeClass("on");
				$("#" + menuId + "menu").addClass("on");
				$("#" + menuId + " a").removeClass("on");
				$(this).addClass("on");
				changeMenu(menuId);
			}
		})
	}
	//var topMenu=['首页','全局','用户管理','内容管理','模板/插件','数据库管理','百科联盟','模块','站内统计','Map'];
	var shortcut = {
		displayShortcut : function(type) {
			if (type == 'display') {
				$("#shortcut").css("display", 'block');
			} else {
				$("#shortcut").css("display", 'none');
			}
		},
		getShortcut : function() {
			var shortstr = "";
			var html = '';
			$('#menubox input').each(function(i) {
				if (shortstr.indexOf($(this).val()) >= 0) {
					$(this).attr('checked', 'checked');
				}
			})
		},
		clearShortcut : function() {
			$("input[name='menu[]']").attr('checked', '');
		},
		setShortcut : function() {
			var html = '';
			var link = '';
			var shortcutstate = $("input[name='shortcutstate']:checked").length;
			if ($("input[name='menu[]']:checked").length > 5) {
				alert("最多设置5个快捷功能");
				return false;
			}
			$("input[name='menu[]']:checked").each(
					function(i) {
						html += "<li><a href=\"" + $(this).val()
								+ "\" target=\"main\">" + $(this).attr('title')
								+ "</a></li>";
						link += $(this).val() + ',' + $(this).attr('title')
								+ ';';
					});
			$.ajax({
				url : "index.php?admin_setting-shortcut",
				data : {
					link : link,
					shortcutstate : shortcutstate
				},
				cache : false,
				dataType : "xml",
				type : "post",
				async : false,
				success : function(xml) {
					var message = xml.lastChild.firstChild.nodeValue;
					if (message == '1') {
						$("#shortcutmenu").html(html);
						shortcut.displayShortcut('none');
					} else {
						alert('快捷方式保存未成功');
					}
				}
			});
		},
		hideShortcut : function() {
			dispaly = 'none';
			$("#shortcutimg").attr('src', 'images/menu-box_b2.gif');
			if ($("#shortcutmenu").css('display') == 'none') {
				dispaly = 'block';
				$("#shortcutimg").attr('src', 'images//menu-box_b.gif');
			}
			$("#shortcutmenu").css('display', dispaly);
		}
	}

	function onsearch() {

	}

	$(document)
			.ready(
					function() {
						$("form[name=search]")
								.submit(
										function() {
											var input = $(this).find(':text'), keywords = $
													.trim(input.val());

											if (!keywords) {
												alert("请输入要搜索的菜单名称关键字，如 缓存设置 等。");
												input.focus();
												return false;
											} else if (/[`~!@#$%^&*<>'"\/\\]/i
													.test(keywords)) {
												alert("菜单名关键字不要包含特殊字符，如~!@#$%^&*<>'\"\\\/等。");
												input.focus();
												return false;
											}

										});
						//点击左边导航在底部添加tab
						leftliclick = function(obj) {
							$("#iframecollection").children("iframe").css(
									"display", "none");
							$("#iframecollection").children("#" + obj.target)
									.css("display", "block");
							if ($("#navigationcontainer").children("div").is(
									"." + obj.target)) {
								$("#navigationcontainer").children("div").css({
									"background" : "#2379BF",
									"color" : "#fff"
								});
								$("#navigationcontainer").children(
										"div." + obj.target).css({
									"background" : "#fff",
									"color" : "#2379BF"
								});
							} else {
								$("#clonenavigation")
										.children(".navigationtip").clone()
										.appendTo("#navigationcontainer");
								$("#navigationcontainer").children("div:last")
										.addClass(obj.target).show();
								$("#navigationcontainer").children("div:last")
										.children("span").text($(obj).text());
								if ($("#navigationcontainer").width() < $(
										"#navigationcontainer").children("div").length * 100) {
									$("#navigationcontainer").children(
											".navigationtip:first").remove();
								}
								$("#navigationcontainer").children("div").css({
									"background" : "#2379BF",
									"color" : "#fff"
								});
								$("#navigationcontainer").children("div:last")
										.css({
											"background" : "#fff",
											"color" : "#2379BF"
										});
							}
							topMenu[obj.target] = currentMenu;
						}

						//删除tip
						removetip = function(obj, e) {
							$(obj).parent().remove();
							stopBubble(e);
						}

						//显示tip
						showtip = function(obj) {
							var tipclass = $(obj).attr("class").replace(
									"navigationtip ", "");
							$("#iframecollection").children("iframe").css(
									"display", "none");
							$("#iframecollection").children("#" + tipclass)
									.show();
							$("#navigationcontainer").children("div").css({
								"background" : "#2379BF",
								"color" : "#fff"
							});
							$("#navigationcontainer").children("." + tipclass)
									.css({
										"background" : "#fff",
										"color" : "#2379BF"
									});
							$("#" + topMenu[tipclass] + "menu").click();
						}

						//阻止事件冒泡函数
						function stopBubble(e) {
							if (e && e.stopPropagation)
								e.stopPropagation()
							else
								window.event.cancelBubble = true
						}

					});
	
	
	
	
	
	
	
	
	
    //提示不出现在当前iframe页面，而是出现在主页面(iframe之外)右下角
    /* function showTopTip(){
        try{
	        window.top.$.omMessageTip.show({
	            title : '提示',
	            content : 'iframe中的消息弹出到iframe外的主页面中！'
	        });
        }catch(e){
            alert('提示失败！原因是：顶层页面没有引入提示所需要的js。');
        }
    } */

	
	
</script>
</head>
<body scrolling="no">
	<table width="100%" height="100%" style="min-width: 1150px;">
		<tr>
			<td colspan="2" height="76px">
				<div class="head">
					<p class="r a-r t-tips">
	
						<c:out value="${user.sysUserName}" />
						，你好！&nbsp;<a href="system/toChangePwd.do" onclick="leftliclick(this)" target="main0" class="red">修改密码</a>[<a href="logout.do">退出管理中心</a>]
					</p>

					<!-- 
				|<a href="http://www.fuzhifu.com.cn" target="_blank">好货到家</a>
				|<a href="http://t.cn/zTTQgcx" target="_blank">公司邮箱</a>
				|<a href="http://t.cn/zH6Cigc" target="_blank">知识库</a> -->

					<ul id="nav">
						<c:set var="subMenu" value="" scope="page" />

						<c:forEach items="${currentUserAllowPages}" var="currentUserAllowPage">
							<c:if test="${currentUserAllowPage.resourceLevel== 1}">
								<li onclick="getMenu('ac<c:out value="${currentUserAllowPage.authorizeCode }" />',this)" id="ac<c:out value="${currentUserAllowPage.authorizeCode }"/>menu"><a href="javascript:void(0);"><span><c:out value="${currentUserAllowPage.remark }" /></span></a>|</li>
								<!-- 生成子菜单的div -->
								<c:set var="subMenu" value="${subMenu }<div id='ac${currentUserAllowPage.authorizeCode }'><ul>" scope="page" />
								<c:forEach items="${currentUserAllowPages}" var="iteratorPageForSubMenu">

									<c:if test="${iteratorPageForSubMenu.resourceLevel== 2 && iteratorPageForSubMenu.superAuthorizeCode ==currentUserAllowPage.authorizeCode}">

										<c:set var="subMenu" value="${subMenu }<li><a href='${contextPath }${iteratorPageForSubMenu.resource}' target='main${iteratorPageForSubMenu.authorizeCode}'  onclick='leftliclick(this)'" scope="page" />
										<c:if test="${iteratorPageForSubMenu.resource== currentUserAllowPage.resource} ">
											<c:set var="subMenu" value="${subMenu } class='on' " scope="page" />
										</c:if>
										<c:set var="subMenu" value="${subMenu }>${iteratorPageForSubMenu.remark }</a></li>" scope="page" />
									</c:if>


								</c:forEach>
								<c:set var="subMenu" value="${subMenu }</ul></div>" scope="page" />

							</c:if>
						</c:forEach>
					</ul>
				</div>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<div class="left">
					<a href="index.do" class="logo" style="line-height: 100px; font-size: 16px;">好货到家运营管理平台</a>

					<div class="sidebar">
						<div class="menu-box">
							<!--
						<h2><span class="r m-r8"><span onclick="shortcut.displayShortcut('display');">设置</span></span>自定义菜单</h2> -->

							<ul id='shortcutmenu'></ul>
							<!-- 	<p class="menu-box_b"><span onclick="shortcut.hideShortcut()"><img src="images/menu-box_b.gif" id='shortcutimg'/></span></p>-->
						</div>
						<div id='menu'></div>
					</div>

					<div style="display: none" id='menulist'>
						<c:out value="${subMenu }" escapeXml="false" />
						<!-- 
					<div id='user'>
						<ul>
						<li><a href="index.php?admin_setting-baseregister" target="main" >注册设置</a></li>
						<li><a href="index.php?admin_user" target="main"  class="on">管理用户</a></li>
						<li><a href="index.php?admin_regular-groupset" target="main">管理权限</a></li>
						<li><a href="index.php?admin_usergroup" target="main">管理用户组</a></li>
						</ul>
					</div>
				 -->
					</div>
				</div>

			</td>
			<td height="85%" valign="top" id="iframecollection">
				<iframe name="main" id="main" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes" style="width: 100%; height: 95%; overflow: visible;" src="workstation.do"> </iframe>
				<iframe name="main0" id="main0" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes" style="width: 100%; height: 95%;"> </iframe>
				<c:forEach items="${currentUserAllowPages}" var="currentUserAllowPage">
					<c:if test="${currentUserAllowPage.resourceLevel== 1}">
						<c:forEach items="${currentUserAllowPages}" var="iteratorPageForSubMenu">
							<c:if test="${iteratorPageForSubMenu.resourceLevel== 2 && iteratorPageForSubMenu.superAuthorizeCode ==currentUserAllowPage.authorizeCode}">
								<iframe name="main${iteratorPageForSubMenu.authorizeCode}" id="main${iteratorPageForSubMenu.authorizeCode}" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes" style="width: 100%; height: 95%; overflow: visible; display: none;"></iframe>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>


	<div id="navigationtab">
		<div id="navigationcontainer">
			<div class="navigationtip main" onclick="showtip(this);" style="display: block; color: #2379BF; background: #fff;">
				<span>首页</span>
			</div>
		</div>
	</div>

	<id id="clonenavigation">
	<div class="navigationtip" onclick="showtip(this);">
		<div class="closebutton" onclick="removetip(this,event);">+</div>
		<span></span>
	</div>
	</id>



	<div class="tc_bg  tc_map" id="mapbox" style="display: none">
		<div class="tc">
			<h2>
				<a href="javascript:void(0);" class="close" onclick="$('#mapbox').css('display','none')"></a>管理中心导航
			</h2>
			<ul class="col-ul" id="maplist">
			</ul>
		</div>
	</div>
	<p class="copy">好货到家 V1.0</p>
	<script type="text/javascript">
		function loadScript(url, callback) {
			var script = document.createElement("script");
			script.type = "text/javascript";
			script.onload = script.onreadystatechange = function() {
				if (!this.readyState || this.readyState == 'loaded'
						|| this.readyState == 'complete') {
					callback();
				}
			}
			script.src = url;
			document.body.appendChild(script);
		}
	</script>

</body>
</html>
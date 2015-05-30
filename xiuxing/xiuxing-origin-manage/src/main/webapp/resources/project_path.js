//获取当前想了路径全
function getRootPath()   
{   
	var pathName = window.location.pathname.substring(1);   
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));   
	return window.location.protocol + '//' + window.location.host + '/'+ webName + '/';   
}
//获取项目名称
function getProjectName()   
{   
	var pathName = window.location.pathname.substring(1); 
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	return webName;   
}   
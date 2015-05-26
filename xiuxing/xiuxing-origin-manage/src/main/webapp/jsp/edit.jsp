<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="10" cellspacing="0">  
		<tr>    
		<th>Id</th>  
		<th>会员编号</th>  
		<th>手机</th>
		<th>邮箱</th> 
		<th>登陆名</th> 
		<th>上次登陆成功时间</th>   
		<th colspan="2">OP</th>  
		</tr>   
		<tr>   
			<td><input type="text" value="${requestScope.member.id}" /></td>  
			<td><input type="text" value="${requestScope.member.memberNo }" /></td>
			<td><input type="text" value="${requestScope.member.mobile}" /></td>
			<td><input type="text" value="${requestScope.member.email}" /></td>   
			<td><input type="text" value="${requestScope.member.loginName}" /></td>
			<td>${member.lastLoginSuccessTime}</td>  
			<td><a onclick=""  
			href="member/doMemberDelete.do?memberId=${id}"><font  
			color="blue">delete</font></a></td>  
		</tr>  
	</table>
</body>
</html>
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
	<c:if test="${empty requestScope.memberList }">  
		<font color="red">没有员工信息！</font>  
	</c:if>  
	<c:if test="${!(empty requestScope.memberList)}">  
	<table border="1" cellpadding="10" cellspacing="0">  
		<tr>  
		<th>Num</th>  
		<th>Id</th>  
		<th>会员编号</th>  
		<th>手机</th>
		<th>邮箱</th> 
		<th>登陆名</th> 
		<th>上次登陆成功时间</th>   
		<th colspan="2">OP</th>  
		</tr>  
		<c:forEach items="${requestScope.memberList }" var="member" varStatus="s">  
			<tr>  
				<td>${s.count}</td>  
				<td>${member.id}</td>  
				<td>${member.memberNo }</td>
				<td>${member.mobile}</td>
				<td>${member.email}</td>   
				<td>${member.loginName}</td>
				<td>${member.lastLoginSuccessTime}</td>
				     
				<td><a href="toMemberEdit.do?memberId=${member.id}"><font  
				color="blue">edit</font></a></td>  
				<td><a href="doMemberDelete.do?memberId=${member.id}"><font  
				color="blue">delete</font></a></td>  
			</tr>  
		</c:forEach>  
	</table>  
	</c:if>  
	<br>  
	<a href="${pageContext.request.contextPath}">goto login</a>  
</body>
</html>
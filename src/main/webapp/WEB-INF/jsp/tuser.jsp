<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugin/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugin/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugin/jqgrid/i18n/grid.locale-cn.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/plugin/jqgrid/css/ui.jqgrid.css"/>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/plugin/jqgrid/css/ui.jqgrid-bootstarp.css"/>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/plugin/jqgrid/plugins/searchFilter.css"/>
<title>Insert title here</title>

<script language="javascript" type="text/javascript">
function to_page(curr_page) {
	//将传入的页码赋值给表单中的页码文本框
    document.getElementById("current_page").value = curr_page;
	//提交表单，实现带条件的分页查询
    document.forms[0].submit();
    }
</script>
</head>
<body>
<c:if test="${empty requestScope.users }">
		<font color="red">没有员工信息！</font>
	</c:if>
	<div id="pages">
	<form action=" " method="">
	<input type="hidden" name="currentPage" id="current_page" value="${Page.currentPage }" />
	<c:if test="${!(empty requestScope.users)}">
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th>Num</th>
				<th>ID</th>
				<th>账户名</th>				
				<th>邮箱账户名</th>
				<th>密码</th>
				<th>用户状态</th>
				<th>注册时间</th>
				<th>锁定时间</th>
				<th>登入状态</th>
				<th>上次登入时间</th>
				<th>退出时间</th>				
				<th>备注 </th>
				<th>删除标志</th>								
				<th colspan="2">OP</th>
			</tr>
			<c:forEach items="${requestScope.users }" var="user" varStatus="s">
				<tr>
					<td>${s.count}</td>
					<td>${user.id}</td>
					<td>${user.accountName}</td>
					<td>${user.usernameEmail}</td>
					<td>${user.password}</td>
					<td>${user.userStatus}</td>					
					<td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${user.lockedTime}" pattern="yyyy-MM-dd" /></td>
					<td>${user.loginStatus}</td>	
					<td><fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${user.logoutTime}" pattern="yyyy-MM-dd" /></td>
					<td>${user.comment}</td>
					<td>${user.deleteFlag}</td>
					<td><a onclick="return false"
						href="${pageContext.request.contextPath}/user/save.action?id=${user.id}"><font
							color="blue">edit</font></a></td>
					<td><a 
						href="${pageContext.request.contextPath}/user/delete/${user.id}.action"><font
							color="blue">delete</font></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<a href="javascript:to_page(1);">首页</a> 
					<c:choose>
						<c:when test="${Page.currentPage==1}">
							<a href="#">上一页</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:to_page(${Page.currentPage-1});">上一页</a>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="1" end="${Page.totalPage}" var="p">
						<c:choose>
							<c:when test="${p==Page.currentPage}">
								<a href="javascript:to_page(${p});" class="current_page">${p}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:to_page(${p});">${p}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${Page.currentPage==Page.totalPage}">
							<a href="#">下一页</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:to_page(${Page.currentPage+1});">下一页</a>
						</c:otherwise>
					</c:choose>
					<a href="javascript:to_page(${Page.totalPage});">末页</a>
	</form>	
	</div>		
	<br>
	<a href="${pageContext.request.contextPath}">goto login</a>	
</body>
</html>
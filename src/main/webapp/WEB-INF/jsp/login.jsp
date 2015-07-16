<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="Stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/style/login.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugin/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
//刷新验证码
function refreshCaptcha() {  
    $('#captchaImg').hide().attr(  
            'src',  
            '<c:url value="/j_captcha.jpg"/>' + '?' + Math  
                    .floor(Math.random() * 100)).fadeIn();  
}  
</script>
</head>
<body onload='document.loginForm.username.focus();'>
	<div id="login-box">
		<h3>Login with Username and Password</h3>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'">
			<table>
				<tr>
					<td>username:</td>
					<td><input type='text' name='username' id="username" /></td>
				</tr>
				<tr>
					<td>password:</td>
					<td><input type='password' name='password' id="password" /></td>
				</tr>
				<tr>
					<td>captcha:</td>
					<td><input name="j_captcha" type="text" id="j_captcha" class="j_captcha" /></td>
					<td><img id="captchaImg" src="<c:url value='/j_captcha.jpg'/>"
						style="cursor: pointer;" /></td>
						<td><span style="margin-left: 25px"><a  
                                        href="javascript:refreshCaptcha()">看不清楚换一张</a>  
                                    </span>
                       </td> 
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="登入"></td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>
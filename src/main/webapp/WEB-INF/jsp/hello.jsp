<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
</head>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a> | <a href="admin.action">admin</a>
			</h2>
		</c:if>
	</sec:authorize>

	<sec:authorize access="isAnonymous()">
		<br />
		<h2>
			<a href="login.action">login</a>
		</h2>
	</sec:authorize>

</body>
</html>
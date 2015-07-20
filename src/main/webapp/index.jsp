<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugin/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.liujinhou.com</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style/index.css" />
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="head-nav">
				<ul class="">
					<li class="active"><a href="index.action">Home</a></li>
					<li><a href="#">文章</a></li>
					<li><a href="#">读书</a></li>
					<li><a href="#">代码</a></li>
					<li><a href="login.action">Login</a></li>
					<li><a href="#">Contact</a></li>
					<li><form  class="b-search">
				<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="">
			</form></li>
				</ul>
			</div>
		</div>
	</div>
	<div  class="main">
	    <div  class="main">
	    <p>hello ,world</p>
	    </div>
	</div>	
	<div  class="footer">
    </div>
</body>
</html>
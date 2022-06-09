<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>


<div>
	<h1>mybatis 환경 구성 테스트</h1>
	<hr>
</div>

<div>
	<h2>${messege }</h2>
</div>

</body>
</html>
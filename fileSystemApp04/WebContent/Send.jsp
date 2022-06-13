<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Send.jsp */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>파일시스템 및 파일업로드</h1>
	<hr />
</div>

<div>
	<!-- ● ● 파일은 항상 body에서 form 에서 post 로 전송한다 ● ● -->
	
	<h2>enctype="multipart/form-data" : 파일을 물리적으로 업로드하기위한 필수 속성</h2>
	<hr />
	<h3>파일은 항상 body에서 form 에서 post 로 전송한다</h3>
	
	<!-- enctype="multipart/form-data" : 파일을 물리적으로 업로드하기위한 필수 속성 -->
	<form action="Receive.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name"/> <br />
		
		<!-- 파일 업로드 대화창 구성 -->
		<!-- 『input type="file"』 -->
		파일 : <input type="file" name="upload"/><br />
		<button type="submit">전송</button>
	</form>
</div>













</body>
</html>
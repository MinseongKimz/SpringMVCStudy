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
<title>Write.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>파일업로드 - 단일파일업로드</h1>
	<hr />
</div>

<div>
	<!-- ● ● 파일은 항상 body에서 form 에서 post 로 전송한다 ● ● -->
	
	<h2>enctype="multipart/form-data" : 파일을 물리적으로 업로드하기위한 필수 속성</h2>
	<hr />
	<h3>파일은 항상 body에서 form 에서 post 로 전송한다</h3>
	
	<!-- enctype="multipart/form-data" : 파일을 물리적으로 업로드하기위한 필수 속성 -->
	<form action="Test_ok.jsp" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="userName" /> <br />
		제목 : <input type="text" name="subject" /> <br />
		파일 : <input type="file" name="uploadFile" /> <br />
		<br />
		
		<button type="submit">파일올리기</button>
	</form>
</div>













</body>
</html>
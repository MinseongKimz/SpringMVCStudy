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
<title>MemberList.jsp</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<style type="text/css">
	*{line-height: 150%;}
	#customers td {text-align: center;}
	#submitBtn 
	{
		height: 150%;
		width: 250px;
		font-size: 18px;
		font-weight: bold;
		font-family: 맑은 고딕;
		color: #343;
		
	}
	#err
	{
		color: red;
		font-size: small;
		display: none;
	}

</style>
</head>
<body>

<div>
	<h1>회원 관리</h1>
	<hr />
</div>

<div>
	<form action="" method="post">
		이름 <input type="text" name="name" id="name" class="control" required="required"/>
		<br />
		전화 <input type="text" name="telephone" id="telephone" class="control" required="required"/>
		<br />
		<button type="button" id="submitBtn">회원 추가</button>
		<span id="err">모든 항목을 입력해야 합니다.</span>
	</form>
	<br />
	<!-- EL 표현에 의한 인원수 출력 부분 -->
	<p>전체 인원 수 : ${count }</p>
	
	<table id="customers" style="width: 500px;">
		<tr>
			<th>번호</th><th>이름</th><th>전화</th>
		</tr>
		
		<c:forEach var="dto" items="${memberList }">
		<tr>
			<td>${dto.mid }</td>
			<td>${dto.name }</td>
			<td>${dto.telephone }</td>
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>
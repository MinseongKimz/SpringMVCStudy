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
<title>EmployeeMenu.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
</head>
<body>

<!--
	⑬ EmployeeMenu.jsp
	메인 메뉴 페이지 구성
	로그아웃 기능 포함
  -->
  
<%-- <span>${sessionScope.admin==null ? "nomal":"admin"}</span>   --%>
  
<div id = "menu">
	<ul>
		<c:choose>
			<c:when test="${sessionScope.admin==null }">
			<li>
				<a href="emplist.action" class="menu">직원 정보</a>
			</li>
			<li>
				<a href="regionlist.action" class="menu">지역 정보</a>
			</li>
			<li>
				<a href="departmentlist.action" class="menu">부서 정보</a>
			</li>
			<li>
				<a href="positionlist.action" class="menu">직위 정보</a>
			</li>
			</c:when>
			
			<c:otherwise>
			<li>
				<a href="employeelist.action" class="menu">직원 관리</a>
			</li>
			<li>
				<a href="regionlist.action" class="menu">지역 관리</a>
			</li>
			<li>
				<a href="departmentlist.action" class="menu">부서 관리</a>
			</li>
			<li>
				<a href="positionlist.action" class="menu">직위 관리</a>
			</li>
			</c:otherwise>
		
		</c:choose>
		
		<li>
			<a href="logout.action" class="menu">로그 아웃</a>
		</li>
		
	</ul>
	
</div>

</body>
</html>
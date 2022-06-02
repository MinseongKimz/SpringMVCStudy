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
<title>RegionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
		   {
		      $(".updateBtn").click(function()
		      {
		         // 테스트
		          //alert("수정 버튼 클릭");
		         
		         
		         
		         // employeeupdateform.action 페이지 요청
		         // employeeId 전송
		         // dao.searchId 로 ID를 통해 해당하는 데이터들을 뷰페이지로 넘김
		         
		         $(location).attr("href", "regionupdateform.action?regionId=" + $(this).val());
		         // this → $(".updateBtn")
		     
		 
		      });
		      
		      $(".deleteBtn").click(function()
		      {
		         // 테스트
		          //alert("삭제 버튼 클릭");
		         
		         if (confirm("현재 선택한 데이터를 삭제하시겠습니까?"))
		         {
		        	 $(location).attr("href", "regiondelete.action?regionId=" + $(this).val());
		         }
		      });
		   });
</script>

</head>
<body>

<div>

  <!-- 메뉴 영역 -->
   <div>
      <c:import url="EmployeeMenu.jsp"></c:import>
   </div>

	<div id="center">
		<c:choose>
			<c:when test="${sessionScope.admin==null }">
			<h1>[지역 목록]</h1>
			<hr />
		</c:when>
		<c:otherwise>
			<h1>[지역 관리]</h1>
			<hr />
	  	<div>
         	<form action="/regioninsertform.action">
            	<input type="button" value="지역 추가" class="btn"
           		 onclick="location.href='regioninsertform.action'">
         	</form>
     	 </div>
			
		</c:otherwise>
		</c:choose>
		
		
		<br /><br />
		
		<c:choose>
			<c:when test="${sessionScope.admin==null }">
			<table id="customers" class="table">
		<!-- REGIONID     
			 REGIONNAME          
			 DELCHECK              
		 -->
			<tr>
				<th>지역ID</th>
				<th>지역이름</th>
			</tr>
			
			<c:forEach var="region" items="${regionList }">
			<tr>
				<td>${region.regionId }</td>	
				<td>${region.regionName }</td>	
			</tr>	
			</c:forEach>
		</table>
		</c:when>
		
		<c:otherwise>
			<table id="customers" class="table">
		<!-- REGIONID     
			 REGIONNAME          
			 DELCHECK              
		 -->
			<tr>
				<th>지역ID</th>
				<th>지역이름</th>
				<th>변경가능</th>
				<th>수정</th>
      			<th>삭제</th>
			</tr>
			
			<c:forEach var="region" items="${regionList }">
			<tr>
				<td>${region.regionId }</td>	
				<td>${region.regionName }</td>	
				<td>${region.delCheck==0 ? "O":"X" }</td>	
				
			<c:if test="${region.delCheck!=0 }">
					<td><button type="button" class="btn updateBtn"
	               	value="${region.regionId }" disabled="disabled">수정</button></td>
	               <td><button type="button" class="btn deleteBtn"
	               	value="${region.regionId }" disabled="disabled">삭제</button></td>
			</c:if>
			
			<c:if test="${region.delCheck==0 }">
				<td><button type="button" class="btn updateBtn"
               	value="${region.regionId }">수정</button></td>
               <td><button type="button" class="btn deleteBtn"
               	value="${region.regionId }">삭제</button></td>
            </c:if>   	
			</tr>	
			</c:forEach>
		</table>
		</c:otherwise>
		</c:choose>
		
		
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
</div>


</body>
</html>
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
<title>Employeeinsertform.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
</head>
<body>



<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$("#submitBtn").click(function()
		{
			if($("#name").val()=="")
			{
				$("#err").html("지역 이름을 써 주세요.");
				$("#err").css("display","inline")
				return;
			}
			
			$("#regionForm").submit();
			
		})
	})

</script>

<!-- RegionInsertForm.jsp  
	직원 데이터 입력 페이지-->



<div>
   <!-- 메뉴 영역 -->
   
   <div>
      <c:import url="EmployeeMenu.jsp"></c:import>
   </div>

   <div id="content">
   
      <h1>[ 지역 추가 ]</h1>
      <hr>
      
      <form action="regioninsert.action" method="post" id="regionForm">
         <table>
            <tr>
               <th>지역 이름</th>
               <td>
                  <input type="text" id="name" name="name" placeholder="이름"/>
               </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            	<br><br>
            	
            	<button type="button" class="btn" id="submitBtn"
            	style="width: 40%; height:30px;" >지역 추가</button>
            	<button type="button" class="btn" id="listBtn"
            	style="width: 40%; height:30px;"
            	onclick="location.href='regionlist.action'">지역 리스트</button>
            	<br><br>
            	
            	<span id="err"
            	style="color: red; font-weight: bold; display: none;"></span>
            	</td>
            </tr>        
         </table>
      
      </form>
      
   </div>
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
   <div id="footer">
      
   </div>
</div>




</body>
</html>
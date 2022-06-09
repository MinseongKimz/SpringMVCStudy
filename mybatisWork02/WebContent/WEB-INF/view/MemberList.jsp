<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MemberList.jsp</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		$(".btnDelete").click(function()
		{
			//alert("gd");
			
			var mid = $(this).val();
			
			if(!confirm("정말 삭제하시겠습니까??")) 
			{
				alert("ㅇㅋ");
			}
			else
			{
				$.post("memberdelete.action" , {mid:mid}, function()
				{
					alert("삭제 완료~");
					location.href="memberlist.action";
				});
			}
		})
	});

</script>


</head>
<body>

<div>
	<h1>회원 정보</h1>
	<hr>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" id="title">
				회원 정보 입력
			</div>
			
			<div class="panel-body">
				<form role="form" action="memberinsert.action" method="post" >
					
					<div class="form-group">
						<label for="name">
							NAME :
						</label>
						<input type="text" class="form-control" id="name" name="name" />
					</div>
					
					<div class="form-group">
						<label for="tel">
							TELEPHONE :
						</label>
						<input type="tel" class="form-control" id="telephone" name="telephone" />
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btnCancel">CANCEL</button>
				</form>
			</div>
			
		</div><!-- close .panel .panel-default -->
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				회원 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>MID</th>
							<th>NAME</th>
							<th>TELEPHONE</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>1</td>
							<td>홍은혜</td>
							<td>010-9999-9999</td>
							<td>
								<button type="button" class="btn btn-default btn-xs btnUpdate">수정</button>
								<button type="button" class="btn btn-default btn-xs btnDelete">삭제</button>
							</td>
						</tr> -->
						
						<c:forEach var="member" items="${list }">
							<tr>
								<td>${member.mid }</td>
								<td>${member.name }</td>
								<td>${member.telephone }</td>
								<td>
									<button type="button" class="btn btn-default btn-xs btnUpdate"
									value="${member.mid }">수정</button>
									<button type="button" class="btn btn-default btn-xs btnDelete"
									value="${member.mid }">삭제</button>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<button type="button" class="btn btn-default btn-sm">
					<!-- Count <span class="badge" role="badge">1</span> -->
					Count <span class="badge" role="badge">${count }</span>
				</button>
			</div><!-- close .panel-body -->
		</div> <!-- close .panel .panel-default -->
	</div>
</div>


</body>
</html>

















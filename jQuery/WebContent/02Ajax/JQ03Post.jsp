<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../common/jquery/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$('#btnLogin2').click(function(){
			$.post(
				'./common/03PostLogin.jsp',
				{
					'user_id':$('#user_id').val(),
					'user_pw':$('#user_pw').val()
				},
				function(responseData){
					console.log(responseData);
					var rData = JSON.parse(responseData);
					if(rData.result==1){
						alert('로그인 성공');
						var disTxt = "<h3>" + rData.user_name
									+ "(" + rData.user_id
									+ ")님 반갑습니다.</h3>";
						$('#loginTable').html(disTxt);
					}
					else{
						alert('로그인 실패');
						var disTxt = "<h3>로그인 실패</h3>";
						
						$('#jsonDisplay').html(disTxt);
					}
				}
			);
		});
	});
	function checkFrm(){
		var f = document.getElementById("loginFrm");
		f.method = "post";
		f.action = "./common/03PostLogin.jsp";
	}
</script>
</head>
<body>
	<div class="container">
	<h2>$.post() 메소드 사용하기</h2>	
	<h3>로그인 구현하기 - JDBC연동X</h3>
	<div class="row" id="loginTable">
		<form id="loginFrm" onsubmit="return checkFrm();">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="user_id" 
							name="user_id" value="kosmo" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" id="user_pw" 
							name="user_pw" value="1234" />
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-danger" 
				id="btnLogin1">
				로그인하기(HTML의submit사용)</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success" 
				id="btnLogin2">
				로그인하기(jQuery의 $.post()사용)</button>
		</form>
	</div>
	<br/>
	<div class="row" id="jsonDisplay">
		JSON 데이터를 뿌려봅시다
	</div>
</div>	
	
</body>
</html>
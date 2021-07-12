<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var loadCode = function(){
			$('#loadView').load('./common/01LoadSub.jsp');
			alert("문서 로드 완료");
		}
		
		$(function(){
			$('#loadTxtBtn').click(function(){
				$('#loadTxt').load('./common/01LoadTxt.txt');
				alert('txt문서 로드 완료');
			});
			
			$('#loadParamBtn').click(function(){
				var radioVar =
					$('input[type="radio"][name="params"]:checked').val();
				var params = {"params":radioVar};
				$('#loadParam').load('/common/01LoadParam.jsp', params);
			});
		});
	</script>
	<style>
		div{
			width:400px; height:100px;
			border:1px solid black; margin-top:50px;
		}
	</style>
</head>
<body>
	<div>
	<h2>$.load() 메소드 사용하기</h2>
	
	<h3>jsp파일 로드하기</h3>	
	<div id="loadView">
		여긴 loadView 입니다.
	</div>
	<button onclick="loadCode();">
		Load()테스트1
	</button>
	
	<h3>txt파일 로드하기</h3>	
	<div id="loadTxt">
		여긴 loadTxt 입니다. 텍스트파일의 내용을
		비동기방식으로 로드합니다.
	</div>
	<button id="loadTxtBtn">
		Load()테스트2
	</button>
	
	<h3>파라미터로 구분해서 로드하기</h3>
	<div id="loadParam">
		파라미터 영역입니다.
	</div>
	<label>
		<input type="radio" name="params" value="good"
			checked />좋은파라미터
	</label>
	<label>
		<input type="radio" name="params" value="bad"
			/>나쁜파라미터
	</label>
	<button id="loadParamBtn">
		Load()테스트3
	</button>
	
	<br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br />
</div>	
	
</body>
</html>
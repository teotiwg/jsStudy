<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		$('#btnXml').click(function(){
			$.get(
				'./common/02NameCard.xml',
				function(data){
					$(data).find("명함").each(function(){
						var html= "<div>이름: " + $(this).find("성명").attr("이름")+"</div>";
						html += "<div>주소: "+$(this).find("주소").text()+"</div>";
						html += "<div>직업: "+$(this).find("직업").text()+"</div>";
						html += "<div>이메일: "+$(this).find("e-mail").text()+"</div>";
						html += "<div>핸드폰: "+$(this).find("Mobile").text()+"</div>";
						html += "<div>전화번호: "+$(this).find("TEL").text()+"</div>";
						html += "<div>카피라이트: "+$(this).find("copyright").text()+"</div>";
						
						$('#xmlDisplay').html(html);
					});
				}
			);
		});
	});
	function locationGo(link){
		window.open(link, '', 'width=500, height=500');
	}
	$('#btnJSP').click(function(){
		$.get(
			'./common/02PrintToday.jsp',
			{
				'msg' : $(this).text(),
				'varStr' : 'jQuery Good'
			},
			function(data){
				alert(data);
				$('#jspDisplay').html(data);
			}
		);
	});
</script>
</head>
<body>
	<div>	
	<h2>$.get() 메소드 사용하기</h2>
	
	<h3>xml파일 읽어오기</h3>
	<button onclick="locationGo('./common/02NameCard.xml');">
		NameCard.xml바로가기
	</button>
	
	<button id="btnXml">
		XML데이터 읽어오기
	</button>
	
	<div class="displayDiv" id="xmlDisplay">
		XML데이터 정보를 디스플레이합니다.
	</div>
	
	
	<h3>jsp파일에서 읽어오기</h3>
	<button onclick="locationGo('common/02PrintToday.jsp?msg=안녕하세요&varStr=jQuery조아효');">
		PrintToday.jsp바로가기
	</button>
	<button id="btnJSP">
		JSP결과 읽어오기
	</button>
	<div class="disDisplay" id="jspDisplay">
		JSP결과를 디스플레이 합니다.
	</div>	
</div>
	
</body>
</html>
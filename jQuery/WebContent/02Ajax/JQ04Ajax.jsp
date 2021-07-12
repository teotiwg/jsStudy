<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../common/jquery/jquery-3.6.0.js"></script>
<script>
/*
	$.ajax() :
	jQuery에서 사용되는 AJAX관련 메소드로 load(), get(), post()
	메소드의 모든 기능 보유하여 활용빈도가 가장 높음
	별도의 인자가 존재 않고, JSON형태의 인자 하나만 존재
	
	인자의 속성)
	url: 요청할 서버의 경로
	type: 요청 시 사용할 전송방식(get/ post)
	dataType: 콜백 데이터의 형식(json, xml, script, text, html 등)
	success: 요청에 성공했을 대 콜백 메소드
	error: 요청에 실패했을 때 콜백 메소드
	contentType: 전송시 사용할 콘텐츠타입(get이냐 post냐에 따라 다름)
	data: 서버로 전송할 파라미터.(JSON형식)		
	*/
	$(function(){
		/*
		해당 메소드는 문서의 로드가 끝난 직후, js파일을 현재 문서에 로드
		즉, load()메소드와 동일한 역할 수행
		*/
		$.ajax({
			url: './common/04JsData.js',
			type: "get",
			dataType: "script", // 콜백 데이터의 형식은 JS로 지정
			// 요청 성공 시 콜백메소드: 무기명 함수형태로 정의
			success: function(resData){
				MyAlert("Hello", " AJAX");
			},
			// 요청 실패시 콜백메소드: 외부함수 형태로 정의
			// 콜백메소드는 매개변수 없이 함수명만 쓸 것 
			error : errFunc
		});
		
		$('#ajaxBtn').click(function(){
			$.ajax({
				// 요청할 서버의 URL
				url: "./common/02PrintToday.jsp",
				// 콜백데이터 형식
				dataType: "html",
				// 요청 시 전송방식
				type: "get",
				// get방식일 때의 콘텐츠 타입
				contentType: "text/html;charset:utf-8",
				// 파라미터
				data: {
					msg:$(this).text(),
					varStr:"$.ajax()메소드 좋아요"
				},
				// 성공, 실패 시의 콜백메소드(함수명만 기술해야 함)
				success: sucFunc,
				error: errFunc
			});
		});
	});
	/*
	요청에 실패할 경우 호출되는 콜백메소드 정의
	반드시 jQuery영역이 아닌 JS영역에 순수 함수로 정의 필요
	*/
	function errFunc(){
		alert("에러발생. 디버깅 요망");
	}
	/*
	요청 성공시 호출한 콜백메소드로 jQuery외부에 정의
	함수명만으로 지정하더라고 콜백데이터는 파라미터로 전달받을 수 있음
	*/
	function sucFunc(resData){
		alert("$.ajax()메소드 요청 성공");
		$('#ajaxDisplay').html(resData);
	}
</script>
</head>
<body>
	<h2>$.ajax() 메소드 사용하기</h2>
	
	<button id="ajaxBtn">ajax()메소드실행하기</button>
	
	<div id="ajaxDisplay">
		ajax결과를 여기에 디스플레이
	</div>
	
</body>
</html>
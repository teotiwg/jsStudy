<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Ajax이해하기</h2>
	<script>
		function formSubmit(f){
			f.method="post";
			f.target="hiddenFrame";
			f.cation="./common/00Callback.jsp";
			f.submit();
		}
	</script>
	<div id="CallBackData">
		콜백된 데이터는 여기에 출력
	</div>
	<form action="http://ikosmo.co.kr">
		<input type="submit" value="폼값 전송"/>
	</form>
	<iframe name="hiddenFrame" style="width=300px; height=300px;"></iframe>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Ajax 동작방식 이해</h2>
	<script>
		function formSubmit(f){
			f.method = "post";
			f.target = "hiddenFrame";
			f.action = "./common/00Callback1.jsp";
			f.submit();
		}
	</script>
	<div id="callBackData">
		콜백된 데이터는 여기에 출력
	</div>
	<form onsubmit="return formSubmit(this);">
		<input type="submit" value="폼값전송" />
	</form>
	<iframe name="hiddenFrame" style="display:none; width:300px; height:300px;"></iframe>
</body>
</html>
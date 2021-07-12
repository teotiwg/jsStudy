<%@page import="controller.OracleDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% 
// 폼값받기
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
OracleDAO dao = new OracleDAO();
boolean isMember = dao.isMember(id, pw);
JSONObject json = new JSONObject();
/*
회원 인증 결과에 따른 JSON객체 생성
*/
if(isMember == true){
	json.put("result", 1); // 성공인 경우는 1로 설정
	json.put("message", "로그인 성공");
	
	/*
	콜백 데이터에는 모든 형식의 문자열 사용 가능
	여기선 HTML태그를 콜백데이터의 value로 설정
	*/
	String html = "";
	html+= "<table class='table table-borderd' style='width:300px;'>";
	html+= " <tr>";
	html+= " <td>회원님, 반갑습니다</td>";
	html+= " </tr>";
	html+= "</table>";
	json.put("html",html);
}
else{
	json.put("result", 0); // 성공인 경우 0으로 설정
	json.put("message", "로그인 실패");
}
String jsonStr = json.toJSONString();
out.print(jsonStr);
%>
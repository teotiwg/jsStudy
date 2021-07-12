<%@ page import="org.json.simple.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

JSONObject jsonObj = new JSONObject();

if(user_id.equals("kosmo") && user_pw.equals("1234"))
{
	jsonObj.put("user_id", user_id);
	jsonObj.put("user_name", "홍길동");
	jsonObj.put("user_pw", user_pw);
	jsonObj.put("result", 1);
}
else
{
	jsonObj.put("result", 0);
}
String jsonTxt = jsonObj.toJSONString();
out.println(jsonTxt);
%>

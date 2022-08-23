<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String age_ = request.getParameter("age");
	
	int age = Integer.parseInt(age_);
	
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("id", id);
	jsonObj.put("password", password);
	jsonObj.put("name", name);
	jsonObj.put("age", age);
	
	String jsonStr = jsonObj.toJSONString();
	
%>

id : <span id="span_id"></span><br>
password : <span id="span_password"></span><br>
name : <span id="span_name"></span><br>
age : <span id="span_age"></span><br>

<script>
function aaa(value1) {
	var json_info = JSON.parse(value1);
	$("#span_id").text(json_info.id);
	$("#span_password").text(json_info.password);
	$("#span_name").text(json_info.name);
	$("#span_age").text(json_info.age);
}

aaa('<%= jsonObj %>');
</script>
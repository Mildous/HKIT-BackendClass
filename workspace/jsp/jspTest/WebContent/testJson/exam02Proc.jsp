<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
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
	
	String json_member = jsonObj.toJSONString();
	
	PrintWriter pw = response.getWriter();
	pw.print(json_member);
	pw.flush();
	pw.close();
	return;
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String names[] = request.getParameterValues("name");
	String grade = request.getParameter("grade");
	
	String name = "";
	for(String i : names) {
		name += i + ",";
	}
	name = name.substring(0, name.length()-1);
	out.println("name : " + name + "<br>");
	out.println("grade : " + grade);
%>
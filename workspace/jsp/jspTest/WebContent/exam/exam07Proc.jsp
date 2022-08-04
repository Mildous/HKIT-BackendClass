<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String addr = request.getParameter("addr");
	String[] hobbys = request.getParameterValues("hobby");
	
	out.println("id : " + id + "<br>");
	out.println("pw : " + pw + "<br>");
	out.println("name : " + name + "<br>");
	out.println("grade : " + grade + "<br>");
	out.println("addr : " + addr + "<br>");
	
	String hobby = "";
	for(String i : hobbys) {
			hobby += i + ",";
	}
	hobby = hobby.substring(0, hobby.length()-1);
	
	out.println("hobby : " + hobby + "<br>");
	
	/*
	String hobby = "";
	for(int i=0; i<hobbys.length; i++) {
		if(!hobby.equals("")) {
			hobby += ",";
		}
		hobby += hobbys[i];
	}
	out.println("hobby : " + hobby);
	*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 인코딩
	request.setCharacterEncoding("UTF-8");
	
	String dbId = "kim";
	String dbPw = "1237";
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("pw");
	
	if(id.equals(dbId) && passwd.equals(dbPw)) {
		out.println("로그인 성공");
	} else {
		out.println("로그인 실패");
	}
%>
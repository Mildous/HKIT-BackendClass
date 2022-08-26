<%@page import="config.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ include file="../_include/inc_header.jsp" %>

<%
/*
	String sessionChk = "O";
	if(fileName.equals("list")){
	   sessionChk="X";
	}
	
	if (sessionChk.equals("O") && sessionNo <= 0) {
		out.println("<script>");
		out.println("alert('로그인 후 이용바랍니다.');");
		out.println("location.href='" + request.getContextPath() + "';");
		//out.println("location.href='../main/main.jsp?menuGubun=noLogin_login';");
		out.println("</script>");
		return;
	}
*/
if (sessionNo <= 0) {
	JSFunction.alertLocation("로그인 후 이용바랍니다.", "main.jsp?menuGubun=dashBoard_list", out);
}

%>
    
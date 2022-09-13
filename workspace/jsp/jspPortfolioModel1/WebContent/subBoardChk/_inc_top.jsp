<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="subBoard.model.dao.SubBoardChkDAO"%>
<%@page import="subBoard.model.dto.SubBoardChkDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
if (sessionNo <= 0) {
	out.println("<script>");
	out.println("alert('로그인 후 이용바랍니다.');");
	out.println("location.href='" + request.getContextPath() + "';");
	//out.println("location.href='../main/main.jsp?menuGubun=noLogin_login';");
	out.println("</script>");
	return;
}

if(!sessionId.trim().equals("system")) {
	out.println("<script>");
	out.println("alert('관리자만 이용 가능합니다.');");
	out.println("location.href='" + request.getContextPath() + "';");
	//out.println("location.href='../main/main.jsp?menuGubun=noLogin_login';");
	out.println("</script>");
	return;
}

%>
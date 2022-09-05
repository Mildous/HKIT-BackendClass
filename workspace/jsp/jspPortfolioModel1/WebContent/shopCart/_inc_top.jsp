<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList" %>

<%@ page import = "shopMall.model.dao.CartDAO" %>
<%@ page import = "shopMall.model.dto.CartDTO" %>

<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "../_include/inc_sessionChk.jsp" %>

<%
/*  	if (sessionNo <= 0) {
		out.println("<script>");
		out.println("alert('로그인 후 이용하세요.');");
		out.println("location.href = '" + request.getContextPath() + "';");
		out.println("</script>");
		return;
	} */
%>
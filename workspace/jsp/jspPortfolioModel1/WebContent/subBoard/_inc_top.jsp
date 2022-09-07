<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="subBoard.model.dao.SubBoardDAO"%>
<%@page import="subBoard.model.dto.SubBoardDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	String no_ = request.getParameter("no");
	
	if(no_ == null || no_.trim().equals("")) {
		no_ = "0";
	}
	
	int no = Integer.parseInt(no_);

	String field = request.getParameter("field");
	String word = request.getParameter("word");
	
	// 하나라도 비어있으면 검색X
	int imsiCounter = 0;
	if(field == null || field.trim().equals("")) {
		field = "";
		imsiCounter++;
	}
	if(word == null || word.trim().equals("")) {
		word = "";
		imsiCounter++;
	}
	if(imsiCounter > 0) {
		field = "";
		word = "";
	}
%>
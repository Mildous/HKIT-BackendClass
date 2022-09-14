<%@page import="subBoard.model.dto.SubBoardChkDTO"%>
<%@page import="subBoard.model.dao.SubBoardChkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="subBoard.model.dao.SubBoardDAO"%>
<%@page import="subBoard.model.dto.SubBoardDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	String tbl = request.getParameter("tbl");

	SubBoardChkDAO subBoardChkDao = new SubBoardChkDAO();
	SubBoardChkDTO returnTblDto = subBoardChkDao.getSelectOne(tbl);
	
	String imsiBoardTitle = "";
	if(returnTblDto.getBoardChkNo() > 0) {
		imsiBoardTitle = returnTblDto.getTblName();
	} else {
		out.println("<script>");
		out.println("alert('없는 게시판입니다.\\nHome으로 이동합니다.');");
		out.println("location.href='main.jsp?menuGubun=dashBoard_list';");
		out.println("</script>");
		return;
	}

	String pageNum_ = request.getParameter("pageNum");
	if(pageNum_ == null || pageNum_.trim().equals("")) {
		pageNum_ = "1";
	}
	int pageNum = Integer.parseInt(pageNum_);

	String no_ = request.getParameter("no");
	
	if(no_ == null || no_.trim().equals("")) {
		no_ = "0";
	}
	
	int no = Integer.parseInt(no_);

	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 하나라도 비어있으면 검색X
	int imsiSearchCounter = 0;
	if(searchField == null || searchField.trim().equals("")) {
		searchField = "";
		imsiSearchCounter++;
	}
	if(searchWord == null || searchWord.trim().equals("")) {
		searchWord = "";
		imsiSearchCounter++;
	}
	if(imsiSearchCounter > 0) {
		searchField = "";
		searchWord = "";
	}
%>
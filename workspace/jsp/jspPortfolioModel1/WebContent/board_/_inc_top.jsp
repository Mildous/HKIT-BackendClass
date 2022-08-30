<%@page import="java.util.ArrayList"%>
<%@page import="config.Util"%>
<%@page import="board.model.dao.BoardDAO"%>
<%@page import="board.model.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>

<%
	BoardDTO dto = null;
	BoardDAO dao = null;
	int no = 0;
	
	String pageTitle = "";
	String pageSubject = "";
	String pageContent = "";
	
	if( fileName.equals("write") || fileName.equals("writeProc") || fileName.equals("view") || fileName.equals("edit") || fileName.equals("editProc") || fileName.equals("delete") || fileName.equals("deleteProc")) {
		String no_ = request.getParameter("no");
		if(no_ == null || no_.trim().equals("")) {
			no_ = "0";
		}
		no = Integer.parseInt(no_);
		
		BoardDTO arguDto = new BoardDTO();
		arguDto.setNo(no);
		
		dao = new BoardDAO();
	
		if(fileName.equals("view")) {
			dao.setUpdateHit(arguDto);
		}
		
		dto = dao.getSelectOne(arguDto);
		
		if(fileName.equals("write")) {
			pageTitle = "답변글 작성";
			pageSubject = "[Re]" + dto.getSubject();
			pageContent = dto.getContent();
			if(dto.getNo() == 0) {
				pageTitle = "게시글 작성";
				pageSubject = "";
				pageContent = "";
			}
		}
	}
	
%>
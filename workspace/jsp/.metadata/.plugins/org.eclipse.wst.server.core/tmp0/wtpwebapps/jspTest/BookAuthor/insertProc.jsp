<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	String author = request.getParameter("author");
	
	BookAuthorDTO arguDto = new BookAuthorDTO();
	arguDto.setAuthor(author);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 처리 중 오류가 발생하였습니다..');");
		out.println("location.href = 'insert.jsp';");
		out.println("</script>");
	}
	
%>